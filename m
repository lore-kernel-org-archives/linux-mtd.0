Return-Path: <SRS0=8A79=FH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB13AC4361B
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 18:23:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 677B8207A8
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 18:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 677B8207A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XPO/HW1swIsnDOqWzpFTz5dYiOlbmC5i+864DR7CRbc=; b=156WiydAOGQCLUaW1yzudxCoF
	OuJIBw3YUnLONyL6++mdOj5crMG86CAUOMI+ma/Q1A92sGYwMYj9sCMRJPIdiVRMEMGA7cu6e5GCE
	/Ejr/lypPpZYPxR5+fq3Z8IOs1LVOBUPxalR4QT2Tx24QItcaBgLnvboomb4Y6wvOHpaNTGumX/i+
	xs1SdKzu1X2/7kQaShjqXLpgmqVguvy+0DNfF/yDU5m5d6THM3WI7GYnD7wBPyJQzeMCUGU9nsHgQ
	i/7iPrzawNxNaIM3QfCUMhxUdqUWcx75fp8Kah3uNxhmsB3Cu2sLquRyRtPTXon8xnb8shnh4SkNO
	MPJskdnXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kktG0-0001nq-HE; Thu, 03 Dec 2020 18:23:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kktFx-0001mY-IJ
 for linux-mtd@lists.infradead.org; Thu, 03 Dec 2020 18:23:06 +0000
Date: Thu, 3 Dec 2020 19:24:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1607019783;
 bh=nRXtesF7itSWsJNL3nW9/JfPzZbpQfZ44W7acNczB0M=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qa40vJsECiADdzvc+lDaBEeTMw1R/jqeFEM51AHxmj44iGPX4tt+7aMXy8oGTMGGd
 xM1zJNaSohmdb5J2tTNpsgkorU2xOE2oGpdB3YC4R7NtpQ9RAhjl82YmVMyMOsx0p1
 C37kca9C4dGklVx5uSSPv1Yzct+qK041zQPJ0+Sc=
From: Greg KH <gregkh@linuxfoundation.org>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v7 1/7] mtd: spi-nor: sst: fix BPn bits for the SST25VF064C
Message-ID: <X8ktStibpw1phn4G@kroah.com>
References: <20201202230040.14009-1-michael@walle.cc>
 <20201202230040.14009-2-michael@walle.cc>
 <44be8e3c-86ca-501e-e575-55f17747bda6@microchip.com>
 <bf31d41ca489b5d1b7976bfb8ede88e9@walle.cc>
 <2c66659b-ecff-c6bb-38c1-c1172780c710@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2c66659b-ecff-c6bb-38c1-c1172780c710@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_132305_860312_8B079763 
X-CRM114-Status: GOOD (  24.62  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, michael@walle.cc, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Dec 03, 2020 at 03:08:49PM +0000, Tudor.Ambarus@microchip.com wrote:
> On 12/3/20 4:39 PM, Michael Walle wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Am 2020-12-03 15:34, schrieb Tudor.Ambarus@microchip.com:
> >> On 12/3/20 1:00 AM, Michael Walle wrote:
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
> >>> the content is safe
> >>>
> >>> This flash part actually has 4 block protection bits.
> >>>
> >>> Reported-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> >>> Cc: stable@vger.kernel.org # v5.7+
> >>
> >> While the patch is correct according to the datasheet, it was
> >> not tested, so it's not a candidate for stable. I would update
> >> the commit message to indicate that the the patch was made
> >> solely on datasheet info and not tested, I would add the fixes
> >> tag, and strip cc-ing to stable.
> > 
> > What is the difference? Any commit with a Fixes tag will also land
> > in the stable trees. Just that it will cause compile errors for
> > kernel older than 5.7.
> > 
> > So if you don't want to have it in stable then you must not add
> > a Fixes: tag either.
> > 
> 
> Documentation/process/stable-kernel-rules.rst doesn't say that the
> Fixes tag is a guarantee that a patch will hit the stable kernels.
> 
> Since this patch was not tested, it's not a candidate for stable as
> per the first rule. It's a theoretical fix, because it should indeed
> fix the locking as per the datasheet. Even for theoretical fixes, I
> would like to know what commit broke the functionality, and that's why
> I asked for the Fixes tag.
> 
> We don't want the patch in stable, so that's why I said that I would
> indicate in the commit message that it was not tested, and that I
> would strip the cc to stable.
> 
> Maybe it's just my understanding. Others may help.

Your understanding is correct.  But note that we might accidentally pick
it up with the Fixes: tag at a later date, so be aware that you might
want to make the text in the changelog really obvious that it should not
go into a stable kernel, and why not (hint, if you have a Fixes: tag,
that's usually a good reason _to_ include it...)

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
