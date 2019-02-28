Return-Path: <SRS0=M8pk=RD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15045C10F00
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Feb 2019 15:34:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBBD1206DD
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Feb 2019 15:34:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iAKg2Ck6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZyqOBJeu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBBD1206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J3hV923QW0f9XNxAaD1OERWqb57efiI8kkBPnkH4Veo=; b=iAKg2Ck6mwoV1t
	sslHLtv3L2+8U443q0frhjeYg5z3Z06fkzQ3SqcKvhmVSCzLZHvrzMJtUdNA7PKKXXplUD+aG5V7Y
	fACYZG0lYSVy/THHx3BV7D356yg9e09w0N8idXofrEyWzeBaK0uQSCy08mX5IFxlvSC8uIY+g2jwT
	fs6VUr6luSZYKlPUC2PEmzT6wpotTyQQq/rIOhq9S5PTHmXkLc/BvNVPieffmX6eTCXm/kL85g2Bg
	CpMMB0w1f0zft58gAQbjNBlXb/uVreBH7nvxwaHO6QiO3rPJgrFsDR+2WwIcKz/d2EcQ4dEnG2CGU
	SAsV9XanS6lwteHEWSFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzNh8-0000un-Vf; Thu, 28 Feb 2019 15:33:58 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzNh6-0000uM-36
 for linux-mtd@lists.infradead.org; Thu, 28 Feb 2019 15:33:57 +0000
Received: by mail-ed1-x544.google.com with SMTP id f2so17309073edy.13
 for <linux-mtd@lists.infradead.org>; Thu, 28 Feb 2019 07:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nFqL9m0NX5qldT2dkDBFsVeaVLfFnnYdcBbOg1N7ftM=;
 b=ZyqOBJeuBg5GlsMZyZwz8S7RSgr4ywieg5HvvDTb2OM5dgFerpqGy5MYcDG5AqvLOC
 3z+Kn8BL3y9q7i8cM9jAZApYoqhI5HUHnyMDeNERqV7U2DKJmUVwS47Y1TscI2124rrC
 CfQSZDrkCTUxT35/xTgwRMBEAWbQsW67zf3280jIotpmbSxQkfwT9D4l1mvmK8s+2Psa
 0r/RHYd2UFRRjPeNoCQCqtvhUHcqL7l+Cjshi4mm2FrxrB4LDaYzUT8WkU5FTCx5hgsc
 DD5OdCj1JIwSpT0Zj4g4DJnj549ClrzgGdekzfIzUotu8gmAPUoV1okPPoeHjrAJZ+wQ
 BBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nFqL9m0NX5qldT2dkDBFsVeaVLfFnnYdcBbOg1N7ftM=;
 b=q0MchxKo7xCvEMyFCH1VTN4U4bUEvj4dP6orqqZzv8fORkNfNpDXr9vpy0Q7Jo3bA0
 eAafx6KZyNbphUWX4G2VuKRI00NQ7mhO236dxxdueBZBtLGIuZs2Cup70+owZB8iuUrQ
 z6MzH/wdOe0YDEhT1/wnbCHVG6+0defYy+BWh/L/An9hAGLXDW3mNHfK6RO3j9dsPpBg
 fJrpgKmkrkgyNZEntt04O0o8vl/X8DO1HUpz3RpJn5uUBsW8Z2Qb6inqwFdm5SqDWD0P
 1gbpV9Of7wn9/zEZMTXvf7EjgDSrXANvQGtWjX1enM0EJY0pV6iBrzzcQPDi8pTh5KyA
 novw==
X-Gm-Message-State: APjAAAWoTLetHJ/oKBgZ70lE47VHM7DGG7HmMG5znWkFBc72UbJbHGBr
 OrJUDznpTjdi9odsDqxgv2s=
X-Google-Smtp-Source: AHgI3IZA5U7K1aXO9b+fYEyV6Z+8egoWf1IqqnsDmzgigj+AuYzZnOJ/ew1i+VvjdnbMDLb+Acgbmw==
X-Received: by 2002:a50:ac09:: with SMTP id v9mr150475edc.3.1551368034136;
 Thu, 28 Feb 2019 07:33:54 -0800 (PST)
