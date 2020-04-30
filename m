Return-Path: <SRS0=Tm4b=6O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B5FC83006
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Apr 2020 07:12:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 390F42082E
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Apr 2020 07:12:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r14RUQhR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="P1/J+ume"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 390F42082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+FoBcYCVQ1Oq3gwBluqSTxHlNXqeQTJ2gY9WW5zwID4=; b=r14RUQhRaPraNP
	iC0D7lDvKdkME+7d/sfCAVEHISbC2jQX7EIjs5pEcH2R9BpdiHFp9rLJWec8QWNXSWTW618Ds0+FH
	m/Chk6wv2LSq4vkNtQK7QY17UqAQyFoEMxIXTfy6iSA7QpkTBa4kJOhmT5rqUX+W59rgpms+1X6dV
	OadkxC51QE09rgpL0sJoxcO4v+Z/RB1EO3nu48AhDOeARWxP3XXFdknRuQc8LxzsH3GbfrhCR44D7
	6Yfzhd0L9n/2+/HM0MvnYqqaIFXsa4XUzpdIhguCkgJM/GQTAnPrB5Ipbjr5EB1WJ+rQnwpxESAb0
	+VfkTmMr3oyNqLT/Y4qA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jU3MG-00040s-R1; Thu, 30 Apr 2020 07:11:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jU3ME-0003zw-4b
 for linux-mtd@lists.infradead.org; Thu, 30 Apr 2020 07:11:43 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 35B382082E;
 Thu, 30 Apr 2020 07:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588230699;
 bh=pNOXaPYGfwN5YuaFisXoPHWYOkR2bfP+m8TNT7K869U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P1/J+ume/5ZXMAGcDwEIy9ayllS5B9qL0YownC6vFIxEfPOVIMQVK+YPOxyPjTH4L
 d0uVBHsa/3iVVcezj8FlasHzXZT82zghDjTO+//lXi61Wz3fjEOQmo8mtaigK4cSG1
 17E0XQLBL1P/POfn4Rd0g3La+Vwl/08rx1RQYWPI=
Date: Thu, 30 Apr 2020 09:11:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Richard Weinberger <richard@nod.at>
Subject: Re: Please queue ubifs: Fix ubifs_tnc_lookup() usage in
 do_kill_orphans() for stable (was: Re: [PATCH] ubifs: Fix ubifs_tnc_lookup()
 usage in do_kill_orphans())
Message-ID: <20200430071137.GA2382543@kroah.com>
References: <20200119215233.7292-1-richard@nod.at>
 <875zdibasg.fsf@vostro.fn.ogness.net>
 <1537701093.171645.1588186266734.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1537701093.171645.1588186266734.JavaMail.zimbra@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200430_001142_200082_CFFC62EE 
X-CRM114-Status: GOOD (  12.43  )
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
Cc: John Ogness <john.ogness@linutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Apr 29, 2020 at 08:51:06PM +0200, Richard Weinberger wrote:
> ----- Urspr=FCngliche Mail -----
> > Von: "John Ogness" <john.ogness@linutronix.de>
> > An: "richard" <richard@nod.at>
> > CC: "linux-mtd" <linux-mtd@lists.infradead.org>, "linux-kernel" <linux-=
kernel@vger.kernel.org>
> > Gesendet: Mittwoch, 29. April 2020 16:56:31
> > Betreff: Re: [PATCH] ubifs: Fix ubifs_tnc_lookup() usage in do_kill_orp=
hans()
> =

> > Hi Richard,
> > =

> > Could you CC this patch to stable? It fixes a serious problem that I am
> > seeing on real devices (i.e. Linux not being able to mount its root
> > filesystem after a power cut). Thanks.
> =

> Just checked again, better ask stable maintainers. :-)
> =

> Stable maintainers, can you please make sure this patch will make it
> into stable?
> The upstream commit is:
> 4ab25ac8b2b5 ("ubifs: Fix ubifs_tnc_lookup() usage in do_kill_orphans()")
> =

> I always thought havings a Fixes-Tag is enough to make sure it will
> get picked up. Isn't this the case?

No it is not, please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

Our scripts are doing better to dig out stuff where maintainers mess up
and forget to put the cc: stable tag, but you can never rely on it.
Please stick with the above rules that have been there for 15+ years :)

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
