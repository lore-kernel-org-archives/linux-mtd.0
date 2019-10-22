Return-Path: <SRS0=fgf0=YP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E08CA9EA0
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2019 10:01:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F8DE2064B
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2019 10:01:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GDmki3UB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F8DE2064B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sUFvOMBvJWIMogsGiUP6XHqIdrHT2ICRMWqzZI+yKgQ=; b=GDmki3UBwG9E08
	fsx7Wh2ZwwM5zgS4mbWu/Trtrg6kKCs8RN8HDQjV9B5RqtfMcZWj5CKHwn5hrsVSaI3Vyzv83yU+O
	EpzmgA62dofKeu/wsfOBhsAQe/ODmeckXrnRLKaLmMSiIhYDsTy5xArflt+EuK2e2FoVx9uTB966y
	97DX4td0QSm0Yfy5cE+emAt/vyhyvUa3AVDMUc7LOyr5sk3a/RwAbhSUd28OaNWomwF0TecJyZrhz
	Mrt+pLrsw3AZSZNI5Yu/3NNh96dWybXYZw1HGsauTJHnWYoWywII2Mc7n/MDNd44PGtE3L5NvvdN2
	iqotQaJ/7KgU6QVxip8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMqyW-0005mV-Nz; Tue, 22 Oct 2019 10:01:12 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMqyU-0005l4-NZ; Tue, 22 Oct 2019 10:01:12 +0000
Received: from mail-qk1-f178.google.com ([209.85.222.178]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MlsWZ-1heTWy48qB-00j3KU; Tue, 22 Oct 2019 12:01:08 +0200
Received: by mail-qk1-f178.google.com with SMTP id 71so11787947qkl.0;
 Tue, 22 Oct 2019 03:01:07 -0700 (PDT)
X-Gm-Message-State: APjAAAX/AMFPHrwgr3y2ZH5BgYKZbPYi/l/dgj4eu4dKnpfMu/2rN9iF
 dZ0VA+gunYfx5NkLS5+dhXvL9JjGUCbvgWW9YIs=
X-Google-Smtp-Source: APXvYqyoMIjk7fBvUWRiXF8k07tFQvXGIdLU7kRIlPOeM1jTgptpSLpWi87upCSM+kuYDA+uEkyDtyteslJySUIWKjQ=
X-Received: by 2002:a05:620a:4f:: with SMTP id
 t15mr2145972qkt.286.1571738466579; 
 Tue, 22 Oct 2019 03:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-11-arnd@arndb.de>
 <20191019114417.5268f7e4@xps13>
In-Reply-To: <20191019114417.5268f7e4@xps13>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 22 Oct 2019 12:00:50 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1pR=fmvDr6n22Zp1XM7J=durtt1Au8F2qg3=Jc75DrNg@mail.gmail.com>
Message-ID: <CAK8P3a1pR=fmvDr6n22Zp1XM7J=durtt1Au8F2qg3=Jc75DrNg@mail.gmail.com>
Subject: Re: [PATCH 11/46] ARM: pxa: cmx270: use platform device for nand
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-Provags-ID: V03:K1:hTM4JzNQRUblZvcl0sHzefFPdcFbltqpR4VaEdhtPR0TQf84WqV
 GF+mfAbfrtIAlCQMvsdcDBMQb7Th7Yd0qa9JFaGjZcLHIjTfblwhkH5TKIh2BqlHXSTaiLy
 r+ffBtucEt4zRwJ19p+R7lLFs+TLwlXSnzfZS5vpNdkZH4yJVsrhuF2X8Vdo9sFiQkVvMQl
 g8fy+1UNj5GLCsbZBTaCw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:C7JzdWLTIeA=:I8oa2vXVPJ82sV+v2tkvBy
 WghiGjjJI9y+BuIEmCAm6tVigVKM496/CQ8tmzoP+ksbQzt7Q1BYZa8+ozSmFAllTNXFh8lDz
 SV44quJqrKkqpVe08HxpQXu7Qob7gvexuGBGlZ50qr+C9EnLe13CWI2RWDIIabz12K4TVK1c9
 SIKfZ+00asPcbR3LgDDlxU7E/31mxky8wKjJq9VzaLfzgQzAu+Y7RfGP67kAG7aKPsiBofTr1
 3d+7085dTslyEa+e623EcZwxBYwSBDbzT5lDhlW2PJoIdUiNk5MnvN6AD/wB65jsY6/2ojWoe
 6oUrJgvVn4TwAmpCmtxWT0ssxb8C1TvUdn3tT1LdgBw3LAT9lHKe8QKa3iyIQNaKKyjmAa7bP
 6pEKLtB9JKPusna/C15OgsIOF0mQbxctRoEZTFrO/dfaFdlGRpUnKAAOWAPEa4+EtuaISM9dv
 UnrQlkK26rYHu01NRu4pbFf8x5yqZx/mVdpfoACs0qJzT5qaiRiDaTA8J3sREP828a9Oi+1go
 LAb73cCFfQ7xRZLU5gFPsxeSUdNFJm73jArSwu4/xttFAYkwDUr7yZv1icQonjNeP/KjwvyCN
 lOIrGyw8bobzHxIPcXD+mUKip8zChcYoKuXtpP17TFBNOotQwktOp2CzSFeXAzH39JdteBz+l
 GZnXweeerrMwyPmBxRuDM0j4A/KWEytSZlPYkku5ugruexxTizShw8NbC91WO3VA8zP3y7ZNv
 ypb6BIqKXR2UnP4TwDVROmXV6y5mUgFxHoSS6kNayUwMwFjlmiOhstn+6vdM0He679M9Caat4
 SaQ6kz+nie3FCvfdfA0X+V2+IqjXsG4XrQI3di4nzMhaT6Cl890MFqOtY8I7s9eV2i2f5GjEA
 Pk0j3uMpsjj52dGkaFKg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191022_030111_063509_DC562168 
X-CRM114-Status: GOOD (  14.25  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Daniel Mack <daniel@zonque.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, David Woodhouse <dwmw2@infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Oct 19, 2019 at 11:44 AM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
>
> Hi Arnd,
>
> Arnd Bergmann <arnd@arndb.de> wrote on Fri, 18 Oct 2019 17:41:26 +0200:
>
> > The driver traditionally hardcodes the MMIO register address and
> > the GPIO numbers from data defined in platform header files.
> >
> > To make it indepdendent of that, use a memory resource for the
> > registers, and a gpio lookup table to replace the gpio numbers.
>
> Looks good to me besides the typo s/indepdendent/independent/.

Fixed now

> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks!

     Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
