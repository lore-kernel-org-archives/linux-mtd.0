Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47810C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Mar 2022 06:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uEJLSRYj9pazFEUnKW9FyfnJekWAvsmnTjPVPFC1myo=; b=pXIPOJARDCe3Mv
	Vf78t/pBoP+OgW8IOtli6u/QUfKo1zW/MCJgJEpF6iWRR0hZ7Mx5r9zBfoygH40ihsk05t3a8A3rf
	Sf5Jz+NCp+5RY8M+TeNb5iqVI8fptQJBYCTfy3nSxNCWnWYkB4DYH335j8YJWSLxh9fnx2vBR07L6
	21K7EU798jpVbkmQEdW/YcDzcH73bv1qFPog4Q7zBTktdXx8dmss4acpmJG23cVx+QeBqJyCLAKcU
	RC0PEMUDbi5BC6GrluWvM4EotzRodku0HvZOpzzjmy6Gb0+UjZTbXR8wvEGp5szbLDF0cyDGLwODM
	eGJ1mB+XxridyrM743Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU0R5-007w4H-LO; Tue, 15 Mar 2022 06:13:35 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU0PY-007v9J-EQ
 for linux-mtd@lists.infradead.org; Tue, 15 Mar 2022 06:12:02 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22F6BtLv065584;
 Tue, 15 Mar 2022 01:11:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1647324715;
 bh=0wTMRubLXBAHb26iPo5psEb82ebqhC7CR8jtGqFDA/M=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=PWTt7yFcUuFrwo0BTVs5vJo0YRUSxqZwu0Gat2HWNPopca3QuOoqoIqbwiLs8LrSV
 CHxWTYpVQQGtWEdkFWr/Up8NQOTcYimWxXVz6mgw+8UeS1vu+iEagGeWLmHW08lWK9
 FZDhdUIMNuF5cPR5X2TiEobhdqN6khHPe8C5xme0=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22F6Bt7c064821
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Mar 2022 01:11:55 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 15
 Mar 2022 01:11:55 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 15 Mar 2022 01:11:55 -0500
Received: from [10.250.234.22] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22F6BqS0060265;
 Tue, 15 Mar 2022 01:11:54 -0500
Message-ID: <983a44fb-2f79-57b5-c161-2684feb2a0dc@ti.com>
Date: Tue, 15 Mar 2022 11:41:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] mtd: cfi_cmdset_0002: Use chip_ready() for write on
 S29GL064N
Content-Language: en-US
To: Tokunori Ikegami <ikegami.t@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
References: <20220306153213.411425-1-ikegami.t@gmail.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <20220306153213.411425-1-ikegami.t@gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_231200_585076_3E715088 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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

Hi Miquel,

On 06/03/22 9:02 pm, Tokunori Ikegami wrote:
> The regression issue has been caused on S29GL064N and reported it.
> Also the change mentioned is to use chip_good() for buffered write.
> So disable the change on S29GL064N and use chip_ready() as before.
> 
> Fixes: dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to check correct value")
> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/r/b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de/

Could you please pull this in for v5.18-rc1 as this is a regression
being tracked for a while?

Acked-by: Vignesh Raghavendra <vigneshr@ti.com>

[...]

Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
