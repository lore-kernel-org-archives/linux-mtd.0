Return-Path: <SRS0=6ot8=AM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 679AAC433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2020 07:38:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3500720722
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2020 07:38:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vkl0qy3D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="mJKQtEH9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="gVhuT+5r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3500720722
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a3KLiUv2a3INPtOD3fbPP1r4mnE4dvO3KfnyWQXpA1g=; b=Vkl0qy3D9ehXPsTAEs4F/qmiR
	qfzkA1T++2ifcbI6eXNdRYEKnwJXuQflhGE8cdsdU2Fd5tHabC2vhxbEYE7Yk9xXOpjHV4H7elVju
	7YMAxmZKJnV6yzzMcwc3ZFNVqa8bhfO5tUwKmw+CxcTlHMC/CG82fMSIac7VEkmsMIcFyombhyZSI
	C3y/wH/jEiJ5vUoTeUsSE1PiPQMEXCx/j3WTMOBUU8hD/vEudkMAST/6ehQpPUADTxjXuEFkLT4pt
	7fVLf3rTdjl/9LUiE0wzYPiZm1znE9P4pvk4qc2vWMn9hn4AyxTwoJAq+hJ4GuYKaMdLUxDyKw2wu
	UxbU6p1dQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqXJ6-0007h0-4Y; Wed, 01 Jul 2020 07:37:24 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqXJ3-0007gB-Ry
 for linux-mtd@lists.infradead.org; Wed, 01 Jul 2020 07:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1593589041; x=1625125041;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+co5u78fuSCmVBvMcSfC1Mu3k+91pMOVPniuF+/Hi10=;
 b=mJKQtEH9VKt+BBU2ZlW4NI9/lCpTizmcOgmpKUhOoQ/q/B8WiF7UUQHq
 cww4MtAmKqZEUHMZdXK83AVwCfJ/uyCXSrulfrP6FMuprQwxJI3EaG4Si
 FFSRK/zQBDP89Ogc6vLlDf8D58FGpAd3/2shQxb2UlBj7YX2DaYr819HE
 EfPEv78C+S4M+2Sff8cIx3OR8CI9gVzMnl9oel11b06jrClKtg5NSNPlh
 2+g17jwu9TsZKkjs4/aW7kmEHagrqYU174pIk1BrrNF0/DullANvCpZVU
 wkFTlin01E8w1nYo0b8z58DZaAC+NPRmCIVoHFOlflZSV1Ur0UTBlcMUh A==;
IronPort-SDR: JOeQ/xdr9GPDqzuWg1qoAPap7p8oV6wNspum5LWux7Flj2tOZJDCfdEv5oXIzTT7r+9z+Jg0y/
 KceOpouTJqabWsA2ylV0sPRxuftWOiLUNZ3HPNMWbuVc2ceNTIRvrVPUSlMuJAEzq9nXuwBhzN
 /wJM5kMGP91uDB278s/Vj2LDqNINep5oTRMHhBv16AnJfXb5rTEh4dclT6rMLcTjEluIQSJfWC
 h35QB3PpPZTRA4BfJN1ieGIlLj++9JpIYi4ZyK15ViEzEycirGkYAqvtohTvZl9tNWKISkSjoq
 +cE=
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; d="scan'208";a="17673016"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Jul 2020 00:37:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 1 Jul 2020 00:36:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Wed, 1 Jul 2020 00:36:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hEGM2KNO4Q26jdqXJe8LoICuSLszNABn7nDD+2jdcguV1vJKKQ9rYThDyCk6wYs2nYFDRYtvOXVLMl9PheBjD14f36qxxF4bxWZWcRKIm4+HIczKIF2fi/ZM23gJbjVWEIG0eImmAZkFC8fhwlcHuX5UDz06RBF2wJXIF062Lf4Vo+WkWGp2hNv37fX514yostlz+s+aDWzJ1vuTz085Liiqwmnisf3KT+NHarvmuoPC7oDuCo4AI4pQu6EKDtffsIG8Cx+EO8XKqw4S4Tr4Ft5mVHeq+wx3DPWCHfAR1UIVXvehQPk5KI/wFxCcgHGoh32VyO4hbFoi/SK1bQCXcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+co5u78fuSCmVBvMcSfC1Mu3k+91pMOVPniuF+/Hi10=;
 b=ODpBKkzqDOuN6L9SZyuG/MAHQXVbnuFQxhE+nZOHJKU5e94jjAMnDVZ1w6gVAZSWBQTqI5m2EuVYZU7PC6XV3TG9raF5vCGhDIauVh8JYqr6fJiQowWHoeeskF+sC52cOsmZY5BYjFF0Z08i2s8r/lfE3Oq2UB9LV1KGneZGDLrR8iunBhuFAm9scx7QU0oL/fRbQHsY0i1fGb91j+kuUxeQOvOky4b1fqrxJUClHrQM77ynKpIE01/+MlqkdnUvlyD/lGB3w2gLRWVXC6HPl3vtXq7hvAvnOFWNm5kqRoZCJRW70CdhH34OrjYatbC2iNd0FOwuR6iaufoLgE0MEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+co5u78fuSCmVBvMcSfC1Mu3k+91pMOVPniuF+/Hi10=;
 b=gVhuT+5rYpO8gS6vTUEGD2G8298VywiZnRNhhiekqLD3mCZVqUEfZISS9DDYVizidpxw7iyRoFqulXAND2P1O/tmAteP7jUeKI+MzT6RbyePvDcPUKVswWfDPmG3ajLYUUL4IofqZwXJ062GTK/dtJg3hNPWgRundyG8pqKw2rM=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BYAPR11MB3846.namprd11.prod.outlook.com (2603:10b6:a03:f5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Wed, 1 Jul
 2020 07:37:12 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3%3]) with mapi id 15.20.3131.027; Wed, 1 Jul 2020
 07:37:12 +0000
