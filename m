Received: from vv.carleton.ca ([134.117.143.143])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VQSBe-0006do-5F
 for linux-mtd@lists.infradead.org; Mon, 30 Sep 2013 01:22:11 +0000
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
 [74.125.82.170]) (authenticated bits=0)
 by vv.carleton.ca (8.14.4/8.14.4) with ESMTP id r8U1LgjI013823
 (version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=OK)
 for <linux-mtd@lists.infradead.org>; Sun, 29 Sep 2013 21:21:44 -0400
Received: by mail-we0-f170.google.com with SMTP id w62so4952672wes.29
 for <linux-mtd@lists.infradead.org>; Sun, 29 Sep 2013 18:21:42 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 29 Sep 2013 21:21:42 -0400
Message-ID: <CAE2LqHKQGfR7JwKP43OXARcrX5-RS3Y8SVT5TZgO3+PBOR9X9w@mail.gmail.com>
Subject: Race between mtdconcat and rootfs detection?
From: Catalin Patulea <cat@vv.carleton.ca>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I've got a rootfs on an mtdconcat device and I think I'm seeing a race
between the mtdconcat device coming up and prepare_namespace looking
for the rootfs. Under some circumstances, I get "VFS: Unable to mount
root fs on unknown-block(0,0)" partway into partition detection.

Adding rootwait=5 fixes it, but I would rather not use that in the
long term. I'm trying to find a way to block prepare_namespace from
doing rootfs detection until the mtdconcat comes up (possibly hooks:
device probing, async_synchronize_full). I can provide boot logs if
anyone wishes to double-check the diagnosis.

The mtdconcat is created from an mtd notifier on the contituent mtds.
I can see a few different ways of going from there:

1) Call mtd_device_register synchronously. This causes deadlock
because notifiers run under mtd_table_mutex [1] and
mtd_device_register tries to acquire it a second time.

2) schedule_work(&call_mtd_device_register): this causes the race I
described earlier where device probing "completes", prepare_namespace
looks for the rootfs and panics before mtdconcat comes up.

3) async_schedule(&call_mtd_device_register): This is a potential fix
because prepare_namespace does async_synchronize_full [1]. But
mtd_device_register -> parse_mtd_partitions -> request_module, which
is disallowed in async.

4) Create a driver/device pair. prepare_namespace ->
wait_for_device_probe, which waits for active probes to come down to 0
[3]. But this adds some boilerplate so I would rather leave it as a
last resort.

Any other options I haven't considered? I'm pretty new at kernel
development and not sure what standard practice is for this sort of
thing.

Catalin

[1] http://lxr.linux.no/linux+v3.10.9/drivers/mtd/mtdcore.c#L403
[2] http://lxr.linux.no/linux+v3.10.9/init/do_mounts.c#L551,
http://lxr.linux.no/linux+v3.10.9/drivers/base/dd.c#L356
[3] http://lxr.linux.no/linux+v3.10.9/drivers/base/dd.c#L355
