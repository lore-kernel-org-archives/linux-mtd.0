Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBFFC4332F
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Nov 2023 15:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OjYZrRwPSCwGjVV9DO4pF582rbWj10LDqtg7Rser4wY=; b=lc7FGGFxUXMqFb
	glRakc5tE7QP+flOrit9bybU/ypLD5PTHNHbD7yoqxnM1+GlrOzqeYU90KcbTD3mlH/5bKAVNoHRG
	T5juZMYTvaK6ULQQjeF0FJJ9E2mJ78AbPnCEwJPrUymb4Q08ZPzS7PzRkI5qV9RnE6ISEYSChm4J5
	1JSC/VKs98MuPMOWgZfJ3dRxuSorNyBs9bagx7mXyrBngM4Y/7rGE/9AHCchH7Dt28kdl3WFqkBPT
	4KvowW9AhM4zo0Jk7tXOKvBwUQJpKRU9lGkRZmeJl7e530YPEY00RHfkWMnomXXxyO5ABbe34WevB
	4/aOp/Q2sr9FkrMIUtVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2C6A-00CUzV-2Q;
	Sun, 12 Nov 2023 15:10:06 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2C66-00CUyw-1R
	for linux-mtd@lists.infradead.org;
	Sun, 12 Nov 2023 15:10:03 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1r2C5t-0006fq-0O;
	Sun, 12 Nov 2023 15:09:49 +0000
Date: Sun, 12 Nov 2023 15:09:42 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Richard Weinberger <richard@nod.at>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 5/8] mtd: ubi: attach MTD partition from device-tree
Message-ID: <ZVDqtn1uuWrSLXNq@makrotopia.org>
References: <cover.1691717480.git.daniel@makrotopia.org>
 <df8cfc16a0047c1041a8f8d0069c6312bb83da0d.1691717480.git.daniel@makrotopia.org>
 <226381209.31782.1696362327615.JavaMail.zimbra@nod.at>
 <1863543078.49676.1696538801349.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1863543078.49676.1696538801349.JavaMail.zimbra@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_071002_491354_BDF4BFEF 
X-CRM114-Status: GOOD (  24.24  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Richard,

thank you for the review and sorry for my late reply to it.

On Thu, Oct 05, 2023 at 10:46:41PM +0200, Richard Weinberger wrote:
> ----- Urspr=FCngliche Mail -----
> > Von: "richard" <richard@nod.at>
> > ----- Urspr=FCngliche Mail -----
> >> diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
> >> index e0618bbde3613..99b5f502c9dbc 100644
> >> --- a/drivers/mtd/ubi/block.c
> >> +++ b/drivers/mtd/ubi/block.c
> >> @@ -470,7 +470,7 @@ int ubiblock_remove(struct ubi_volume_info *vi, bo=
ol force)
> >> 	}
> >> =

> >> 	/* Found a device, let's lock it so we can check if it's busy */
> >> -	mutex_lock(&dev->dev_mutex);
> >> +	mutex_lock_nested(&dev->dev_mutex, SINGLE_DEPTH_NESTING);
> > =

> > The usage of mutex_lock_nested() in this patch looks fishy.
> > Can you please elaborate a bit more why all these mutexes can be taken =
twice?
> > (Any why not more often).
> =

> I think I figured myself.
> ubiblock_ops->open() and ->release() are both called with disk->open_mute=
x held.
> ubiblock_open() and ubiblock_release() take dev->dev_mutex.
> So, the locking order is open_mutex, followed by dev_mutex.
> =

> On the other hand, ubiblock_remove() is called via UBI notify.
> It takes first dev_mutex and then calls del_gendisk() which will trigger =
ubiblock_ops->release()
> under disk->open_mutex but takes dev_mutex again.
> So, we this not only takes a lock twice but also in reverse order.
> mutex_lock_nested() might silence lockdep but I'm not sure whether this i=
s safe at all.

I agree that the locking here is not trivial.
Taking the same lock twice is that SINGLE_DEPTH_NESTING is intended
for and resolves running into a deadlock otherwise.
I'm not sure if the changed order of acquiring dev_mutex and open_mutex
present a problem.

The detach-by-notification case is anyway quite exotic and I only see
quite synthetic paths to actually get there (such as hotplug removal
of the SPI controller providing access to SPI-NAND flash, which is how
I was testing this...). To make things easier and more aligned with
the original goal (being to attach a UBI device from DT, early enough
to allow its use as NVMEM provider by other drivers) I suggest to for
now only handle attachment by MTD notification (if linux,ubi compatible
is present in DT) and keep handling detachment the way it is now.

This will (just like it is already now) result in "zombie" UBI devices
being present after their MTD device has already been removed. Accessing
them creates loud kernel warnings at best.

Let me know if keeing detachment the way it is and only implementing
attaching from MTD notification and device tree compatible would be ok
with you.

Thank you!


Best regards


Daniel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
