Return-Path: <SRS0=zrsi=EJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9172C388F7
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 12:48:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EFA620735
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 12:48:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p04OgQ/P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kUrtmRA0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EFA620735
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MCyKeFZQlx3xgOKAzmL9i/DRohU7b5aOFpdh5KqbGBQ=; b=p04OgQ/PdnIQTc+PX0ppmF1FE
	jLNjp1AfBdHBjmoxxhRqbPEdbD6q8jFAwWYGr0qT+GGUTSzsntQgNNQRB0HtFW1LMKg1eZlBnzOiW
	nYPkdS8NiFHlBGwJFUEWnFsNzYMqmkWO+GLXHLL0rdTmvZtNmBr2B1nuZQJumS5LWGgblE2WwLuHb
	yPzOIZx3tyH66fAO6jGNgguYbNV04+odwdSDGm0ifh+vID+W16UyG4X0/R4Zz0sRDNzS9MPsWZrIR
	UzcUfb3yCNYIsYGu/8MbIBwASgxrXOZVYTzAJU4lsWRD2cqWpyPnwOM4vpVhgv0F0yQkOTkRcFKZq
	WtUOICYaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZvj9-0006pG-Qb; Tue, 03 Nov 2020 12:47:56 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZviO-0006ZA-Rr
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2020 12:47:09 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A3Cl5BB084289;
 Tue, 3 Nov 2020 06:47:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604407625;
 bh=7nU52jDNskuCFoByT3d/IVtGXinvA+e6Q9ImtTKXrqQ=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=kUrtmRA0ut7UInOUh0yEAfREvbkPL9LcL9ghEVEZVE+ftKEKf77G+XZR+b3jyjZX5
 klTIjiuCLxfJfAOaAUqkRI75K3Zh8nK0V9UmyzliUDiuGKAHMZVa1SdplMz6wJH6y7
 rT+7V+tkdRRfi8KcpW1QFIyxkAybCB0hmNuNIwAM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A3Cl5JL061364
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 3 Nov 2020 06:47:05 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 3 Nov
 2020 06:47:04 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 3 Nov 2020 06:47:04 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A3Cl4xG040830;
 Tue, 3 Nov 2020 06:47:04 -0600
Date: Tue, 3 Nov 2020 18:17:03 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 2/3] UBI: Do not zero out EC and VID when multi-pass
 writes are not supported
Message-ID: <20201103124701.xgjomxzemhnczqhw@ti.com>
References: <20201012180404.6476-1-p.yadav@ti.com>
 <20201012180404.6476-3-p.yadav@ti.com>
 <f013d7af-6e1d-5b8f-4a23-7f6c150f896a@ti.com>
 <782317824.260495.1604404771008.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <782317824.260495.1604404771008.JavaMail.zimbra@nod.at>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_074709_020840_A5A84149 
X-CRM114-Status: UNSURE (   9.25  )
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 03/11/20 12:59PM, Richard Weinberger wrote:
> ----- Urspr=FCngliche Mail -----
> > Von: "Vignesh Raghavendra" <vigneshr@ti.com>
> >
> > You may want to get rid of assertion for mtd->writesize !=3D 1 in case =
of
> > MTD_NORFLASH.
> =

> Agreed. I hope nothing else breaks if NOR has suddenly a writesize >=3D 1.

Please see my response on the cover letter which explains why I think =

setting mtd->writesize =3D nor->page_size is wrong.

-- =

Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
