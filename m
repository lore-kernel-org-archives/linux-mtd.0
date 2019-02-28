Return-Path: <SRS0=M8pk=RD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F1BC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Feb 2019 08:51:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A47392171F
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Feb 2019 08:51:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ab+kXkgG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVL1Piad"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A47392171F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ivj6w5AErV2ncV36gUp41J5b9nqeYwO7LcBfNrA+Ch8=; b=Ab+kXkgGaBn21p
	DrcGVRgni0RY4GxBJcXG/Q97KLIKSaVEs/kf+mjh+SO/tiArgompSoEcN929M3OfBW4+YeHNDDnSN
	X1zEzV2hD1d67toCFNwIHWQ5XtoZtow/dblCRNqoTHRPqZWkOT63djDIWf2AOJdoAY8Cu/meHVYA/
	QrLoHt48xHfIEa0DDipgqI2K+jT1PW/Zkt4qxu+9u/DKWq02altAtM/W8y2fzWOWQbmneIJWGyQE6
	I3c9ngvOeyoJWfh2uBY7jE567kIIyOs+cZhAyen54wUGyTLRTUG9SOX/z/n29rcc1/N+w4h8IYjZx
	ndD/J3dUeuYBtLXcD4ng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzHPG-0004cq-Kl; Thu, 28 Feb 2019 08:51:06 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzHPD-0004cS-NT
 for linux-mtd@lists.infradead.org; Thu, 28 Feb 2019 08:51:05 +0000
Received: by mail-ed1-x541.google.com with SMTP id a16so16306036edn.1
 for <linux-mtd@lists.infradead.org>; Thu, 28 Feb 2019 00:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=77eEBjpjjNWxRFGKRrG5MZEdWjbph7kv2QlBRsTlWC0=;
 b=BVL1PiadnLi3w8/7IIETR+QxrAWjSLBI/hGe5OzJ2tPYtiUPkjj7nfp8Ae5bO9EmKx
 UiAygZyCX6uTxsatNEmD1+aTkvFkV0GHl0h/frSDyzq4ql7ze8kolKgRJbncodkLEvwn
 1TU8PO5eS9EtCWojajdd5erW+91Pjz7nr7IQtLol6OeDtO90DRxnjn9Qxgpr3bwoimZy
 eZFa8ABenmEYGKZVOxMF9OorPO5bprjkG9ZJMD9chgZhtUr1mjTlnMb0cfi7DU4Wr6lI
 p2iZwjMFOqRohrJ9vNlat8c1TVnBb6zB/Rs2CLJnA0ceTgzwFGvQKdkjb6oeppD+39iZ
 il4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=77eEBjpjjNWxRFGKRrG5MZEdWjbph7kv2QlBRsTlWC0=;
 b=GMh4E/3q4qbZ3R7TkJ5JCy8DTUFqRCFRpECUdmJCakRsqFRpZmS0ne/5DA8kLKrOan
 R8dr9y2IVmAPvQaUag4qQStlGmdcaHYAJ10YpCusC5LtFMfN8sHMFlrVKJi3mhBYaXBP
 hDXN3a3skxB7lbrVLluD97p1lIoCDzCiA3pGQ1jXSIaAKJOxevaItiOZoYgR9O91Usj1
 aokJntEAAHaSPQwp2gwlVjSF1sYtD2rjccjKu6mFNVfs7qa6UCPLzU8p2TKs5eTGBBRT
 zJC9twvIyLB9cGjrovZlf79R3trMs60g2/oLD8qJSs11Exszgmt12MTYpPzmlOt+NOTH
 Cslw==
X-Gm-Message-State: AHQUAuaxr2mhbqO2QBFjI7mvni1MsmQ0NLFNnZT7M5HoIun+s538tfbY
 nNHxsdZi3595pJ2DrX1lcfM=
X-Google-Smtp-Source: AHgI3IYqUAnFCwnBSGCAPWBi/7ZkCGpJzjmvRLMhEQyFfQ8+Ch7Mcw4fHmGmHx2jK3QbCyatJlsWdQ==
X-Received: by 2002:a17:906:4952:: with SMTP id
 f18mr4429333ejt.189.1551343861313; 
 Thu, 28 Feb 2019 00:51:01 -0800 (PST)
Received: from archlinux-ryzen ([2a01:4f9:2a:1fae::2])
 by smtp.gmail.com with ESMTPSA id x2sm3084006eji.15.2019.02.28.00.51.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 28 Feb 2019 00:51:00 -0800 (PST)
Date: Thu, 28 Feb 2019 01:50:58 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] ubi: wl: Silence uninitialized variable warning
Message-ID: <20190228085058.GA5694@archlinux-ryzen>
References: <20190228053551.GB3253@kadam>
 <8490920.CCJDc82j5X@blindfold>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8490920.CCJDc82j5X@blindfold>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190228_005103_792583_DCD016F0 
X-CRM114-Status: GOOD (  20.94  )
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

On Thu, Feb 28, 2019 at 09:35:50AM +0100, Richard Weinberger wrote:
> Am Donnerstag, 28. Februar 2019, 06:35:51 CET schrieb Dan Carpenter:
> > This condition needs to be fipped around because "err" is uninitialized
> > when "force" is set.  The Smatch static analysis tool complains and
> > UBsan will also complain at runtime.
> > 
> > Fixes: 663586c0a892 ("ubi: Expose the bitrot interface")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>

This fixes a -Wsometimes-uninitialized warning from Clang:

drivers/mtd/ubi/wl.c:1514:6: warning: variable 'err' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
        if (!force) {
            ^~~~~~
drivers/mtd/ubi/wl.c:1520:6: note: uninitialized use occurs here
        if (err == UBI_IO_BITFLIPS || force) {
            ^~~
drivers/mtd/ubi/wl.c:1514:2: note: remove the 'if' if its condition is always true
        if (!force) {
        ^~~~~~~~~~~~
drivers/mtd/ubi/wl.c:1478:9: note: initialize the variable 'err' to silence this warning
        int err;
               ^
                = 0
1 warning generated.

> > ---
> >  drivers/mtd/ubi/wl.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> > index 40f838d54b0f..2709dc02fc24 100644
> > --- a/drivers/mtd/ubi/wl.c
> > +++ b/drivers/mtd/ubi/wl.c
> > @@ -1517,7 +1517,7 @@ int ubi_bitflip_check(struct ubi_device *ubi, int pnum, int force)
> >  		mutex_unlock(&ubi->buf_mutex);
> >  	}
> >  
> > -	if (err == UBI_IO_BITFLIPS || force) {
> > +	if (force || err == UBI_IO_BITFLIPS) {
> >  		/*
> >  		 * Okay, bit flip happened, let's figure out what we can do.
> >  		 */
> > 
> 
> Good catch, Dan!
> I thought gcc is supposed to find such issues too. :-/

This isn't the first time GCC hasn't caught something...

https://lore.kernel.org/lkml/20190221222123.GC6474@magnolia/

> 
> Thanks,
> //richard
> 
> 

Thanks,
Nathan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
