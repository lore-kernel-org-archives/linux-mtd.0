Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eDyKb-0000BP-IL
 for linux-mtd@lists.infradead.org; Sun, 12 Nov 2017 19:54:15 +0000
From: Richard Weinberger <richard@nod.at>
To: Manfred Spraul <manfred@colorfullife.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: UBIFS does not mount after powerfail
Date: Sun, 12 Nov 2017 20:54:03 +0100
Message-ID: <5883680.7ftK6mdJzr@blindfold>
In-Reply-To: <195075f7-01f8-58d2-ba1c-4291e62a39cc@colorfullife.com>
References: <195075f7-01f8-58d2-ba1c-4291e62a39cc@colorfullife.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Manfred,

Am Sonntag, 12. November 2017, 20:26:38 CET schrieb Manfred Spraul:
> Hello together,
> 
> in a power fail stress test with ubifs, I ran into 5 images that do not
> mount:
> 
> 3x ubifs_check_node() fails, called by ubifs_garbage_collect_leb()
> 2x UBIFS assert failed in ubifs_rcvry_gc_commit at 1219 (pid 9570)
> (and ~550 images with just asserts, the mount was successful)
> 
> The test was done using kernel 4.14.0-rc5+ #105 SMP PREEMPT.
> The test involves create/rename/remove, using ecryptfs with xattr.
> 
> Are these known issues?

Nope.
This should not happen at all. ;-(

> Are there any patches that I should apply?

No, 4.14 is recent.

> What would you need to analyze them?

Can you retry without encryptfs and xattr?
xattrs had already some issues, maybe there are more.
Just as a start to know where to start digging.

> If you need the image (~32 MB), I'll try to find a suitable server.
> Below is the dmesg output from mounting the first bad image.

An image would be good but I need one with the 1st generation error.
Can you please make sure the the UBIFS debugfs knob "chk_fs" is set?
If set, UBIFS will check the whole filesystem while mounting.

Thanks,
//richard
