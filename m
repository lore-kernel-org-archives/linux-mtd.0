Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25BEC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Apr 2022 08:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r6XYX88fn2GB6gBB2yBhCVuqZYEe7BKe34VcsazLQDo=; b=CndfappVoFyg8W
	KRlDjdQANzB3qwU9Ss3O4PU5Uymp2eyGWV3H3uct/dltPSZwkmwKHtzj/q4Bz+GePcQaR17e58zgi
	tXjSMpW5sTkRC9rWWAK6f7I6/AT283FG2qprlKf/0GbmJePMlSEqZSNKcxCYgA7B00zaLGRFij6Tn
	sT6ADaIY4JUWq3jW4T/TWMxSyPoeTqoCnMksXrU35Cy6qPpdocPKpOAOmOAfPYPOK6fgNfTPDN7/t
	WoU8zL2aKz6bFdLqpboOfYPmPwBne+wh8QyQsfTqKVZbwdIydh0c5xZNVdcP/ZwpiVrOZ/3G8t5bh
	BMjmG3rpCdbXJZSizn5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngN15-00G7Th-9y; Mon, 18 Apr 2022 08:45:51 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngN12-00G7Sf-4l
 for linux-mtd@lists.infradead.org; Mon, 18 Apr 2022 08:45:49 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23I8jeOL065277;
 Mon, 18 Apr 2022 03:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1650271540;
 bh=+U6Hu+9lZI/gVP37GKxe1CGnlGr3BPUFHc06XHPe+Yc=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=R4fKlmyi2Jp/L/nnOaeYRVbOoQMpB/SkyqfU4o6LfNv3s1cNHTT7ArtiQ3ZYyx0W6
 rMuTciU+5JsNaqtFlc4k1r52aS57XL15elfJXzwKnd6yJ5FPKrEg5TwSBtOq3U6dsH
 fMTm2MCFVcZXS8V8pNeopai8NAKZiQ1ithKDNP8w=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23I8jee6009519
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 18 Apr 2022 03:45:40 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 18
 Apr 2022 03:45:39 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 18 Apr 2022 03:45:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23I8jd8v008590;
 Mon, 18 Apr 2022 03:45:39 -0500
Date: Mon, 18 Apr 2022 14:15:38 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH v3 3/3] mtd: spi-nor: Favor the BFPT-parsed
 set_4byte_addr_mode method
Message-ID: <20220418084538.ccvqhbik6a7ffz5j@ti.com>
References: <20220411125346.118274-1-tudor.ambarus@microchip.com>
 <20220411125346.118274-4-tudor.ambarus@microchip.com>
 <a6519a1ce39534c35760334cd69396b3@walle.cc>
 <2c77371b-355a-5a1a-a83d-7bf40b088683@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2c77371b-355a-5a1a-a83d-7bf40b088683@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_014548_329124_89289352 
X-CRM114-Status: GOOD (  15.16  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 14/04/22 09:32AM, Tudor.Ambarus@microchip.com wrote:
> On 4/14/22 12:21, Michael Walle wrote:
> >> +static void macronix_nor_late_init(struct spi_nor *nor)
> >> +{
> >> +=A0=A0=A0=A0 if (!nor->params->set_4byte_addr_mode)
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nor->params->set_4byte_addr_mode=
 =3D
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 spi_nor_=
set_4byte_addr_mode_en4b_ex4b;
> > =

> > This is more of a general question. Can we have this in one
> > line? IMHO this looks awful and since linux nowadays relaxed the
> > 80 chars rule a bit and we have such long names.. I think it makes
> > sense to allow some lines to be longer than 80 chars.
> =

> I still split my terminal in multiple windows and pretty much read
> code in a 80 chars limit. But I won't argue with you, it seems you
> care about it, so I'll change it.

FWIW, I do the same. I won't like it much if line lengths get too long. =

I won't take any sides here though, either should be fine as long as the =

result at least fits in 100 chars.

-- =

Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
