Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FDBCC4727C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 21:27:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E31BD2075E
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 21:27:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mka2lxx4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qFbPR1sn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E31BD2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HxlncU4aqV38+FBlfVkpTJMG/rF8lS2VkGR/fwns4Rk=; b=Mka2lxx4OVA4x1OhuzJDRlrV/
	Pp0a5d7vioO9ITvpms4Qu4F8+FfJjMMBEOQsqT5E9+9z4ZQaBWBUoOLVAyFnIO426Sfo/UIsU9ul1
	30KzyjvHPiWFDWhWoer3WRyrrK88v10iqxo0+6PDVR4voykUCYtNoBlIJu4HX77Q1zIL2ruK57bZj
	x71A+bJjWtrYFQ/vQMqf4B2a7lItgRlrKoIyCiCTRr269oou6zub88Li/0mIK6F+RY8kQe/7U1VhI
	4SFzlH+ioIRpaiBtp4yxS8SksYygDVE1K2PViL+4bOetpF0+YuIreuchK549BARd65IUq7Js7NX/S
	frtCVYIrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNN8q-0003u3-Ew; Tue, 29 Sep 2020 21:26:32 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNN8o-0003tC-KH
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 21:26:31 +0000
Received: by mail-lf1-x141.google.com with SMTP id 77so7314322lfj.0
 for <linux-mtd@lists.infradead.org>; Tue, 29 Sep 2020 14:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DDFeFeVqCrINP8FJ5HgmVJ4/cJvfvbE2c/Ht7AFY3tQ=;
 b=qFbPR1sn4sRLAzNpp6kzxbwjFJ+QRIzJ056EFNEOb6o7jIB+ZrjGDLSRbV1RcuP9aj
 5ey2ZI6q00AFtNWk5SNYdDBR3N+FarJY5Nf20n1QAHVg4FEUXp0V0HtNNxrSJsMeiWLJ
 so1qv7BmfWkt1hr7hSelO1VjeEmHAhdIBsRXAOF066mTGHl0Hn7HiOKbeHHK6PRGsa3Q
 Ux04yGUa41swQZTyAVq/9x0wB9H9uz5m3E7DTsXq7SXlxhtbK1Ru7MGrvFnEHX+K+iRG
 4LhknZlsWrd8Jfxa5Utxm96wQ9FupICIIaopx2q2cC1OlygjYKHqzttohMNWGIy69l+x
 HPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DDFeFeVqCrINP8FJ5HgmVJ4/cJvfvbE2c/Ht7AFY3tQ=;
 b=i+PEZC/1Pkeh6/djeB9yCrs8GGsZSZ5HsL+PsnKTjlT8i+BFD6ZilB/x/XB7vyBiRP
 N32xO2MrvhRvCMXeegtw1UD5MZfnh+kugYyHYNFfunH1SpahzhEQbI4Et7PPunZjpx+u
 9Yn6IoncAQFfFJdwfJxRaMc6RYBJXvbuGns6dH+oBruqcrKhEdQ/H1uQHjX3YZr69riS
 Z09vGDZesJ6UjjW5ffwt8h03xG10W21qARu5/AV0ZRCJo6UhPzR4YoM8sLx+wzJVN4fd
 kNEyzVo2ZdF2mhkVX79ZQWpK17qRx31wE1GTwW3XaPWfJRI9cTTp6BA8AWoeMpNS3bMp
 RScA==
X-Gm-Message-State: AOAM533mfdYgh7IoeeJLYZepRKRDKOwv28PPzT5EC8mp4IMwST+ENmz9
 +bc2gmOFPlz1bwR/QaIFnNk=
X-Google-Smtp-Source: ABdhPJyKx9rOtX1GGPNBZaxbHtcjv1N/MogI50VfM4L83UJNT5ohQuzCPVxqzAxFR5zr+dy42OQR+A==
X-Received: by 2002:ac2:42c4:: with SMTP id n4mr2071859lfl.563.1601414787771; 
 Tue, 29 Sep 2020 14:26:27 -0700 (PDT)
Received: from z50.localnet (77-255-201-154.adsl.inetia.pl. [77.255.201.154])
 by smtp.gmail.com with ESMTPSA id
 m206sm3334393lfa.301.2020.09.29.14.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 14:26:26 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v13 17/20] mtd: rawnand: Use the ECC framework OOB layouts
Date: Tue, 29 Sep 2020 23:26:25 +0200
Message-ID: <1761984.tdWV9SEqCh@z50>
In-Reply-To: <20200929101501.18495d8b@xps13>
References: <20200827085208.16276-1-miquel.raynal@bootlin.com>
 <3339465.iIbC2pHGDl@z50> <20200929101501.18495d8b@xps13>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_172630_713969_FF38433F 
X-CRM114-Status: GOOD (  19.09  )
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
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On Tuesday, September 29, 2020 10:15:01 A.M. CEST Miquel Raynal wrote:
> Hi Janusz,
> =

> Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote on Sun, 20 Sep 2020
> 14:21:44 +0200:
> =

> > On Thursday, August 27, 2020 10:52:05 A.M. CEST Miquel Raynal wrote:
> > > No need to have our own in the raw NAND core.  =

> > =

> > Hi Miquel,
> > =

> > This patch introduced a regression for me, at least on ams-delta which =

sets =

> > nand_chip->ecc.engine_type to NAND_ECC_ENGINE_TYPE_SOFT and =

> > nand_chip.ecc->algo to NAND_ECC_ALGO_HAMMING.  No related kernel messag=
es =

> > could be observed, but nanddump fails with "pread: Numerical result out=
 of =

> > range" for me.
> =

> Thanks for the report and sorry for the delay!
> =

> > The ECC framework OOB layouts refer to nand_device->ecc.ctx.total which=
 no =

> > driver nor ECC engine initializes so far, while the old layouts used to =

refer =

> > to nand_chip->ecc.total, still initialized by nand_scan_tail().  Is the=
re =

any =

> > work in progress which will address the issue (initialization of =

> > nand_device->ecc.ctx.total at least)?
> =

> Indeed, there are more changes coming and the update of ecc.ctx.total
> was done in an upcoming patch. It makes sense to update this entry when
> switching to the "generic" layouts, so I moved the line in this patch.
> =

> I just updated nand/next, please tell me if it fixed your setup?

I won't be able to test it before next week, however looking at the updated =

patch I think the issue should be solved since a similar line did help when=
 I =

added it at the end of ams-delta's .probe().

Thanks,
Janusz

> =

> Thanks,
> Miqu=E8l
> =






______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
