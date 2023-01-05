Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D74CC3DA7A
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Jan 2023 22:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GyO5WhMvbs7nSGF8o+uAftq4Ml6As3YQ1HvpB0rW6KA=; b=r63W7ZOvHRezAC
	w9zFbU5Vt211CV6OK/hAR7LOSy2nBTFAefyYl8UMwGoV3WiOWvji1Bjia/pazurwmELb5bFS2nVF/
	00BCKqXTMPl/x8C7WlBcdMrx8PRplj2M+YQ35U/PQhF9pJBSPjJeo+2YbHhQK7G8ml+WJ3kXyFdOn
	MMxqBACXNlC2ruIAoq+VcDTfonlg0udSUWtDER5rCeBc8PJyg7pF7JzuzXIIuyyOV3fYxF2yfgekR
	XucY71cGaBDuR7yRQ3M7meHUSYeeeF/PkNbaTC9kLieNQRWXa0urjO4ejNJslT/8nuoqZ1raHTIs3
	ITu7tdQ4rJ1NlHGpG3dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDYTL-00FSvT-7Y; Thu, 05 Jan 2023 22:12:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVC3-00DlHY-9k; Thu, 05 Jan 2023 18:42:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To
	:From:Sender:Reply-To:Content-Description;
	bh=y7FiNjQPvBZWDMquvAACZH+FZUvH1HZr570pOOB5MWg=; b=ZMtiUfMr9mpBOWldDKHRmoT8yD
	ptbplqTPn3Qnb51sY7Qd7dlHHeiaVY6l8J9EHf4hO82C4dVobzBpvab0y2FwXD39QpCt4gpMfDNC1
	o/yfr0Yp+l/Zls+gJ18DZXmo7jBmyj3mXkjxj/HmlDnmeJAiBd/k6EY2Rbxm8ZLDT8qBOBEwtheHA
	m8c7AdNgB2IvtpJWo4VLgqWAtLEzMeYgYY8KveK9dgh0BJPBAoh92hExLuZd7ncquAs98WbXpSWoH
	gN73kszlHPmprbG4HakMFEEJRJGxXytciW51EyOH2IjG3dnuCG8LK7Q+85gmZiTyGaoGmtijN9Ohz
	hl1kMf5A==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDPCX-001J9R-0r;
	Thu, 05 Jan 2023 12:18:36 +0000