Received: from archlinux-ryzen ([2a01:4f9:2a:1fae::2])
 by smtp.gmail.com with ESMTPSA id x16sm4935800edx.89.2019.02.28.07.33.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 28 Feb 2019 07:33:53 -0800 (PST)
Date: Thu, 28 Feb 2019 08:33:51 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] ubi: wl: Silence uninitialized variable warning
Message-ID: <20190228153351.GA26480@archlinux-ryzen>
References: <20190228053551.GB3253@kadam> <8490920.CCJDc82j5X@blindfold>
 <20190228085058.GA5694@archlinux-ryzen>
 <4970018.iuHtFo4yVV@blindfold>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4970018.iuHtFo4yVV@blindfold>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190228_073356_161865_BB52C97B 
X-CRM114-Status: GOOD (  27.05  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, kernel-janitors@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Feb 28, 2019 at 10:51:12AM +0100, Richard Weinberger wrote:
> Am Donnerstag, 28. Februar 2019, 09:50:58 CET schrieb Nathan Chancellor:
> > On Thu, Feb 28, 2019 at 09:35:50AM +0100, Richard Weinberger wrote:
> > > Am Donnerstag, 28. Februar 2019, 06:35:51 CET schrieb Dan Carpenter:
> > > > This condition needs to be fipped around because "err" is uninitialized
> > > > when "force" is set.  The Smatch static analysis tool complains and
> > > > UBsan will also complain at runtime.
> > > > 
> > > > Fixes: 663586c0a892 ("ubi: Expose the bitrot interface")
> > > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> > Tested-by: Nathan Chancellor <natechancellor@gmail.com>
> 
> Did you really test the code or just compile it?
>  

Compiled tested. If I shouldn't use that tag in that instance, please
let me know.

> > This fixes a -Wsometimes-uninitialized warning from Clang:
> > 
> > drivers/mtd/ubi/wl.c:1514:6: warning: variable 'err' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
> >         if (!force) {
> >             ^~~~~~
> > drivers/mtd/ubi/wl.c:1520:6: note: uninitialized use occurs here
> >         if (err == UBI_IO_BITFLIPS || force) {
> >             ^~~
> > drivers/mtd/ubi/wl.c:1514:2: note: remove the 'if' if its condition is always true
> >         if (!force) {
> >         ^~~~~~~~~~~~
> > drivers/mtd/ubi/wl.c:1478:9: note: initialize the variable 'err' to silence this warning
> >         int err;
> >                ^
> >                 = 0
> > 1 warning generated.
> 
> How much false positives does this trigger?
> Many useful gcc warnings are disabled because they produce too much churn.
> 

I haven't gone through them all yet but it doesn't seem to trigger as
often as GCC. I think there are only 22 files with a problem across arm,
arm64, and x86_64 allyesconfig.

> > > > ---
> > > >  drivers/mtd/ubi/wl.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> > > > index 40f838d54b0f..2709dc02fc24 100644
> > > > --- a/drivers/mtd/ubi/wl.c
> > > > +++ b/drivers/mtd/ubi/wl.c
> > > > @@ -1517,7 +1517,7 @@ int ubi_bitflip_check(struct ubi_device *ubi, int pnum, int force)
> > > >  		mutex_unlock(&ubi->buf_mutex);
> > > >  	}
> > > >  
> > > > -	if (err == UBI_IO_BITFLIPS || force) {
> > > > +	if (force || err == UBI_IO_BITFLIPS) {
> > > >  		/*
> > > >  		 * Okay, bit flip happened, let's figure out what we can do.
> > > >  		 */
> > > > 
> > > 
> > > Good catch, Dan!
> > > I thought gcc is supposed to find such issues too. :-/
> > 
> > This isn't the first time GCC hasn't caught something...
> > 
> > https://lore.kernel.org/lkml/20190221222123.GC6474@magnolia/
> 
> Compilers are not perfect. :-)

Would make everyone's life a lot better if they were :)

Nathan

> 
> Thanks,
> //richard
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
