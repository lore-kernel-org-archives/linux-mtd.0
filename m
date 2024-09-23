Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2283FCF9C72
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2024 16:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ssxhweung5ye1ReEToMgYXf7gBsU5PLvemxR8/q+msg=; b=VUo2Ct8Io9aa8h
	WNBa/Ha5yxjCXG8qchd+obuoBHoeMzx9z7d/FhawmTC9BbXnNQMAcTGRSGIRm/ZfqonDPUkZc2ie2
	Az/y6XSfEkX2Hu2NU/uo/Z+bdYOH6SDzaq5HVsGvkyy9rB0yCy2bKEPeWFBG3m15/U5qHk+w9A17D
	14D+x5LLcp2PSZp7ynoJz+gIsE+fyD/5o+khR4j8DLWmtN6d5m8Q1OJH09gNIiW76z37NPTj7BRjj
	H+Xa8QaMBJXCVZdu7SHWH/utdiE+oW76pfthLrrOEB+mZEBekyz9lL1qg1Za21k6jQ7AS8Vrxbmid
	32Py6Y5JLn17Haa1bu1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sslyT-000000002FE-3lYL;
	Mon, 23 Sep 2024 16:31:45 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sslyR-000000002Ep-2OyO
	for linux-mtd@lists.infradead.org;
	Mon, 23 Sep 2024 16:31:44 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a8d2daa2262so595464466b.1
        for <linux-mtd@lists.infradead.org>; Mon, 23 Sep 2024 09:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727109102; x=1727713902; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xQ9IXPKcoO2aAJVUqui1Nik74LMtr7TP71dwMS6Tmt4=;
        b=b6hNW2sqpXGcb8wXsn5sFOUqOO+g8oXcc4nE/Od0N7burujki9wBUO+DagkJGZ0dad
         JpE1a5GqGsPIhogRd8EP3OYBM66iwo//ex67kAZtrGK4E2WA6ykxv/7ao4pQpcFh1ej1
         CMF+OJPhiAUdPkmk0l9doUspABZe6ixY7r2kfZT2Ey2ACYNt6AuMg2ccyfL5/ih+NRJS
         qRfEi9Hoa1ztovZFrR2G/tAYwagbwZkf8ONaIkpb8/SI35fET2ruZktOoSRkhzj+fMqx
         SYBXKH3QKyUQ8/qx4CdPNBaSUfqmwN9RrKP64DzBIIsZE9MPL16qUxHMupYQN8M1W/jo
         9dnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727109102; x=1727713902;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQ9IXPKcoO2aAJVUqui1Nik74LMtr7TP71dwMS6Tmt4=;
        b=r3dLnnvMesEd5Ck1CV4GEhri0UAc4vCZXNYZvezlD+vY/Ees9pWQjxaYsUs+/QW53w
         LLzdt1/dbDZRPxaz4I6dRNhWY2eR4haA5Vk7T/CCM5cVgc6xCNyUCUEtfPNepl08lKqA
         61d6Ebg/rH8UFpeKu2G38YoPLbbsCuli4urILkUFf6DVpVKpQeH64FV9R9QvHPkrD61o
         70DEGo8ICGyjouKLB9Kwnn5RHYGrA0iETliZNCsWrR46oGmfW0A2R9wpyKQk2Cc6V3kQ
         u/TCXlQRAxwFgIc4MRZ+laPyJTlKFQMTUbTnQVAt9IBVvOdOr3LD7Ep46MWKYNnOaiOt
         gJwA==
X-Forwarded-Encrypted: i=1; AJvYcCWHm3T5CZkL/UE6BfNElGKlRAnty7gzMYpmrCls65RKg65Q9OHcNFZSIcQSdox7d+JDXAMbJ4i9QzY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyGuv80UZPMh2LsqbdHrj0fAJzts/rs/qO1aDpDb7vk2GNSaNg5
	PPQ5M26440ENF1gBelaV43xvxCMrGUIWvY1webX1SIoIoYnR5/1aSBYBej2ZZpB9+es/szGa0XX
	ysIT7liruHyylVZHcU8B0uWJcvA==
X-Google-Smtp-Source: AGHT+IEkBJsEaKkiZf7XPyaAeoupkz7AviiwpDfFXYO8AAKPZWXhTaGvK2ID1LFyBCALPoOduXqpNp2Z2P07lzg5jD4=
X-Received: by 2002:a17:906:7308:b0:a8d:29b7:ecea with SMTP id
 a640c23a62f3a-a90d5182575mr1225005966b.61.1727109101816; Mon, 23 Sep 2024
 09:31:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240920181231.20542-1-erezgeva@nwtime.org> <20240920181231.20542-2-erezgeva@nwtime.org>
 <4e0cf43c-4843-451c-ac6f-86775dbccb2b@linaro.org> <CANeKEMOmhAPM1j1_ihzcC2wL6jKsWXPCGfZs+euS8mRvtqgE5A@mail.gmail.com>
 <D4DLQGLJSKPB.3OOW4RU9Q3K5O@kernel.org> <CANeKEMPSoUu7GW5bL8nuyC5xCKG7Tt0=SvWTL_CcX5oebqN_YA@mail.gmail.com>
 <D4DSTDA3HE2B.20ACE70SQAL7A@kernel.org>
In-Reply-To: <D4DSTDA3HE2B.20ACE70SQAL7A@kernel.org>
From: Erez <erezgeva2@gmail.com>
Date: Mon, 23 Sep 2024 18:31:04 +0200
Message-ID: <CANeKEMO1nyzEKGCt8N8_UCmAcQ3L53=H8U07AdJzcnFaVuwjGQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] mtd: spi-nor: core: add manufacturer flags
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Erez Geva <erezgeva@nwtime.org>, 
	linux-mtd@lists.infradead.org, Pratyush Yadav <pratyush@kernel.org>, 
	linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Esben Haabendal <esben@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_093143_633094_2598175E 
X-CRM114-Status: GOOD (  20.99  )
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

On Mon, 23 Sept 2024 at 18:19, Michael Walle <mwalle@kernel.org> wrote:
>
> Hi,
>
> > > > I would gladly remove the obsolete mx25l12805d.
> > > Why? I don't see any need for that.
> > Maybe because we do not want compatibility table?
>
> I don't get this? Anyway, we do not remove support for older
> flashes for no reason.

I did not insist, you asked.
Macronix stopped selling these chips 15 year ago.
How long do you want to support old chips?

>
> > No, reading the SFDP is great.
> > Except for OTP parameters/configuration.
> > As there is not way to find OTP parameters using JEDEC ID/SFDP
> > So as I understand there are only 2 ways to set the OTP parameters:
> > * Use a compatibility.
> > * Use dynamic OTP configuration, through DT, sysfs,
>
> * Use the in-kernel database to look up the parameters as it is done
>   with any other flash device. If the id is reused, look for

All IDs in table are reused.
The change I suggest is to read SFDP to all Macronix chips.
As today, we skip the RDSFDP. "to avoid no-op".

>   differences in the SFDP to figure out the correct flash device,

You can not do that unless you actually read the SFDP.

>   then add some .fixups to manually add the OTP flags and
>   parameters.

I am in favour.
As we can not use JEDEC ID or SFDP for OTP parameters.
How do you suggest manually OTP parameters?
Tudor Ambarus rejected my proposal.
I am open to implementing your suggestion.

I will split the two patches to avoid confusion.
So I will submit 2 patches:
* Always read Macronix chips SFDP, as Macronix replaced all old chips
in the Manufacture table.
* Support Macronix OTP.

Thanks for the feedback
Erez



>
> -michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
