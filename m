Return-Path: <SRS0=iZys=BM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A06FC433DF
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Aug 2020 20:59:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A31F20738
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Aug 2020 20:59:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MdeBK3/0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSrIKjrA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A31F20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AdFk9PcZgfJhFGvPTUVpcxRaqgZWbXTChOccYWTm878=; b=MdeBK3/0y/u/Q+vjliOmvGESW
	j27G2IaY6ecIBMPqy57D1EknB06hTL9awDECVLL3jnwzSK5b9yKaNN3J2Hy1ARZGwh4O3vhbPful+
	rax/Tv0W9yJHch2s6NsFEVKUKw0X6lhN/LsIhW6amY1m2lehHy0GcRUTdMglo5zkPeGbia3eAen8z
	E1etlgpzITl5nexKRoim6JYJbPRbCDl3lRfZKFQ1QzXIJoaD2gPt3nCjPU6uDF4r/25ZbShUJdQT+
	o7kiJcTTBUvR8qdaYmljOQhDGYUxFJJtAqkJ5cGr3YfaSxdrB/L56D/+uKhSjuwfsoHvDu89XNTo6
	uIxqVKSgw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2L4U-0002Cg-EY; Sun, 02 Aug 2020 20:59:06 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2L4S-0002Bq-2W
 for linux-mtd@lists.infradead.org; Sun, 02 Aug 2020 20:59:04 +0000
Received: by mail-qv1-xf43.google.com with SMTP id j10so9814106qvo.13
 for <linux-mtd@lists.infradead.org>; Sun, 02 Aug 2020 13:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lpfNXkmyS/c2cFjwANzmOGpAdi0vE66LKzF6F3Z7eQk=;
 b=aSrIKjrADoVRBEWSh724z0l2SvU7xD65h+yV3/tvRvc4/cmNs2OW8PRyVehHtJpRYV
 4wxc0hi9G4yS6espX3YajJiLDsgaIJc0FlxfPwrNuqKpBD/HVpoQFDyu4ZgdEOdkembk
 r1bZ/WWY8W34j5pRhgOUBfcXI+v51FJ2STU9iKSWU24sMdfHA/r3hu7sE0b67dbsUgtv
 wIL0aAGIrrjEI11byUfwcbPq33IVEPvdQtAcW92QZbv5X4YHqn5AuwCnafgOPZFI4TM1
 Xa/k4Lo1+761rmgR9pkHao0Xcow+NLOLryEQwq9By5y/Gxhd5CSg4gg3dm/U78OCXzwd
 A3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lpfNXkmyS/c2cFjwANzmOGpAdi0vE66LKzF6F3Z7eQk=;
 b=QZ735cFP0tk3V1wgPLcLe2JYHuXlSvKgDPQ7UtLLj5qy/ASLOUPaex+PlefvglDaja
 VUOVl+jjt81IzpemrZCDrMEyl3eJelqNFvne6Ll+P6DHt74OPBld8ngfyWDTZ67Ut0lM
 MxB2byYKdqydttdm8a9j3UVT2ZsfGJkCAS3U1Erhbo5pLpeXqcqklcr2utzT8Zcf9Xc3
 gK2x5iP0qoOU6GMMAf1a2yRaD5QfpR145C5DZIJEP0yB4IfYiAhqejNuLHHOxq+J3Ndh
 vSAqlwsvNGMvuBD6S/Y1IjnVDDU8xewMn0wDQUiHCzLNlMILdoYmXYVzPXuFNrKQrTQF
 Ltdw==
X-Gm-Message-State: AOAM531bwzpNdxm6L/qCfTb5JFlZ5qABe1EHjEzOzd8PvAx9nFOevJO1
 O5avdrQqXod2pD5wH8Tyd4G0wHhjPQFxHVABmivEaA==
X-Google-Smtp-Source: ABdhPJwX/6WflwM0v1M9O0qKnaq2kmODM4nZjATuNJy2Siy3bLl+GYVf1knPozuS+3wj/X+Eon00Kw1cjB/cV2f2tWU=
X-Received: by 2002:a0c:d60f:: with SMTP id c15mr13951446qvj.17.1596401940674; 
 Sun, 02 Aug 2020 13:59:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200720001444.30972-1-rdunlap@infradead.org>
In-Reply-To: <20200720001444.30972-1-rdunlap@infradead.org>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 2 Aug 2020 22:58:49 +0200
Message-ID: <CAFLxGvwKqQCbO_Rd6nadjwGD3-9HE4j9msOyUk+SuujiEbjN2g@mail.gmail.com>
Subject: Re: [PATCH] ubifs: misc.h: delete a duplicated word
To: Randy Dunlap <rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_165904_205563_9097CADC 
X-CRM114-Status: GOOD (  12.75  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jul 20, 2020 at 2:16 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Drop the repeated word "as" in a comment.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: linux-mtd@lists.infradead.org
> ---
>  fs/ubifs/misc.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied!

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
