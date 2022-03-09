Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745BBC433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Mar 2022 08:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ma/V4a21+Li8Jhcd/kkcBvJEsm2r4KliGNzfQP9Cx24=; b=IqYFpgDtqBOJ9R
	+S570LlxAOJxzonYfIcADlh5q36AYMoj3pQf23w7KXhlwS1bh5OFakQt16z/8189Ia4+BYf1Jq+tX
	Qc8e9j+gRVKN6cyTLSzwYt7IV/+gROtKyHUtE2ug2/dTdPXGGMClGznjxTfx4B4ubeyfdColt25TO
	9yooddj8vguEMoKg0EY7ArWGfB9GbpmfCQkKcMZdIoE8I0TlQqkoDAkDcjFlfk44PqMY+Hcz2bjKM
	v0T9YYRl7/tO0TGHoUwdlH0BlZeH30AzrIMMHDzxZHG0IJGk+o8jmbxUBs4FlTSY+TL0zCe4+odhx
	ke4924/1Lj8VzkzlDaBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRrVn-007j5s-Oh; Wed, 09 Mar 2022 08:17:35 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRrVk-007j50-2u
 for linux-mtd@lists.infradead.org; Wed, 09 Mar 2022 08:17:33 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2298HQmv043798;
 Wed, 9 Mar 2022 02:17:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1646813846;
 bh=bD6KVamgm4IljvOFoK+dRnBXUAG1o3zwKzeJrLkUEYU=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=vEc+8br9tyLNDn1XbjovFx/S601BihWRAe8oWkm6DTx5ukvX+vz68pVAPnE+yXPd9
 K0twzjEPleRq33KR5Fd3JE1hmNKXs/TZbpVxctUVsbsU0fQ3+bvUOj/ayrFwl52bdM
 XlmoU0wMSJ9lJfNqfN0sUy8vjMrsCGadLi4NVe2U=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2298HQKM087060
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 9 Mar 2022 02:17:26 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 9
 Mar 2022 02:17:25 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 9 Mar 2022 02:17:25 -0600
Received: from [10.250.234.22] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2298HNbp064358;
 Wed, 9 Mar 2022 02:17:24 -0600
Message-ID: <90374ffa-0fe6-dada-32b2-445854125b11@ti.com>
Date: Wed, 9 Mar 2022 13:47:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] mtd: cfi_cmdset_0002: Use chip_ready() for write on
 S29GL064N
Content-Language: en-US
To: Tokunori Ikegami <ikegami.t@gmail.com>, Ahmad Fatoum
 <a.fatoum@pengutronix.de>
CC: <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
References: <20220306153213.411425-1-ikegami.t@gmail.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <20220306153213.411425-1-ikegami.t@gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_001732_222431_64CA5B5E 
X-CRM114-Status: GOOD (  10.12  )
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

+ Ahmad (who reported the bug)

Hi Ahmad,

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

Could you please test this exact patch and provide Tested-by so that it
gets registered by patch tracking systems?

[...]

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
