Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RiDsM-0005sm-1u
 for linux-mtd@lists.infradead.org; Tue, 03 Jan 2012 23:34:38 +0000
Received: by eekc13 with SMTP id c13so16472131eek.36
 for <linux-mtd@lists.infradead.org>; Tue, 03 Jan 2012 15:34:33 -0800 (PST)
Date: Wed, 4 Jan 2012 00:34:46 +0100
From: Emese Revfy <re.emese@gmail.com>
To: dedekind1@gmail.com
Subject: possible use-after-free in drivers/mtd/ubi/wl.c: erase_worker
Message-ID: <20120104003446.695fd426@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I think I found a potential problem in drivers/mtd/ubi/wl.c in
erase_worker():

1050         ubi_err("failed to erase PEB %d, error %d", pnum, err);
1051         kfree(wl_wrk);
1052         kmem_cache_free(ubi_wl_entry_slab, e);
1053
1054         if (err == -EINTR || err == -ENOMEM || err == -EAGAIN ||
1055             err == -EBUSY) {
1056                 int err1;
1057
1058                 /* Re-schedule the LEB for erasure */
1059                 err1 = schedule_erase(ubi, e, 0);

The pointer e is freed at line 1052 (kmem_cache_free), but
later it is passed to schedule_erase which will eventually call
erase_worker where it will be dereferenced and/or freed again.

It seems to have been introduced in commit
784c145444e7dd58ae740d406155b72ac658f151

Emese
