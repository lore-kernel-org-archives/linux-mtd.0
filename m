Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD84C30658
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2024 16:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z0rEos28YcmBavaKIpWsEKv0ULlxo/E+4okluTkzW5k=; b=lNoRibbwjoFEWJ
	vbm4C7ZqaXeGi/7DHV5bWC8XPwKLFD8nmkTZtUGEWobJjRw2Uohekw3Bg4bUYSt8S7JPqlZ5CS/LV
	NmNV0RS8emH5uDwnEvFKaOt48xtVqdTQBVStvXFBc8qIrNFwbr/7Q0sefKxK/9T5P39zK7S6kZUZT
	pMN1wH6TrNbxhV+sahnlcuhZeE3QnaXwYRwWmNksltVhSN4y1zeYxKL1l/i1ZSV64J8ytWfYaGKl9
	9elVOJgtyew9DtkqqnHWFhe7Abm1PlxmbyxDOQc9L7iKiHxYLoNry30SiCzQB5S/90nxmXw2V5lGp
	OmGWPHvLhEANBDAQRgcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNEir-0000000EOWJ-2hLG;
	Fri, 28 Jun 2024 16:45:17 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNEio-0000000EOUy-2k64
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jun 2024 16:45:16 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a728f74c23dso96222766b.1
        for <linux-mtd@lists.infradead.org>; Fri, 28 Jun 2024 09:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719593113; x=1720197913; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p6opEP+oxPf4EYU4j61G6/Gb7Qxsmf3nFQOvrXXgQuQ=;
        b=dmjbf6Xdaw05POLKFiwKlmwTKoGfxyvrOnSFoLMzeF4T/+QF4hiDmhsClFaee5TC7N
         94kRNvhoHKWuq5KMFkt7Hy1c77gYYsA3/K6rcvz2jV5nlkxqMQgkLm7osthI6BOzO0Cn
         Gwh6AUzjJ0Vy8sADW0tcxhiHLUSgI+9HQ0wA3+9YdzaHiP2ocjJ7x8DO+9JfFxmoZEw6
         CdYSIU2SyTUX9LY41zXf6iHhKqFui+JnFQH6Zc868Teb6zVOiYJ8PzHFW2KkYDFkPj5n
         GUZ1Ovb2dGD/n/CSXafzNFbiwuRcvU23nkJNJ8KScM0qOi1O9Iyb9zU2jLmM1njyMM9A
         mZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719593113; x=1720197913;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p6opEP+oxPf4EYU4j61G6/Gb7Qxsmf3nFQOvrXXgQuQ=;
        b=r/J6TZa3Nd68wc+QcQdiCg4xPElJ5vooXrCvVulQYJQ95DwFDiTgVeZgPTI7swXAH0
         iY0g2kSWti6WyqFm4ORNI6I4FcGg0zci1/K6mMrA51tJVckOMtuAJKat0ZA40En6KLFq
         Z3onXevvCo0peCqA1fuOg5azPAwXi7ONCwgAFVTaYYxO8gKshbwFeh79cnrXk7oeHMX8
         lpprQhF2GiQiD0wN5qMZ3ik0aCQlvD/7ncXWOig2M/N+e5GhnLP7NlpYWDGr518qGh/P
         FSa079GrV/RE6dHYWU38xqc83lWGUB1/bWgEFJfp5kEZr6kijOQZ9GORdzCqjsaC6FDk
         eZSw==
X-Forwarded-Encrypted: i=1; AJvYcCW5h7o1xEpdE5Oq8A1sw6bkEWhH93HfneNsbRxPWBwMXrhLoi5AWmh9/kJXHJmdYubcdDWKUJeTz6qXAVDyXKIqdZI794ZUrBNy3F6Udg==
X-Gm-Message-State: AOJu0YzMVVZNcdk0jiOwFjvIjW1fCgwDSO50J/i/8leiwbveuvXSGoty
	I41GP2mssthkLZ1cfAnN4ppjpihK9mfGHJbPWZOivC+sP9tnTvHJf+dMVatKrc+T1gvYW8nkNpt
	w3umOFeEUNqasXWszG89C8xMMTQ==
