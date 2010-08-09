Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OiZUA-0006Vf-0Q
	for linux-mtd@lists.infradead.org; Mon, 09 Aug 2010 21:02:18 +0000
Received: by pwi9 with SMTP id 9so1778733pwi.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 09 Aug 2010 14:02:16 -0700 (PDT)
MIME-Version: 1.0
Sender: jonringle@gmail.com
Date: Mon, 9 Aug 2010 17:02:16 -0400
Message-ID: <AANLkTikPQfNJ9eZeF6scpnx5beVt=dR6pfNgqcExteMu@mail.gmail.com>
Subject: buffer write error (status 0x90)
From: Jon Ringle <jon@ringle.org>
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

Hello,

We are replacing the discontinued Intel StrataFlash P30 flash
JS28F256P30T95 with the Numonyx P30-65nm flash JS28F256P30TF on our
boards and have a few boards with sample chips. During some testing
one of the boards with the Numonyx flash chip is now reporting the
following buffer write error (status 0x90) on every boot:

[    4.720000] IXP4XX-Flash.0: buffer write error (status 0x90)
[    4.720000] UBI error: nor_erase_prepare: cannot invalidate PEB 62,
write returned -22 read returned 2
[    5.160000] UBI error: erase_worker: failed to erase PEB 62, error -5
[    5.180000] UBI error: erase_worker: bad physical eraseblock 62 detected
[    5.180000] UBI warning: ubi_ro_mode: switch to read-only mode
[    5.200000] UBI error: do_work: work failed with error code -5
[    5.200000] UBI error: ubi_thread: ubi_bgt0d: work failed with error code -5

The chipstatus that is report (0x90) comes from:
		unsigned long chipstatus = MERGESTATUS(status);

But I can't make sense of what 0x90 means.

Thanks,
Jon
