Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE65C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Dec 2021 08:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5yiBDz82qJqVUoptIDwEjfKEZ8UCWl+6AV9sei83Stg=; b=bRF8U/P/+Zis/P
	WmvvNR78W+pLiPPleoxGGtoSgGH+Hap8smn5VkpHmIrrtdEorMNSNXKz8HSpj+GoK0Ni+QngBcqQM
	zH1wOCqk/wlxKAqgoa9NmZ2ow9newnE+HqCX7VeDGZ/IgWfZg9ueTGTMzWsYHC6KjgMaSEruHgC0R
	VwjXGA4U2BsAhb/MISSpX7n8mJtVIVFHCBuNqnAI4IftAx8SmDahxIrTecvV5GFQYt+NLpYWxaMmv
	wfO2PQ1vO0vdY2QmH6NPdDL7oNhy8KqU910OsiVYsBp4UYE8Elvjzsuny82x3pwtHkthBP7oXWLIX
	GpQvxHd1GcWesjBybH3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzx2e-009hdj-MF; Wed, 22 Dec 2021 08:32:08 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzx2Z-009hbo-UG
 for linux-mtd@lists.infradead.org; Wed, 22 Dec 2021 08:32:06 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BM8Vs7R084180;
 Wed, 22 Dec 2021 02:31:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1640161914;
 bh=Vc58ap0YNTCV3EPPiHIaPaA65V79GNUwSwP0Gs0Yvj8=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=nxUWP//6VYxiiUJpHyrqeXLk33zDgBHRpfcosvue+3A378IiyOhLv9j59undxonyN
 3HD7kqUCyl4OfowxpjHopGxvOykaKMSBiConM7XlLzXThNgGwK2DkZIhw314PYISr/
 gsbnOT6wsRBUP6IuKNnCD6phwBf7MJUmOBi/o+pg=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BM8VsEU119910
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 22 Dec 2021 02:31:54 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 22
 Dec 2021 02:31:53 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 22 Dec 2021 02:31:53 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BM8Vrjb113455;
 Wed, 22 Dec 2021 02:31:53 -0600
Date: Wed, 22 Dec 2021 14:01:52 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, <linux-mtd@lists.infradead.org>, Mark Brown
 <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Julien Su
 <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>, Boris Brezillon
 <boris.brezillon@collabora.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v8 01/14] spi: spi-mem: reject partial cycle transfers in
Message-ID: <20211222083150.i4semnybo2l4aede@ti.com>
References: <20211221174844.56385-1-miquel.raynal@bootlin.com>
 <20211221174844.56385-2-miquel.raynal@bootlin.com>
 <20211221184148.pw4blwxdvxcoerjo@ti.com>
 <20211222091223.5bf11221@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211222091223.5bf11221@xps13>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_003204_149429_000E5CE5 
X-CRM114-Status: GOOD (  17.31  )
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

On 22/12/21 09:12AM, Miquel Raynal wrote:
> Hi Pratyush,
> =

> p.yadav@ti.com wrote on Wed, 22 Dec 2021 00:11:50 +0530:
> =

> > Hi,
> > =

> > On 21/12/21 06:48PM, Miquel Raynal wrote:
> > > From: Pratyush Yadav <p.yadav@ti.com>
> > > =

> > > In 8D-8D-8D mode two bytes are transferred per cycle. So an odd number
> > > of bytes cannot be transferred because it would leave a residual half
> > > cycle at the end. Consider such a transfer invalid and reject it.
> > > =

> > > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > > Reviewed-by: Mark Brown <broonie@kernel.org>
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>  =

> > =

> > Sorry, I didn't realize this before. This patch would break a couple of =

> > SPI NOR flashes. You need patch 1, 2, and 3 from my series as well to =

> > make sure this does not happen. Since those patches have some pending =

> > comments, can you just drop this patch and I will re-roll it on top of =

> > your series later when I can find some time for it? Again, sorry for no=
t =

> > noticing this before.
> =

> Yes no problem, I might as well drop it when applying.

And drop the changes from patch 3 as well.

> =

> Thanks,
> Miqu=E8l

-- =

Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