X-UUID: c09da628a9914af2a56c9bfdf833bffa-20230105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=y7FiNjQPvBZWDMquvAACZH+FZUvH1HZr570pOOB5MWg=;
	b=f/p8PuS5iqsYjzZQQzIYyKUHs58vVNGreuGbfANkXPRma/pkKs4rpb/xsuwPSsv8G+v0q3MPX4+xWMyo+/KN0fZs0T4161lwsxKpsxz8L4hueC09Y7a2DFqO4KAplMuYo4YHi8WCFiZMUIqeaSkyB4MGN3O3VMPgx8w6LOt3CRc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:5ffb489f-19e6-496d-938e-374cbfab8aa2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:4a7bbf53-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: c09da628a9914af2a56c9bfdf833bffa-20230105
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1203377223; Thu, 05 Jan 2023 05:02:58 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 5 Jan 2023 19:42:20 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 5 Jan 2023 19:42:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HIGvVxq/2E90ihpLu+MsLuGVGrmXLPSbTrztzv2Avnzg4fNtnN/3y8DqgOwVLFrAuY8Czfb4B4+EjRYa+XSpk+6KUvjtBOon3pfuzLK4FeEq+8QxRZTfoq3zj/oewV8iEiewIkdqCVQxxjLGe9rlR2tgRSM99rxio+w29+XVT/4veEoZSIJCiRVAOhE4yVepNJj8ODUHiefRvjz7QeHO7G3RTz0R9npSLdOcgfAKDYFQzK8OFz2pVKeG2z/XTI1ry5QHpMw+H10CWL902sMYbUCdyyoQ1+syjvCZQoi266lOdtLAUX4ApjPxgwXR1vOEHTN4Ip6youbom8Lsh3coKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7FiNjQPvBZWDMquvAACZH+FZUvH1HZr570pOOB5MWg=;
 b=mg9yWQlhiDUlaGU6/SHO3Zfgx/sKNjyvddRuS1gRAnFKiCyvDvRgh/+EutkCUY2S7u10TGuKZNz7i2xgTJraiewnlitBaZcABO0F+NCfg0DVlKf0bbuOIT4HjxJ74suDd25xd7MFdOfdxYRfTXlcB8NqishesQ7Nv6XycuzmNa5GprQI0jIGuwbI77Z8bQd9MFd+Nu8FGYt8MGlBEL/xPKm6E95UqeCbE392kFR2r7xOrEAJnPmri2OTWDU6yOdNnJV7Myw6pDrM07oLoz94Cmn7ILYZZ16Sw9fEVMyoH2Hmy527I5F+jrAwoE8oM3z0LOBA0XR3HptvenmUiV/Lug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7FiNjQPvBZWDMquvAACZH+FZUvH1HZr570pOOB5MWg=;
 b=XSDxq4lqJzBk+ariKeDMlb2NjzP/o69Z8ssZSPVcphYvdMMLE8IZI8ht+ks2I7TiHSVLiIdJG9RTdXcv1CL/NPrYUTWuaiqJRi7jhf4//qzAy1L/VTdb/0eKvXd7l8f4hvpYACsrauG7vk6x8j3hl1Q3tw1RjKu/OU3zEksmc7Q=