From: <Tudor.Ambarus@microchip.com>
To: <microcaicai@gmail.com>, <daniel@makrotopia.org>
Subject: Re: [PATCH] spi-nor: Add support for xt25f32b/xt25f128b
Thread-Topic: [PATCH] spi-nor: Add support for xt25f32b/xt25f128b
Thread-Index: AQHWT3puqHBhJsx+4keqcGkkuFI5Ug==
Date: Wed, 1 Jul 2020 07:37:12 +0000
Message-ID: <f1b4520f-4a51-8348-49a0-9bb358bbbcbe@microchip.com>
References: <CAMgqO2y9MYDj6antOaWLBRKU8vGEwqCB-Y1TkXTSWsmsed+W6A@mail.gmail.com>
In-Reply-To: <CAMgqO2y9MYDj6antOaWLBRKU8vGEwqCB-Y1TkXTSWsmsed+W6A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.127.52.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c7bf3fa-aff6-43c1-9a3e-08d81d9191b8
x-ms-traffictypediagnostic: BYAPR11MB3846:
x-microsoft-antispam-prvs: <BYAPR11MB3846ABDD8E55A41F896F0AD5F06C0@BYAPR11MB3846.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V6PpgM5hzMzoaq7MV8DZUf07ijunTVs5msxSk6kQaqd/XsvmWbhcfIUrvY68be4prfELvYJvkfYsfJWYL3OcfDy96CGauKLVW1yuXW60M05RTItZbnyhwOnohILZOoMRzex8NHFjbN0/6T2N9EmBX2k+xwvCW3ayG9SIewD3+MVM9JghoFBPGum6JO/BgJtlyuvx5iGLRlRGnq07iTPaSQCvdHpV8dsAN+Lm95Q2+YvBhRels7sH+r4OgvwHGXKQzn5bxNh0SdKgoIXMQDMKU/0oWVVlV+LhTKl23eYH5MDb4cFE0u6SxRxGlCL+s7JrgGzQa8DG8wKfAalPxivwR6H0eRTa0HmWly5s0OVy3hpyZkj5OLZ5XYGONL8nucIqrDQNVGvxyb23kg/bQeUHrUuthtsavggZ3gjl8rMgVppITYV6xxtBxNftukrks3G2zBBEy94W5e1GUft8k9asxw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(366004)(376002)(39860400002)(136003)(346002)(4744005)(2616005)(316002)(54906003)(110136005)(186003)(26005)(5660300002)(4326008)(478600001)(8676002)(8936002)(66946007)(91956017)(71200400001)(76116006)(83380400001)(6486002)(86362001)(31696002)(31686004)(66446008)(66476007)(64756008)(66556008)(6512007)(966005)(53546011)(6506007)(36756003)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: UH1dx8yGl+r3ypILYik2WfZkt93I+VQx7oX1zXDyJGaKRNf4O3VQtE6Fv5kNg0+IhabiEgY0WyLyx/G+IEwWQo/JPJU0FhP6XFc24LBqNuTULIsZwQqnEuoXdX1czmyOBzPoOL/A0qRi3ze2/camNqf3H1+py6d2IGkh38JIYg6GpuXdgHBzNjLEiyrWBSoIw9BQyYIgj6uBkD3GfOpJUqNWLtG0IFUA1MPI+OH0ijgTxEB/oig+nb/e/mF2FPSNAutthsIESy5YHcGThbzAvqlMM/QqzCyHozJwULjdFcNG/QUDXItST7NgNp2GGulhUJiOVdPfXoMXsgdwCd0Id+c2pi2lT6BkXkE0N/aLFqN++T1WY6g3po8XmSr/U44N2t8kFh0ShoFm80RYDqiJrvnvrdfw6hpKIJeXc7sfiirya+IUDWU/C0HwAJ8E6Sn8PpRMyF+JH2IGK107PnTv2MINJPC+IB6JmzrYA19BvQc=
x-ms-exchange-transport-forked: True
Content-ID: <BCB2952D9C5A3A4BB94677BD5633ED86@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7bf3fa-aff6-43c1-9a3e-08d81d9191b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 07:37:12.3743 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AAJuTXOm+IEH2F1amMqEBdLBcP0QMZRRppECueaFF1bulbD6hF6NrYW8dNy+A6Kti1nT9FFF7T2aj8Avxkdke8DqwF5DGamg2v9nkEsIJBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3846
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_033722_272692_C77A37A5 
X-CRM114-Status: GOOD (  12.34  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 6/29/20 6:57 PM, microcai wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
>>From 5e308ec7332d01e84a3a5233f4cb8bd5a00026cf Mon Sep 17 00:00:00 2001
> From: microcai <microcaicai@gmail.com>
> Date: Mon, 29 Jun 2020 23:36:40 +0800
> Subject: [PATCH] spi-nor: Add support for xt25f32b/xt25f128b
> 
> The RockPi4b dev board ship with xt25f32b solded. add these ids so the
> board's spi flash can be accessed within linux.

I couldn't find datasheets for neither of these flashes. Can you point
me to them?

Were both the flashes tested?

Daniel tested xt25f128b, maybe you can sync with him for the xt25f128b
flash:  https://patchwork.ozlabs.org/project/linux-mtd/patch/20200206171941.GA2398@makrotopia.org/

> 
> Signed-off-by: microcai <microcaicai@gmail.com>

You need your full name here.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