X-Google-Smtp-Source: AGHT+IETF8QqAle/XkSXEMA6ZayfuArJ+Hq5jcKLkHKXXN/m33bSmDsyVwGe1XbiT9NZr31/GDrpxiJSd9Q5Xul+La4=
X-Received: by 2002:a17:907:a607:b0:a72:744e:670d with SMTP id
 a640c23a62f3a-a72744e6a5amr871187866b.60.1719593112739; Fri, 28 Jun 2024
 09:45:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240628140328.279792-1-erezgeva@nwtime.org> <20240628140328.279792-4-erezgeva@nwtime.org>
 <20240628-refuse-actress-b76985aa020c@spud> <D2BS0YMA48BG.1PEPFC3KMFV8N@kernel.org>
 <CANeKEMMrXK=mw=n=9DuTnprkTs3ct446oaC2QTJyst8Nd+D6rw@mail.gmail.com>
In-Reply-To: <CANeKEMMrXK=mw=n=9DuTnprkTs3ct446oaC2QTJyst8Nd+D6rw@mail.gmail.com>
From: Erez <erezgeva2@gmail.com>
Date: Fri, 28 Jun 2024 18:44:35 +0200
Message-ID: <CANeKEMPAv-jXuE2OwRQaEvru3yPt0rgBU8=p35ub8nK9UtnbQQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: mtd: macronix,mx25l12833f: add SPI-NOR chip
To: Michael Walle <mwalle@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_094514_813496_185CACFD 
X-CRM114-Status: GOOD (  25.23  )
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

On Fri, 28 Jun 2024 at 18:30, Erez <erezgeva2@gmail.com> wrote:
>
>
>
> On Fri, 28 Jun 2024 at 18:04, Michael Walle <mwalle@kernel.org> wrote:
>>
>> Hi,
>>
>> On Fri Jun 28, 2024 at 5:57 PM CEST, Conor Dooley wrote:
>> > On Fri, Jun 28, 2024 at 04:03:27PM +0200, Erez Geva wrote:
>> > > From: Erez Geva <ErezGeva2@gmail.com>
>> > >
>> > > Add Macronix SPI-NOR mx25l12833f.
>> > >
>> > > Signed-off-by: Erez Geva <ErezGeva2@gmail.com>
>> >
>> > Should the email in here and in the From: field be your nwtime one?
>> > Otherwise
>> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>>
>> Actually, you're not supposed to add any compatibles to this list.
>>
>> From the binding:
>>     description:
>>       SPI NOR flashes compatible with the JEDEC SFDP standard or which may be
>>       identified with the READ ID opcode (0x9F) do not deserve a specific
>>       compatible. They should instead only be matched against the generic
>>       "jedec,spi-nor" compatible.
>>
>> I presume the Macronix flash does support the read id opcode.
>
>
> Yes, they do support.
> The new mx25l12833f also supports SFDP.
>
> I do not know why they decided to use the same JEDEC ID for two chips.
> Your guess is as good as mine.

https://www.macronix.com/en-us/products/NOR-Flash/Serial-NOR-Flash/Pages/spec.aspx?p=MX25L12805D&m=Serial%20NOR%20Flash&n=PM1310

End of Life (EOL)
https://www.macronix.com/Lists/TechDoc/Attachments/9861/PCN31_2009%20PCN_MX25L6405D%20and%20MX25L12805D.pdf
Macronix will continue the support of the existing MX25L6405D and
MX25L12805D as the following schedule:
The Last Time Order Date: 31st Aug., 2010
The Last Time Shipment Date: 30th Nov., 2010

Erez

>
> I know the two chips have the same flash size.
> Though the new mx25l12833f chip has a bigger OTP.
> Secondly, the old mx25l12805d has an asymmetric OTP, the 2 regions are of different size.
>
> As I see it, the first 2 patches are the real contribution.
> As I remember, the kernel maintainers usually like to see something using the code.
> I don't care if it was another Macronix chip. I simply tested it with the mx25l12833f chip.
> "[PATCH 1/4] Add generic functions for accessing the SPI-NOR chip."
> "[PATCH 2/4] Add support for SPI-NOR Macronix OTP."
>
> I did not think it is important to have a kernel configuration for choosing mx25l12833f over mx25l12805d.
>
> Erez
>
>
>
>
>
>>
>>
>> -michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