Received: from SG2PR03MB4565.apcprd03.prod.outlook.com (2603:1096:4:84::10) by
 SG2PR03MB6502.apcprd03.prod.outlook.com (2603:1096:4:1c6::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Thu, 5 Jan 2023 11:42:18 +0000
Received: from SG2PR03MB4565.apcprd03.prod.outlook.com
 ([fe80::e708:8bc4:ed9d:4037]) by SG2PR03MB4565.apcprd03.prod.outlook.com
 ([fe80::e708:8bc4:ed9d:4037%3]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 11:42:18 +0000
From: =?utf-8?B?WGlhbmdzaGVuZyBIb3UgKOS+r+elpeiDnCk=?=
	<Xiangsheng.Hou@mediatek.com>
To: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"mbrugger@suse.com" <mbrugger@suse.com>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "broonie@kernel.org" <broonie@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "gch981213@gmail.com"
	<gch981213@gmail.com>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "richard@nod.at" <richard@nod.at>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?QmVubGlhbmcgWmhhbyAo6LW15pys5LquKQ==?=
	<Benliang.Zhao@mediatek.com>, "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, =?utf-8?B?QmluIFpoYW5nICjnq6Dmlowp?=
	<bin.zhang@mediatek.com>
Subject: Re: [PATCH v5 01/10] spi: mtk-snfi: Change default page format to
 setup default setting
Thread-Topic: [PATCH v5 01/10] spi: mtk-snfi: Change default page format to
 setup default setting
Thread-Index: AQHZE1NHYiEe8abswEW4177v2fHgHq51VwMAgAC0FACAGcPIgA==
Date: Thu, 5 Jan 2023 11:42:18 +0000
Message-ID: <9dc8560088529c8599406a2d7c6f1f2c8e771c47.camel@mediatek.com>
References: <20221219024019.31974-1-xiangsheng.hou@mediatek.com>
	 <20221219024019.31974-2-xiangsheng.hou@mediatek.com>
	 <5ebaf98b-a77e-3c5a-3e08-bbb0119558a2@gmail.com>
	 <b9295291171dad0a455928cdb44a8ca91782532d.camel@mediatek.com>
In-Reply-To: <b9295291171dad0a455928cdb44a8ca91782532d.camel@mediatek.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB4565:EE_|SG2PR03MB6502:EE_
x-ms-office365-filtering-correlation-id: ed6aba5c-716a-4cc8-54e8-08daef11e66d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CQUYyvvHea1ioVeaUrnA+LKHDjR/FLyiawU47PrQPvo0T/L51K+1NhSK143EgabVeRUtjjUQ3vv8lD+0lTukskrQ9fyeD0es1veJXMdqoLMw32uRF5JBBnOf0wrGgNFPrQkQl3Bwdz4rZmF7nswAYwUQfEaIDAbGub50tcX/Qmtu6ORVkoKYYcGsKDf6qONo1a3oR05DGfdiceGQiIEE8LhnIwZ+2mK1JU5xcZNCbEcZAxbL1ELJCeZHiGnY0jLi74eWoCLLk8/DZR5M3DWUIqYbQCtN+hW/Z3eIKXU4S7r8XLJAYO8LTU98kS37edlOtrfxKp8JWEr9WIV0vboCyPNGOPjTJKehn426MCDaIyPaWN7dszP6PD2qWTKzaS/Kw6URkm9IiJPKlgx5mAe7Ut+hYyV6UwNxRt2npLbfV7s9yd6guhwczcxVvvaNOiOGPjDjxrOQd5OmrgTmthMMdUWnXtE4ieL6+IIgFTNzxAM0La+YWaBM7IBFBIQBISJGG16bMB2fXOn9RsrzpWHzBDhqulVyKXDLZ3HW5eJJrUcdWJlsxhaG/LUdhrQcHsmGlW5HtH+mIqRlv0b4Jmtd34g5hw0N3VMBW8TmVCc8xwxoB9LjVlZ1N+KuLSP4z2lKMXCtAezfIukCsmR6yb/y0B5z/nipu5v8L6LhH3s2HGa4E2q5UQtVWlxfJP0Amva8v57iqF+F8+is7ZrL6m6Ijw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB4565.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(451199015)(6512007)(54906003)(122000001)(53546011)(316002)(107886003)(71200400001)(186003)(110136005)(26005)(478600001)(66556008)(66476007)(8676002)(66446008)(64756008)(76116006)(66946007)(4326008)(2616005)(6486002)(6506007)(91956017)(41300700001)(5660300002)(7416002)(4001150100001)(8936002)(83380400001)(2906002)(36756003)(85182001)(38100700002)(38070700005)(86362001)(921005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QmZsYUNSNi9SdGx2TEFzZmdoNGpnbStEQm12dWl5dGNxRGxhdGdoWlVVdUI1?=
 =?utf-8?B?blVyb1VWR01rRFdTODNKZkUxR2xaK1NLL2hVU3hJZnRJSEk2bXdJL3pBSmYw?=
 =?utf-8?B?aFpudktNeDl6eU5CKzhyMlhrYUpQMGp3a0tTeXNiWDhDSURTRG9JdUcrUmRF?=
 =?utf-8?B?VlMreHNSVjgyaG4zQWg5UW0yaWNBQjFUSVZVMWlXeVdqbXJUcEV1cmpsd0Uw?=
 =?utf-8?B?M1o4Sm5WdXJHYXdBbmdXTkNraFVRSzVVa2oxM0xvcnl2RmNlVVpSY015ZDUy?=
 =?utf-8?B?a1pXSVlBYkRmREViR0xVVEZtTlFCNTEyQVJJY3VOaE1aQ25pcHZycUVHdWdT?=
 =?utf-8?B?S0RTQ3ZNSXhpaEl2dVF4ZFV1RW4xTWowdVkxNFlncTBVbTArcXdXRjdobnh5?=
 =?utf-8?B?NytMeitqSGtYVitjY1ZxMFM3eStRaXpzZG43NUhINkF5RFNhMHhpSHZZQ01Y?=
 =?utf-8?B?NFBIWHJkVGs1aG9laXMyY0xUZ2xnY1pVYm5ib0xRVkEvT3dCMGFCRkdHRzJz?=
 =?utf-8?B?MmNaaHZrVUN4LzNkR01MOXNVUFRaTXJIeFlsNVB6VkNzb1hpNThOY205Zm9X?=
 =?utf-8?B?L1pWeHNmVWZ0TDc3c3ArR3RIMEJraWNNdmNaenhCcnFYeHQ0VW5XSnRsU3NQ?=
 =?utf-8?B?WkY3a2tSSEpBZWRMSHBwdU9SanZKZEg1UGczYktxR1JQK3hHb3l3N1h5SWRn?=
 =?utf-8?B?ZFlQOXJPeTVzZTFUZEZsTlI4dmE2cjIzdkY1MFNBdEVGTTRITUFYckpadUxx?=
 =?utf-8?B?QXlORXY3T08rbjd0YytBZ3pibmVRUHFDWTJlckdNTTIyZ3AzZEVXeWdmTHhx?=
 =?utf-8?B?SFJKSXVkZ0ltQUJXZi8vdFN3TFgwNy9Ha3loc0lKeXVEK3ZQL3NzZWNYeGd3?=
 =?utf-8?B?MjBPeDk3bXRoNG5DWDBwdkQ1NU5JSjgwaFRoRWF4U1lqOHVJMmEyQWVmQlpu?=
 =?utf-8?B?RjN0M29rRmZTL1hBclM5STMxTnduR0lzaXowQjU5YXBQeis0aHhYdVY1QXVs?=
 =?utf-8?B?QTI3SytoVHRHWmxOZzBydFNMMmZsTjFjY0dqSENTdXEwOFdHUWFVOUdNSjFm?=
 =?utf-8?B?cnJPVjBEbjJMc0hRaXFnanB1UjNYdEZHbWFUU1piZGFzWVV5Y3N6SHNDWXZW?=
 =?utf-8?B?V0JpOUtzcFF0R0RuVzV4V3cwSFBWV3JDS0JFRHZKa3MwK1pyRjFTSU9pdC9u?=
 =?utf-8?B?TUlEZEpBcEx4QTBKamI2clZuajRiQkgrd29EUHV0YnFSK2NWNVJ5cUMzM1RG?=
 =?utf-8?B?RHBUUERpL2lwKzdpRTlZY3ZCK0R6QytiV1F1OG5OTHAzV2dFdWlxeEtOeFl1?=
 =?utf-8?B?QVh6UWppTnNIWjgxR2ZrTEJIalEzazJ4QjhJK1Q5dWI0MkQ4Qk0yZzJXeHpa?=
 =?utf-8?B?em82MGt6VzVFZlpQVDMvUnJuaDM0UzRpcVQ3N2cvdHpQalRreHNBRVkxZWFq?=
 =?utf-8?B?YXRFcU83ekJ6bVpiV0pVdFlqbXdGb2Z4V2VLcDVZRkNmRnpOY2JwYTEvbWQ1?=
 =?utf-8?B?UElYaE9PNVVCSTl5NGd0THNzQmVVUDYvRWU4RnpQdFdPQ09vTTVic00yRHpT?=
 =?utf-8?B?YVpDbTJRU1dwdzIyYk9xWHhpdXRsNkhLUGlBVzk0ejErVXMzZlZjZ29obmkz?=
 =?utf-8?B?V054czdoTE5SbVVRemtXSWRpTEIrUEJaTEVvZi84ZFpqbDAyc09YNUoySVhX?=
 =?utf-8?B?cEk2QVE4cGc3amsrdGZReUJlQzd3d05ScHdKSHBlSzFvOVA5bjk2cWE0RVNa?=
 =?utf-8?B?Z2JKMzFaQWliVVdkK1VJWFpRK2RyYWJZT0dUK081WW1XelBOTE1WT1BLbWxH?=
 =?utf-8?B?V0xZRlhaOTVEK2NPYWtZbkhSTUFXcVIyQUV3ZFNhSjBQY0RhTjA1RXpxRyt5?=
 =?utf-8?B?eHBNUzBXRG84b0VueXc5OHZuS01XTFZHM2Q3d08xVEdZOUhFMHZ3MlE3OG8r?=
 =?utf-8?B?SkVET3FubTFrYlZDOHdXeXpzejhYME5TY09aZ1BKS2NlZGxVM0d1WUkreGtL?=
 =?utf-8?B?ZmM1YzhGek14bkR3NDBqenRuWEZDcGVsN0xMaWI3WEZLYmQ2R3RhNG1VTzZE?=
 =?utf-8?B?dk1VaFFSZUh5K0taRUtQUVhxM0V6WVAvcEZwRTBRQ2ZjR3JTUHNZVzJjRGMw?=
 =?utf-8?B?eHZYTXlaTEsza3Jtby9HTzNiL01HVTZyU0lzZEZPQlB1R0tPOXJOVU5zRTNH?=
 =?utf-8?B?N3c9PQ==?=
Content-ID: <E506107BE794B6499A18DC7FA0CA663E@apcprd03.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB4565.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed6aba5c-716a-4cc8-54e8-08daef11e66d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2023 11:42:18.5128
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R+ynJE8wy0fIoJ4VJVKJjrbbbNl9c1SHPnFrUNf4wAigHzo7Ra5JzL5Ior7o+sztvpesQ68xzAEkJnyQ0LJDd72ukfaPr4zMtKcsnohS4NU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6502
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_121830_016732_C7048FBE 
X-CRM114-Status: GOOD (  22.11  )
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

On Tue, 2022-12-20 at 10:15 +0800, xiangsheng.hou wrote:
Hi Matthias, Angelo
> 
> On Mon, 2022-12-19 at 16:30 +0100, Matthias Brugger wrote:
> > Thanks for your patch! There is something to improve please see
> > below.
> > 
> > On 19/12/2022 03:40, Xiangsheng Hou wrote:
> > > Change default page format to setup default setting since the
> > > sector
> > > size 1024 on MT7986 will lead to probe fail.
> > > 
> > > Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> > > ---
> > >   drivers/spi/spi-mtk-snfi.c | 3 +--
> > >   1 file changed, 1 insertion(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/spi/spi-mtk-snfi.c b/drivers/spi/spi-mtk-
> > > snfi.c
> > > index fa8412ba20e2..719fc6f53ab1 100644
> > > --- a/drivers/spi/spi-mtk-snfi.c
> > > +++ b/drivers/spi/spi-mtk-snfi.c
> > > @@ -1430,8 +1430,7 @@ static int mtk_snand_probe(struct
> > > platform_device *pdev)
> > >   
> > >   	// setup an initial page format for ops matching
> > > page_cache_op
> > > template
> > >   	// before ECC is called.
> > > -	ret = mtk_snand_setup_pagefmt(ms, ms->caps->sector_size,
> > > -				      ms->caps->spare_sizes[0]);
> > > +	ret = mtk_snand_setup_pagefmt(ms, SZ_2K, SZ_64);
> > 
> > Couldn't you just set sector_size in mt7986_snand_caps?
> 
> The function mtk_snand_setup_pagefmt need use page and OOB size of
> NAND
> device to setup pagefmt.
> The controller page size can support 512/1k/2k/4k..., the sector size
> 1k have been set in mt7986_snand_caps. However this will also lead to
> fail in this function since the 1k page size will not be supported.
> Just use page size 2k and OOB size 64 as default parameter since this
> can be supported by all ICs with this controller.

Could you please help to review this patch.

Best Regards,
Xiangsheng Hou
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
