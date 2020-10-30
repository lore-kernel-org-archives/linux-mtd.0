Return-Path: <SRS0=OfxJ=EF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D600C00A89
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 18:40:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D1E6206FA
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 18:40:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hd9TX/Va";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=infinera.com header.i=@infinera.com header.b="SaBzx+pR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D1E6206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=infinera.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RmilUixVAvMpjW1xUBwzrl+caq7ubwt+sFeGZgzwZkY=; b=Hd9TX/VaFfHapCb1WWYA78k+q
	SOcbLapI7P8hvO7nP+PiymDnQTMkh0pU4/vvHTnTmOUDgyB41v7fs2Fu68Myu+zYDsCAf0SNg87ja
	abvBB1mcj9aeUAzHV9wSg2gPiUM0UoJxx5oqSaycOJKeMGbPcO6vZQQcaGnGbRSlhPwVCJ8OyC0Da
	4Ug0WxHn4jm8K0KYaxCk9tX121mt7OieCy6eHQAtK+hUkdhe8c+rbo27TAwGoJ//iYwivnwvUATX8
	jkEAxz6QvKzKd6dHJTv6rcapQA30+SKgSz3AyApEsyYMW26FNVXYFzboHyGh0vcT0en3fPwM9AeiE
	HpG/NYjYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYZJQ-0004al-CV; Fri, 30 Oct 2020 18:39:44 +0000
Received: from mail-mw2nam10on2054.outbound.protection.outlook.com
 ([40.107.94.54] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYZJL-0004YG-TZ
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2020 18:39:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHMOsuV3sisUVqfYGg5UF6U8f0G7/M1ZxUC3CP1QJBuZAKxSA/rlSCI9xkW+SKanxLhjkD7wMMi/4O1o9Mqfu74CfG+fikO+PLSF+/UhZbUhtbDH2myur3jqE1i5DTL+onUyzWLcFC8XcNoi/EuZ85LpkZwv7alenvwAzxNb4dOWDP+dLXrpnwNba0N4SA+QBDUZsoikE6T3OSDb06E1silYQA62keGMnswyJMgEAM9wQawe5xFAX7WwE4ye1Lv4xYVcwvayEVg+P61w41GP+OAAIhs5YUuQnGQp29CrhQiZXkvl/CC8nUCrd5063VRbSnY3ch4fsIWPWEghqrWm1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QD+KsBoE89wYiqxRaEzRInzuYTIguSMEljgzGRZ62bs=;
 b=mSmeGJ7YKpPlBsYkwD6R4v8CEBlzUyNPM+nXT0Y3c7CnOW/ibwljJKkVLXtlT9jq6qCbEay3ZTzXYZYe0BfxgkijR4lz4vqEP3hoevitp3DvKZzYAYm16vYz320SPTg526JypwrBnGgxXr3R+4cSXOdlES0YimSjDph4LMw2MLS/ykSPGXpr03e5jtBVSW0xAXpp9UWROyJHg2dtuiOXGPv6Kmq/nFTZD96pzwcLYuuWrJQ8XfW3hQgZr/y9qd+n6z+jh1pf25mwevKkUtFCeZTzrXjLMG1NnUgCIiZQdjF9Evf8RYyi/GVxVVqHw/2V5l1QzehUGyWC6Gq9OX24dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QD+KsBoE89wYiqxRaEzRInzuYTIguSMEljgzGRZ62bs=;
 b=SaBzx+pRZdJpF5lPHAOBYP3Q8eRHEFJWPK0mC/Jk6TB/+M1+1QhDf01uvgkmCR7cyVhdxLndGrlZ9uBY/EvTJcR0DenIiU19ki8HMl1LL76XuqwpEauMUzzw97UoPnaFpKradzn+CNi70MeVvA1BHk9aN+bDm3saArLANo4eWkc=
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 (2603:10b6:910:45::21) by CY4PR10MB1398.namprd10.prod.outlook.com
 (2603:10b6:903:30::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 18:39:36 +0000
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::a4b0:cd03:3459:6853]) by CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::a4b0:cd03:3459:6853%2]) with mapi id 15.20.3499.027; Fri, 30 Oct 2020
 18:39:36 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: Use status register where possible
Thread-Topic: [PATCH] mtd: cfi_cmdset_0002: Use status register where possible
Thread-Index: AQHWqIpTWSfEXw2OaEiocc+ivq8o4KmweGwAgAAOhQA=
Date: Fri, 30 Oct 2020 18:39:35 +0000
Message-ID: <aefef0187e5ebbe315e57e834ff1ba756ba88817.camel@infinera.com>
References: <20201022154506.17639-1-joakim.tjernlund@infinera.com>
 <20201030184736.4ec434f5@xps13>
