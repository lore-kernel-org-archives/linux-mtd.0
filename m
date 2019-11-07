Return-Path: <SRS0=+z0R=Y7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79AD5C5DF60
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 08:40:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A66621D7B
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 08:40:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H0FY3PZV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="omokBRfo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A66621D7B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IBUhlJSgTlidn952p+QlQjdUDCxjqkYHsSBa+TadfMc=; b=H0FY3PZVIzEuiK
	EHdZ4DrFYXYxwufmBo4EQ5RslKO0LMWqnmw9cj/veCmNLunzSiiB7Hcb2fCK6CJ/CDsCUvcV9at1h
	x+9tWvyZ0pxnhOj18dEBJXDRqMbuKCfnqmXe/FZe/0ZE0w8FPskArUEeQma9iXmYIVkTZK7P6uUDn
	OGv2qGsVUJjX2Obx80SvmzSzsNk7X2iT1SK/jdzeOZ8FypVUFM9aoPTymNcucu0iFR38dbm3vK7xy
	WO2Zqh4UrD4cq34EVrB+LeC6Rkmnlz9rzTlqRper7xwT9zBM0aMUqv2OPhxl8BuZFfjmsfYJpJ80r
	2LMhsh7j6rTREAqDbDwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSdKx-0006jf-OX; Thu, 07 Nov 2019 08:40:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSdKt-0006ho-6M; Thu, 07 Nov 2019 08:40:12 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D1E0C21D79;
 Thu,  7 Nov 2019 08:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573116010;
 bh=UXQJazaBfJV0zIWW7UEoQWPynSR/yhlKvrGLJ29hpro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=omokBRfofB53Ei3yMrIzwz9Z22Rrk3t3SpYs1IPksEG+BpBfYj+fTGT/pWzSe0Ks3
 8X1yjKW9hshlFJG0yVB3Zc98K0aegYpbp+yWGQ2hAjswx6P1cLApcvNc4jaVcFeV2w
 UydpvdtPxRASerQVo0BvKeoXCBM8TaJsia3ZLpzM=
Date: Thu, 7 Nov 2019 09:40:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: gerg@kernel.org
Subject: Re: [PATCH] mtd: rawnand: driver for Mediatek MT7621 SoC NAND flash
 controller
Message-ID: <20191107084007.GA1203521@kroah.com>
References: <20191107073521.11413-1-gerg@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191107073521.11413-1-gerg@kernel.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_004011_257836_ADA38BAD 
X-CRM114-Status: GOOD (  15.85  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, neil@brown.name,
 linux-mediatek@lists.infradead.org, blogic@openwrt.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Nov 07, 2019 at 05:35:21PM +1000, gerg@kernel.org wrote:
> From: Greg Ungerer <gerg@kernel.org>
> 
> Add a driver to support the NAND flash controller of the MediaTek MT7621
> System-on-Chip device. (This one is the MIPS based parts from Mediatek).
> 
> This code is a re-working of the earlier patches for this hardware that
> have been floating around the internet for years:
> 
> https://github.com/ReclaimYourPrivacy/cloak/blob/master/target/linux/ramips/patches-3.18/0045-mtd-add-mt7621-nand-support.patch
> 
> This is a much cleaned up version, put in staging to start with.
> It does still have some problems, mainly that it still uses a lot of the
> mtd raw nand legacy support.

Is that an issue?  Why not just put it in the "real" part of the kernel
then, if those apis are still in use?

> The driver not only compiles, but it works well on the small range of
> hardware platforms that it has been used on so far. I have been using
> for quite a while now, cleaning up as I get time.
> 
> So... I am looking for comments on the best approach forward with this.
> At least in staging it can get some more eyeballs going over it.

staging will just nit-pick it to death for coding style issues, it's not
going to be get any major api changes/cleanups there usually.  I'd
recommend just merging this to the "real" part of the kernel now if it's
working for you.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
