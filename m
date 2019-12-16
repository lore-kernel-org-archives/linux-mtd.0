Return-Path: <SRS0=uFxw=2G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED97BC43603
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2019 09:44:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF5CD20665
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2019 09:44:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G9K2iaGj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="irHXY77D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF5CD20665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TSTDR2gDSt/+sVKz47JD3Lp7x0Td7FyE9q879PoVlmk=; b=G9K2iaGjK3j4Wc
	Y4CPu+f751ArJ9wB6Whj/N4vaVchoaUQ7PpKViSah22v5KBgyPA5gU2PSz6D2S9jByXzCybt9lCCB
	kffy05Vs8XfG0ZmbHVQnKKxaqkeSUhzYrAkThJTz1x0V5VYv9AuiIQrhpe9rhDMuj1eQxCL4fJb/K
	8U5eLQIW0gMOrrQTBjBGVnRsomE+2zMBgh9KMftt/Qrgo5ezzqUvydkGBSKgovJdgFIJxrPo402ow
	R1CYJBA+w1T4Lf4HCVd9r+ReOA9J4dAfojJW1I4qc30nqZDhCM25y/333onGDNjqtMwHLD3rkTPqv
	3uihs/jE3etzzJamJW+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igmvb-0008TE-Ca; Mon, 16 Dec 2019 09:44:35 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igmvZ-0008ST-2K
 for linux-mtd@lists.infradead.org; Mon, 16 Dec 2019 09:44:34 +0000
Received: by mail-wr1-x42b.google.com with SMTP id q6so6368966wro.9
 for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2019 01:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LveXVCqZjOV3+t6wmL3vQ6ysn3nRhNnFOpm8rZl9Z7I=;
 b=irHXY77Db2rBzcxr5AFGFqBn1MSDfgEc2HOTVh5yeAG6/3x5NkM1zWAgwHkIDT1hHn
 2qEvd+gntnIN0norqCOgBkOE7vYB4uk6i9oH8Znw6kOpV9Q7n9vRb2hhQW1d2y+v0Zf9
 DZRIk1BbbtqV7IGFydE6qdSGcXnPFNo2QH9/7y0Qo9+PSBnQQgbXE7/OZpaUTkIQ4boN
 3DwIIYbEtdkGVOfhNhY2OqN1M3mR2xvKApCnhl4rd9lThHAX+KNKIFLZr3Gux5qKbqpO
 EEukRTcfdYKQmj/G3/2RHUOnbP8vO2Ax3enWqSceY8Yldb/boYXVuMR5gp+M21V7SZ/q
 Agpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LveXVCqZjOV3+t6wmL3vQ6ysn3nRhNnFOpm8rZl9Z7I=;
 b=rwQqTjg2+ENUbtSt4VT2kUmQpGnQTDt0foBrwHVPahHhMu6nrw/W3Gw1SBG289t6u2
 hYCCSNF2QHKYRqzH8cB9GZ/9sUrHcv1rw2LweO0JAJufusj+PK3NbCav/1JAZJyi7V42
 S7g/ZiPYX/UrQUgzC9D4JUqvMv160NaD8oTVCK/dXH4rKUWjamZtyn0q8f8z8WHv8k9d
 N939gRuqLrV73ZIpzak61+dznR0OY11VRa0tsbjbm5GsCSwxkqjMWKjzPbLv6jYa0gxX
 eg688w5MEQkJ4TnSHwedceQWDsbJf994k+Adb/SeaoQFEXlKMPoE8mbIKJEoVchtYcc7
 ozjw==
X-Gm-Message-State: APjAAAWTOIlD4VIZoazfDj7lAZeVi/D7A7SS2vnV3CP9pwtcBZxvZe66
 a0BOot/58R2qQ91ZG6OIbFJJqNMOwnLCjD0EjL1N8A==
X-Google-Smtp-Source: APXvYqwC0V1jDu5DW32DD4h2lYhm0pQFETtaAMrpq9Ts5xVDlb11Gt49GhvB8skRJ1bWDxTcIPFRlvuZxebnzjZj3lE=
X-Received: by 2002:adf:a308:: with SMTP id c8mr28367921wrb.240.1576489471001; 
 Mon, 16 Dec 2019 01:44:31 -0800 (PST)
MIME-Version: 1.0
References: <4cb355340b844ab49671eb1068f45434@eckelmann.de>
In-Reply-To: <4cb355340b844ab49671eb1068f45434@eckelmann.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 16 Dec 2019 10:44:20 +0100
Message-ID: <CAFLxGvz2=LZkU769af8r46A+D=at2FQqr4cype5FGcSrsDc_bQ@mail.gmail.com>
Subject: Re: Support for @(POSIX|NFSv4)-ACLs on UBIFS ?
To: "Mainz, Roland" <R.Mainz@eckelmann.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_014433_135812_FF19596D 
X-CRM114-Status: UNSURE (   7.19  )
X-CRM114-Notice: Please train this message.
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Dec 16, 2019 at 10:09 AM Mainz, Roland <R.Mainz@eckelmann.de> wrote:
> Are there any plans to support POSIX ACLs (or the extended NFSv4 set of ACLs) on UBIFS ?

Well, if there is need for it I can try to find time to implement it.
...or better, you implement it and send patches :)

So far I never needed ACLs that badly.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
