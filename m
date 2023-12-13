Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D43CC4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Dec 2023 02:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pqfjdHpbxoBA7PfHrLo6gmmkPL69EBnAdgaZOjZVtv4=; b=0fS2E53TqmSoyC
	pfXKSnVKwtfdp7ijOnRHuHGj7r+ZoWQ/ZzJ7/G/8LcrgA4HAIeB2bQEZjuAt4LJrT+g6XH00h6unm
	Ogh4Tau/6enL6mvXYj/WU86G7Y0ElsL8/qo7JPHGjZTSvzpXUDI3kQRXZ+hvx668GPTTlDOwI1cCw
	hrld5LJNQNiWtFgtff8N5RKsVTvK1cxsufT2IqiprwiPZHxUJaz2ITRubWxqD7Vfm2Sw45zdMR4r0
	QxhJ7sLpCelmsEhxGSYwc9AXfOYpP+LCAT5k/nOlIi55e/XoGTkmLc5uhSY8WesM/WtHZ70FneNMB
	Qa78mfOe8KLobF/otQVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDF8J-00DQWz-0n;
	Wed, 13 Dec 2023 02:37:59 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDF8G-00DQVj-19
	for linux-mtd@lists.infradead.org;
	Wed, 13 Dec 2023 02:37:57 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1d098b87eeeso57065875ad.0
        for <linux-mtd@lists.infradead.org>; Tue, 12 Dec 2023 18:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702435073; x=1703039873; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3HycEID9v8c+8fSHf0OnsgzmNWoM6QWE+1eKUBzwhXM=;
        b=m6nxPkeiaKh2GpRL042BuZjIfpIsejuZtuC9u6xjglXEWQeU2vijvzaaiPdBf5Bkny
         4szYuhEc2g5R/NcAaEO97/Ylv6lJnhR0pQ86BVjqLrJvsxw8Lrg4T3K4b5mxyxhsMeRJ
         ba203FEiwft0GGQUWMMFP2aDWZ656VMpNeS+6jXet9qndK/3CwdSLtW7Qxr80BnnW9rl
         FN5gtXo+dkMb8n6cJEMW1rnodSOjYSzXK4JRRRFeGYWgEm1dGAYTDpRFEM5cUIt78NcB
         0AYPMytHvp+T4I4Q5nGSzbXEM7bLh6lbmoxwuvRW6nh1aNxnBzqD24eOiaVBeXPY+JCG
         osEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702435073; x=1703039873;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3HycEID9v8c+8fSHf0OnsgzmNWoM6QWE+1eKUBzwhXM=;
        b=jW6Y93kY4uSwTtpZZYdTJ2/hrqcEAn4s5JByX+cQBrcmraxB0YRxi2IJXAaGVBRpxM
         OdZS8gFEw5JZa937DQ+pqnyEGqLPhV7Y9Jd2RCGd8+M5XjzheTBVLKjAT5M9Mhwdbv2R
         6HeCGh8fJN6fYOhBYxpO5tw/LPaJ/y685XMWiwsL3dOMUCD3GXBgct1cmxF9Rzy1pJJd
         tKOY9bJj0bIIVPDXfSeymcn7QAcRQwY7GAGcnSGBf/vnLFQxahATQ5oFmfjTpziFDmVQ
         0PsE+mDEd7wUYK3+xyqvfRAWoipcDCHyWmR2pDPnqRONEneBxgNuJV2Fn4UmGRSnKnMo
         YCLQ==
X-Gm-Message-State: AOJu0Yz70D3qq5EuuGuUOsXWVx214HELuiBnZd7TR1+xiBNU8wGIJodx
	QOEc4aX8TM41SVc4LjUxQPEF0aVjQMdRw5/uyH8=
X-Google-Smtp-Source: AGHT+IFRdQQJi9T8pTPwQGX0mCgMwndFjI5go+4x246V54OdJgdrjkt7MzbQs8+mgNUqO1zmLMe6rHKg2MunVvze9us=
X-Received: by 2002:a17:902:ea03:b0:1d0:6ffd:9df5 with SMTP id
 s3-20020a170902ea0300b001d06ffd9df5mr8581162plg.71.1702435072933; Tue, 12 Dec
 2023 18:37:52 -0800 (PST)
MIME-Version: 1.0
References: <20231207075147.21851-1-jaimeliao.tw@gmail.com>
 <f015ef75d6bb0a9f8edba37b40affb60@walle.cc> <CAAQoYR=8b7NR8h0SHz=bp9=XHzZebDQhPUOc20b0eAF6Vd1kAw@mail.gmail.com>
 <e08b45ea59a0ba96de99a42ddf7b6769@walle.cc>
In-Reply-To: <e08b45ea59a0ba96de99a42ddf7b6769@walle.cc>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Wed, 13 Dec 2023 10:37:33 +0800
Message-ID: <CAAQoYRmYxmD8v20_Q=YShj_xv1vsV7fXnAGPYPBSP=XJmoG2-Q@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: core: Introduce spi_nor_abort_octal_dtr()
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_183756_394547_518DA802 
X-CRM114-Status: GOOD (  26.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Michael


>
> Hi,
>
> >> > Some flashes contains 8D_8D_8D information in SFDP but did not enter
> >> > octal DTR mode if conditions are not satisfied.
> >>
> >> What exactly are these conditions? Rather than "abort" the octal mode,
> >> the flash shouldn't have that capability in the first place.
> > "Abort" is not a good word.
> > Is it better for using "discard"?
> > 3 conditions should be satisfied before enable octal dtr mode.
> > 1. function hook in nor->params->set_octal_dtr
> > 2. nor->read_proto and nor->write_proto are SNOR_PROTO_8_8_8_DTR
> > 3. nor->flags & SNOR_F_IO_MODE_EN_VOLATILE
> > Flash driver still bring 8D_8D_8D protocol instructions in 1s-1s-1s
> > mode if
> > conditions are not satisfied.
> > In a case, flash ID didn't include in vendor's ID table.
> > It will be "spi-nor-generic".
> > 8D-8D-8D information could be parsed in SFDP but
> > nor->params->set_octal_dtr
> > didn't hook vendor specific function for enabling octal dtr mode.
> > So that it still bring 8D protocol in 1s-1s-1s mode and have no chance
> > to select 1-1-8 protocol.
> > I think it may better to re-select a suitable protocol for this case.
>
> Just that we are on the same page. You are using the spi-nor-generic
> driver, but that driver will elect the 8d8d8d protocol but that won't
> work, because we don't have a .set_octal_dtr. Therefore, the fallback
> is 1s1s1s. Correct?
Yes.
Based on my understanding, typically, flash that support the 1-1-8 feature
also tends to support 8D-8D-8D feature.
However, in the case of spi-nor-generic, we don't have a .set_octal_dtr.
Therefore, I believe that if octal DTR mode cannot be enabled due to
this, it might be necessary to reconsider and choose a suitable feature.

>
> To me it seems, that spi_nor_select_{read,pp,erase}() will select
> the wrong commands/proto. So it should be fixed there. Probably
> shared_mask is wrong.
Features in shared_mask have include 2 parts as below.
1. Flash support the feature (by parse SFDP or ID table flags)
2. spi host controller support the feature (In spi_nor_spimem_adjust_hwcaps)

But I think Octal DTR is a special case because, in addition to the 2 points
mentioned above, there are also other conditions that need to be met.
My goal is to enable Octal DTR mode for Octal flashes listed in ID table.
For those not in ID table, choosing spi_nor_generic should allow selecting
either 1-1-8 protocol or, at the very least, 1-1-1 protocol.

>
> -michael

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
