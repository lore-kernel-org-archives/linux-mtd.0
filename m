Return-Path: <SRS0=MuW7=32=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7759C35247
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Feb 2020 00:50:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9451D2166E
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Feb 2020 00:50:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lqBMPHwi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dcr0UbuQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9451D2166E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QWN3YdVVvnzv2M9pLDe+nDMHS5sKRrpQtCm60fYXJB4=; b=lqBMPHwit+n0gb
	vUI34SQ7DqbMTjXgftJmZEoG4v+uUl7dT3UQPq9zX5+PpJwsjcxWhIoleFB1dV8SoMtmN4VqILkiO
	BYCTM6/Tqzlf4usT4gTO0VQfTNtQyfNm1IKHvqdJcf8lmoy9wnRV5vgkcbAewQ2OWrgfKBx0wBZsw
	cHH2vwEroKnjIV1YrKSjXnZMXQ8dVcDu0CuxIp/EidC7mGevvTUfxeVeEliCUrymGw+qpMkyjohgW
	BqeWLkU1c42ZYsBZBmy3/OeGd6Y23vtfQoTj/USLrBT8TLSKVVs4GRrlScFF90j55/MS/AW/7Of+J
	vBYuzlrwnh1u8A/qxuZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izVMW-0003nw-2u; Thu, 06 Feb 2020 00:49:44 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izVMT-0003nM-Le
 for linux-mtd@lists.infradead.org; Thu, 06 Feb 2020 00:49:43 +0000
Received: by mail-io1-xd36.google.com with SMTP id k24so4398130ioc.4
 for <linux-mtd@lists.infradead.org>; Wed, 05 Feb 2020 16:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ftySkFVHrVgxom+hnolJtm6PBY9CawflNjps2IhpN8I=;
 b=Dcr0UbuQf1Q52mnwMAgkkDFwyOC2aPv+tLuHiVLqiiwSd3qai6v6iDY8DwtvY6zClD
 Z4Hx2k56plzig6uAyEBjlsR/Rd0WU1k7np8PaCqQLnqsDrPcvsuxi9mmXi6Xm2XQ41+E
 oKwIY2fbM65AfedHzjLe8POedI8TgbN4TXryV8nkK+A84+N2x5XX+dUSkBaY3ICtzLHp
 N9rNfYhWHDaC7RJiFncIKw9R0Wb85iTokwWzdmovrlSVPeMfXVuzjpuou4EGO5tLlZ/Q
 xR8AY1b+XhwAf9zM0mRxqCIOHXb3J7MDenBSKdthi8fps+sevMYnBPPbDgoFG2dnCgak
 OAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ftySkFVHrVgxom+hnolJtm6PBY9CawflNjps2IhpN8I=;
 b=BnoHmJWDtoCrtR0LWpYVjumhMaaUY9IOrpHwW5aANdi4ri5dhU3crJj8A5QntoXhiX
 Ll8OUmtWHpXnPSHOtxKHIZGvXC2aXZx+1TSGNnrmG4RgxwOSEZ5Ofw9IAIqcv3jgpNxC
 QbZZIHvfCZZwxhRu8eCWOaCyWpOeNQJTH8R/pDqsQx8YMqj5KZJ1K7mSCfxyoi10Ojwc
 IpGpA/tNFfFKjRkwK5eLRYKZEwMPwfkDhcupuOOEzbPYhbE5ivPPCCko5PTcxQtbE/iW
 92HX97EbDfFcH3ZDhdnOynAkodbgRsv3IlaiWcvtusAEogTIZJ+tEbGbXQObWDpvsT78
 nDhw==
X-Gm-Message-State: APjAAAVXKKPISYDY+O80y0KYUToJpnvXnZkSij3hxJfPPE6WQEkkhZWF
 wgoSElTLKVMg1/8QBNrP6IIVKPVP7S4kdFTuPnMmAvmh
X-Google-Smtp-Source: APXvYqxObTeHg2tN8ZV6Q5RrFQZk8SxKyhTyuKkCWp6LDDJhkhshtudI4xpwxfFjb7uioymd9KTG75c0MDKVgucQ+IA=
X-Received: by 2002:a6b:d912:: with SMTP id r18mr29322941ioc.306.1580950176852; 
 Wed, 05 Feb 2020 16:49:36 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP;
 Wed, 5 Feb 2020 16:49:36 -0800 (PST)
In-Reply-To: <09505ab3-a51f-e0aa-1610-1ea1f106eec7@niko.eu>
References: <CAA=hcWTmUFRnxH7XY_040QG0oiUErJ84-mZQ3Zbfaaj7-TMFtQ@mail.gmail.com>
 <09505ab3-a51f-e0aa-1610-1ea1f106eec7@niko.eu>
From: JH <jupiter.hce@gmail.com>
Date: Thu, 6 Feb 2020 11:49:36 +1100
Message-ID: <CAA=hcWQb-ok9u3Fa8ukBENE4peJaw=MEegT0-sMeXVWJrTinyA@mail.gmail.com>
Subject: Re: Corruped NAND booting for all devices
To: Jef Driesen <jef.driesen@niko.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_164941_733414_53317A3A 
X-CRM114-Status: GOOD (  10.90  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Jef,

On 2/5/20, Jef Driesen <jef.driesen@niko.eu> wrote:
>> [    6.782640] UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0,
>> name "rootfs_data", R/O mode
>>
>> ...
>>
>> [FAILED] Failed to mount /var/volatile.
>> See 'systemctl status var-volatile.mount' for details.
>> [DEPEND] Dependency failed for Bind mount volatile /var/cache.
>> [DEPEND] Dependency failed for Bind mount volatile /srv.
>> [DEPEND] Dependency failed for Bind mount volatile /var/spool.
>> [DEPEND] Dependency failed for Bind mount volatile /var/lib.
>
> At first sight, it looks you have a read-only ubifs filesystem, with an
> overlay filesystem backed by another read-write ubifs filesystem? And
> that read-write filesystem fails to mount after a power failure?

I did notice the R/O mode, it was never in previous hardware revision,
the MTD partition for UBI is always RW, I did not know where is that
from, since the MTD partitions and installation was performed by our
hardware contractor, I don't believe it could be my Yocto image to
change it, but correct me, I could be wrong.

> In that case, this sounds very similar to the problem I reported last week:
>
> http://lists.infradead.org/pipermail/linux-mtd/2020-January/093542.html

Interesting, good to know there is an issue here,

I guess the question here, firstly why we had the RO ubifs filesystem
backed by an overlay RW ubifs filesystem in the first place, secondly
is it an MTD bug or is it our fault to set up wrong RO and overlay RW
ubifs?

I'll keep an eye on it.

Thank you so much for sharing your information.

Kind regards,

- jh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
