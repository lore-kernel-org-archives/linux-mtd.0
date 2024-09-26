Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B792BCCF9E9
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 11:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=234UCHGBxVnUxZLke0jkaWWakPHN3BzXoYuOvk0GD18=; b=MS/A9fqowuf2m4
	yloXzkigKwhh8vbVcoLdRKz/RoTNScFfBuLxSFjIerr67F8pBz83dxAGc8moK3N3FrDA7mPwduJUP
	nMIyNJWUYzhlaUZtRqEjKw+F6hktbabdsNTAIOrEAm9Agf7NUnqMGahu+/mODXet8Yzajqj+rDCH7
	N1R55iZO2GTV4gqFVQVDW/X+0rZhQHiF8noJwmmv39YgnyP7kHxv8BS9tMQrG6SX74NvPvuXdRCng
	8XkvgJrKbX1SKFBRdLspyQsNJREYL9zfQ6W4PJSvIO/pcQ2yT3hQMota5rgTf/RIfjg5UHc1dUaFQ
	D0sT0yLKSzts7faJ8Mpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stmHJ-00000008A6K-0KlX;
	Thu, 26 Sep 2024 11:03:21 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stmHG-00000008A4D-1log
	for linux-mtd@lists.infradead.org;
	Thu, 26 Sep 2024 11:03:20 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5356ab89665so1027761e87.1
        for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2024 04:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727348596; x=1727953396; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bXcpT7QniCsY3WmCQMjDM6v5kutIfKh/CwTX1byPf8I=;
        b=SlPEO3AEVQbM8+A8ANhm097koPAVi7AmRPIZhEoIV6xY09NoNVztsHuPU/fQtZdbVm
         XoD99XNC096qkjcXUq3xyOkNyW6kEuUO/yq/nk5qxbjoI2MHmtY4TzpWNOyf+pT5CCht
         lYIA7msxU7mvuqa5No09z8lYFDTTFc0mA7r+GmqrO+fkAAdFPU9BqxPHMQg+zvhIMtbU
         nA9jtbe9Qq4B78xejgKqgZn1ZZQHTOmc0z8erSKlFncqA4/DXchbT+j7thgQoHb/yhPD
         DJ5bHv6Xfw6HgWO4Y8tRvG0TtLqzDeAMFVUYjrSYGcUlT3XR5EquOaSECiFEGAyXurwQ
         10nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727348596; x=1727953396;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bXcpT7QniCsY3WmCQMjDM6v5kutIfKh/CwTX1byPf8I=;
        b=jyjTR3XyW+aeX3ATgDRzBrdN9FZM508ly4yt3hQbJyQNRsdJAiPBOo88w4vBVIpWRl
         /2EfqqJQq7PylKMRUAEyxYx+pok7FcUUHUv+xo3ILMrShPu1weFyu5rnHzJpM4qHe8JD
         LnnV+fqo1L3oBGgrPKmfe6/mZjud92As49a+NWc+T1ZRu9ZgsOuwTbilRUzTe1sqWVIw
         8Edaf2mhHa5J7v0azJIVM08HOqH6cNIStUbs2k8rGJ9ppok1Z4i21dUo947zOaXzFvtv
         XsM8rll7KUAj+Ki7CyU7yiI+yKJiDoQnI6SV3lRu63+LFKZYbuhEJf17a403VTT/jSwa
         658w==
X-Forwarded-Encrypted: i=1; AJvYcCUugdzTj9wonL2riIStWe2iUgFYTqszKbVZtwCwSjgEKDsJOLF/e8kTetxJpvwo/7R7z7A21q4SRaU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+KMNDP7h1a+aAHJABpuWzggmO59uifJp3lFvh4W4mS4oQ4fBV
	4uqSVM/YmBc0pzuUEVeNbY616l93b+x3ugggc/+Px83UQOMkg/Tt59bGf0a3TxRW1Di3LJeXfbx
	mp9xufY52Adp3OSXxxbywKgujWA==
X-Google-Smtp-Source: AGHT+IEs5w6c2apFprxZ/aKHJmYlnZdJTzEmSfMV5EYSNk9OWdGaIAdSiJTPKJTFI9FYdw4cYr+wC88Yaq6+PnwZMpg=
X-Received: by 2002:a05:6512:3b0e:b0:535:6cca:9453 with SMTP id
 2adb3069b0e04-5387048ab7fmr3663974e87.12.1727348595720; Thu, 26 Sep 2024
 04:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240925074903.1983601-1-erezgeva@nwtime.org> <877cayj2va.fsf@geanix.com>
In-Reply-To: <877cayj2va.fsf@geanix.com>
From: Erez <erezgeva2@gmail.com>
Date: Thu, 26 Sep 2024 13:02:38 +0200
Message-ID: <CANeKEMPfCk1R1pc8s9MwNniLJUKGr_g99U5EtNmJKsLLty-9Qw@mail.gmail.com>
Subject: Re: [PATCH 0/2] mtd: spi-nor: macronix: reading SFDP by all Macronix chips
To: Esben Haabendal <esben@geanix.com>
Cc: Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_040318_516045_E75F5BFB 
X-CRM114-Status: GOOD (  24.30  )
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

On Thu, 26 Sept 2024 at 09:22, Esben Haabendal <esben@geanix.com> wrote:
>
> Erez Geva <erezgeva@nwtime.org> writes:
>
> > From: Erez Geva <ErezGeva2@gmail.com>
> >
> > Add reading SFDP to all Macronix chips.
> > All chips in the Macronix competabilites table
> > have a replacement chip that support SFDP.
> > Macronix stop producing any chip without SFDP 15 years ago.
> > The benefit of reading SFDP is by supporting
> > fater op-codes for newer chips.
> >
> > This patch do not add an all flashes support.
> > This patch extend the already support of SFDP to all Macronix chips.
> > The new chips that reuse JEDEC IDs and chips that
> > are absend from the Macronix competabilites table.
> > The patch just remove the restriction!
>
> Hi Erez
>
> Did you see the response I got to the last revision of my patch series
> that tries to resolve the same problem that you are adressing?
>
> https://lore.kernel.org/all/D2NGXHZ2VTK0.M0AOB4CM7MHM@kernel.org/

As for .
I agree that doing SFDP first is a better approach than mine.
If Tudor Ambarus. Pratyush Yadav. Michael Walle agrees on that.
Than let's do that

>
> I think we should try go go in that direction. It sounds like it would
> be a simple solution that would improve the overall situation, not just
> for Macronix.

Again I agree. Doing SFDP first seems a better approach.

Tudor expressed concern on sending RDSFDP as no-op to chips that do
not support SFDP.
I did a search on the Macronix chips that appear on the table and all
of them have a new chip or a new version that uses the same JEDEC ID,
that does support SFDP.
If other Vendors reused all their JEDEC IDs with new chips, then sure.
I did not check other Vendors, so I can not state the same on them.

Erez

>
>
> /Esben

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