In-Reply-To: <20201030184736.4ec434f5@xps13>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.1 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 415e5e83-554a-43d2-36db-08d87d0326b2
x-ms-traffictypediagnostic: CY4PR10MB1398:
x-microsoft-antispam-prvs: <CY4PR10MB1398CF5A796790AF19AF8F4AF4150@CY4PR10MB1398.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0ENB6h4Baehfo35Dj0v0BAhkFxiYdQiDPyfbppHpVL9mnY5xjOOf02bTBT1rURgjVit0Xh6lCVjmD/a+FFmC9ntk6gABfamxdTM3y0cpWQdDJSdh7J/N3dHbmWy0pLEwfMG/zCRgpd9GO5ND2qjkhSBfa638wc/EFOglOz8SDUL3vRV//uVmfVBQARFLyhKpMar9HGAonOjugSHxJPBRckf3nnfMljuq1uGjSPiUP5UQJIsEf2qzz3M0tatb0fo0Vsya0FH54Tdr6nCYzDXrRfAfoJusHV1orlnFgLYAGUALqf1a6hxwiEJv78ucAaS9lenN56XJWe2ALsSdE1aiWg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1001MB2389.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(5660300002)(4744005)(54906003)(478600001)(71200400001)(66476007)(6486002)(66556008)(64756008)(316002)(66946007)(66446008)(91956017)(76116006)(2616005)(4001150100001)(186003)(6512007)(8936002)(2906002)(36756003)(8676002)(6916009)(26005)(86362001)(4326008)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: zH50pg0dS1wKwdWhf9PyDOabYzZfCasin82WkLndsSNUrJlJ7CO5VyWCmrJMfFVM4TY4D1nCDT5+6iP+6QaQuFZbntw6zSrg+XqRXtEvlGskm2GPaNAar7sx2Hk5rSyLanaK/vJUH2GVlizwKSW3sKKoy5IW3/QV7LghZeA+hZCOTzLRv95+4Pkry4mfzXNaVUlcSPOxsjQJI3BimdFe40w4RBS2B2PkoMR75eKQ8WNtveNUkg89Hfizeiw4fV37tJ2iinE63tRq5gHQcravjFTJjKvyjHlq1ncpw2sEw9ueTcK2LBVyAXvsBbzlF34VEGrlNf3dK0GBiIBYLNSCcUpoxENDShVgavX3yFS+dIaIUspP2m9PokaxHAK8SgoagN5i7NknLXVhK50SMYATgzqjLJnEfpQsMxw+1mtrl28Z4uFEWi4UESNw+ILvpo3X5ZkXyp1jJ6AsEIMA8CeQDAfmOItj7RyGJbpudegJJ2WM+YBuU6w27hbffvET8nmfW8k0A+GZH3NNH/5VVRl+ozOQsn4VhblqCGDwwnVYJw6r7DkzKtn/ccuecHg6AkC/h8wliFmpf2ewqqDupBTNhSug0Luj8qvA27m7fzba4+h5eC8KEiFLYOtM2/DkNvqHOPPT9clsv53mfQ+0uvRKnQ==
x-ms-exchange-transport-forked: True
Content-ID: <158E47E8AAC0444885D1EB4BCB9D5B6C@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2389.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 415e5e83-554a-43d2-36db-08d87d0326b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 18:39:35.8623 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lLHGeuLckQfNQlv5AHH2ZLj72uGWFTbeViq90Jm3qX7/5xWf67e3mbtaTQjqMyKH3N57cWqz/KfDeJslr2cBFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1398
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_143940_530643_96780D09 
X-CRM114-Status: GOOD (  16.37  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2020-10-30 at 18:47 +0100, Miquel Raynal wrote:
> 
> Hi Joakim,

Hi Miquel

> 
> Please Cc the MTD maintainers, not only the list (get_maintainers.pl).

I figure all maintainers are on the list ?

> 
> Joakim Tjernlund <joakim.tjernlund@infinera.com> wrote on Thu, 22 Oct
> 2020 17:45:06 +0200:
> 
> > Commit "mtd: cfi_cmdset_0002: Add support for polling status register"
> > added support for polling the status rather than using DQ polling.
> > However, status register is used only when DQ polling is missing.
> > Lets use status register when available as it is superior to DQ polling.
> > 
> 
> I will let vignesh comment about the content (looks fine by me) but you will
> need a Fixes tag here.

This is not a Fixes situation, no bug just a hw enabling thing.
Also, I would like to see the Status patches be backported to 4.19 as well.

 Jocke
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
