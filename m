Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF822C43334
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Jul 2022 16:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aK5Q78fzefMYsqaO/JmV0QXPZc7UjNVv1gCytk//zhw=; b=FVTeZLVN0EOF0T
	lN7+/YGO2vjBpdtx+w8l8fWXlH5VJplJSnFes2nRCe56TMcltrW+T2CsfIbTAm/YQ136xAdBq1C61
	xTJajoj8h1UTgkRXR44RdAkQiRXk9Jx7J4oW9CF2waQvib7qOQhdVhZHgOOfPWKN7CrbWcQTYP339
	2Mv0BYm6daU1HoGhIvsGS4cr3B7x2NQv7OBqTS8+7/YH5Vjwtv9H9xmBeErRqosdZbEbx5kiJwgGx
	ZRO18hSjzqSSzJNQlJXMBZZWYOVsLLlg7bs01QEdriwguqyE5npdhuNh6WWcXjEDoRON9ECbYPFdO
	UZhxVxgrapXUuia0XXsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDTup-00GqRe-NS; Mon, 18 Jul 2022 16:48:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDTul-00GqKk-HV
	for linux-mtd@lists.infradead.org; Mon, 18 Jul 2022 16:48:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658162891; x=1689698891;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=WdzSL8c46RrurflsGdD+KapLFzAuFxZKVZlM0ZTV6Yw=;
  b=p3IL+gJh1d97WFTG6xEKD9u7CcNInA2AnQqfgNP/QywNrx3/2x81fLoN
   7XAaNbNhhtx4gSqDN7CJxuv6MFdE14Lo/YB2w8E2EmL2bw49h5pVY3GAK
   s9Y5sTyOFqhMuaba2yNEIPMA8Cno8YdzO7b41xGx9JrLuE7nuynXLhwq4
   8nZ3nHR9rE4yb0i+5/VwfM695RV+mS7C69uxGjHg0MgVbucYn45Tx9TN1
   ibBdeZoD3NJqPDZykbYN8qd/cMuaxRr7CmrU0dRwl96wP0IE2AGLtJJGU
   9nfqUWNaATYUrPzKmBYMMAkGvZfrfKp72yM+ZEYNr+D0FKWEdmrzt33qT
   w==;
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; 
   d="scan'208";a="104977177"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Jul 2022 09:47:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 18 Jul 2022 09:47:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 18 Jul 2022 09:47:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gauT004166aYj0QpaUeSDklwi/m+B1dS07y0wEDqtjJ3aKz8S62DsqRjiK2IO+VcpWWwebpX+0j8jhoaRp7uBRQFUd+5GMlw89GhUweR8cLazgimNzW/Vz3GYLrLNYotLCDL9h20WX05wG9TaDlVmM/BY5zQUHd/TYN32uLyVHhddpRzqNK6X9PujZyy56x6dXyBB6wWhBuUD1seJ4bRHzxEhyggjnAg1cdM5kgj4HkSQcDZazuB5hTugToheZGBijwTQNwDVUMwBqgGJ6d1/Jb1aFuVPlSAbH//7vcHEteUWrXtugnzNNcOgHscoJs8l2jkeGfHM9kWKP01XM4mOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdzSL8c46RrurflsGdD+KapLFzAuFxZKVZlM0ZTV6Yw=;
 b=Dt/vH8oYf2hMUrPb9EjkVKYVsKPz8zHrUxQhjvkFiBWkWKiBIlDF2M8c8Db6KhnzEx60Pkpw8jluhecwIiWLIfLBNq4ghb8gtbxSGGyDMXaRJ5AuKgpqpl0Axg4QsqL0UODRI4HWUD43iIXVB0bHLWi3LrB4Pcn0FNviTnV02SS1l+sIQpOvzGXeuQHQMkYvmbu3MsIX5AKgH4Znxa7tqbAtgB+FuAy1TtZ7BVwOjFv/hCsRk7oKL8AjcNLD4DTS+vs7sZM6Uov800xaVSnPMjTLdkOFd9rzdmpP3qeqLHaqebFyN4yZxkZPjmf92CzP5TzfFl8jwDODfgnvCr2veQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdzSL8c46RrurflsGdD+KapLFzAuFxZKVZlM0ZTV6Yw=;
 b=CrSeU/ZU6AvIC4DxurRThIJxR0G0lIOkhOOoWKp4RP9sWFzHadP/Ouq4vEPADKpwYaSdL/I3gJNjU1yC6iZTn9D0/pyI2AG2Ha1TOMmXfJqtvyTu+gI2GwSLNkbEMlp3HSge1i1dt9y+Rbfd+fV8ehbKAn7k0JGZgFjUPc7o5Tc=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 CY4PR11MB1784.namprd11.prod.outlook.com (2603:10b6:903:126::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17; Mon, 18 Jul
 2022 16:47:35 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4%5]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 16:47:34 +0000
From: <Tudor.Ambarus@microchip.com>
To: <patrice.chotard@foss.st.com>, <p.yadav@ti.com>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>, <inux-kernel@vger.kernel.org>
CC: <christophe.kerello@foss.st.com>
Subject: Re: mtd: spi-nor: fix spi_nor_spimem_setup_op() call in
 spi_nor_erase_{sector,chip}()
Thread-Topic: mtd: spi-nor: fix spi_nor_spimem_setup_op() call in
 spi_nor_erase_{sector,chip}()
Thread-Index: AQHYmsYUGnLX55wXPUaCxJnAw9nzBQ==
Date: Mon, 18 Jul 2022 16:47:34 +0000
Message-ID: <edaef851-f049-ac4c-6fd5-c2cdce08f170@microchip.com>
References: <20220629133013.3382393-1-patrice.chotard@foss.st.com>
In-Reply-To: <20220629133013.3382393-1-patrice.chotard@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1bc72dfc-54e2-4c18-682a-08da68dd3722
x-ms-traffictypediagnostic: CY4PR11MB1784:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zHSrtCm6yRPrJ01qn/atARVyhIcH/PM3jg6FzpbDHj79qUdDWaGujySLX8dvVBvr1sQ0+dcdrLvzCjJNsPpfXaDuXsWgb35ljwFgR78e/KRErnbW9yHsnnAEWLd2qu70jbPjkKoicNX1KidNgJU5J2/+7EI8D45l7sQVmdPJZVmOUVxSTFcrTsSWCQmkEamOxOjXNoTAgvUaP0GAD1/5K4GhDVPPxuHG4KRB3xAZ2opnJ6kgzoWhZkhFt+Ye/NUMpB2IfFnwZJSUegCI7MKvKmbLyUcBKc9n4D2Pg8AuNeI+AcPGi1M/Iv3FHL2mOn4EOPWZvdszbYEG8EHTpeEItwG8Vd/IghnNhKj8u9wJwNoAqRgBAEnHprAuJ0sFl7Nx3wgF0VVecwmxyTjYCdzE5O2LfyZ1SVFfntBRzq2mczbrVS782Znpxrew0lqQuH9QWR2ffhvC46m6Thsmprg6bIXApgzF3lLNsrkXYQKxerWv0hI/NnV8mnJAKyQDu+O6hNlp4dlekeG8WTMONElRwoGSM73rjdH80Dlrh9OQm2Wn3VgEiljgkBc1vDRg+ZpUfjdT4g90lOwo6MXg0w1pQS4X170HMsW8ZhGCThYlMbWO9d9txxts+pDn6/rlv1DiuFtdlg503TkHJKvyDDJ9lFoSLszjQ7G1CFyV/zOGw63OqvJj6v3ITCm9UMqMU1KVGfGCj4H+AO4ImRYfMwBZ7diBuOkVdqugxpEicMENvRGVZrjnlErENQt4TaosXYaegPJfyQW1qE0gyemFWXZm0QrT6O86GjfPZ+K/99vE3QtEKiw4s9BaM5YECHjsW9c4c6pWhSYc+dUMFs4brMG7rUe8K1CCYI/rFV5o/26qwcSBavP/BNuB52d3U7A41rQL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(376002)(136003)(396003)(346002)(110136005)(2906002)(478600001)(316002)(41300700001)(83380400001)(76116006)(66556008)(71200400001)(66446008)(66476007)(64756008)(6486002)(26005)(86362001)(2616005)(31696002)(6512007)(38070700005)(91956017)(66946007)(53546011)(186003)(36756003)(38100700002)(31686004)(6506007)(122000001)(5660300002)(8936002)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YzgyZVYwanZEZzF5Q1VIajY4aUczMlB4Q1oyMHZ6amwxaHluWTBRdVNDVW9o?=
 =?utf-8?B?VmlUUEJGYXpudUNJZDQwVkVmdmdvY3d6NkszS0w3L2E1akpITXA4cml2V0xl?=
 =?utf-8?B?VDNnRmoyd2g3ekVMS3hLUkl3YmVSNU13WXZFc3Z4M3dwVlJRSVdVdGhvaGZ0?=
 =?utf-8?B?VkpJRks0Z3Y4UlY0eGxpeThqUmQ1NkZMbEJNMjBIenRSbndKWkVPSGZCZEdt?=
 =?utf-8?B?dmhFS2dkOHZ6QVFLVG5WS2VDSXRIclBKdnNBL1Q3WTdET2ZrUU9nY2srdmor?=
 =?utf-8?B?RGdURnJjbXE5aTA4Sk1BdE9IY0IrWUNVa05uOGpsdzUwWlNtN3BiMkZkeHc4?=
 =?utf-8?B?ci9hWFBmUnFMSnh0MnRET0RCcmdOdmFIUzYreTd4RUxtOFZkZWF6OGhDaXNG?=
 =?utf-8?B?aTVQcTJWRTUxYmlyOG1wZ2VrMWp3djJPRmc1N2hMdGlobTU1dkMxYTFFcDNz?=
 =?utf-8?B?TWE5Y2ZoNlFLQlhGL0d3WURiSjArRmFNVmI0NUUzdW9oYStMeW0yd282ZFIw?=
 =?utf-8?B?TkF1RVNkQ1NaTDU2MHNOYjgwZG9mVm8xVzlRbG5FZnNRL3BSK011bnhhaENl?=
 =?utf-8?B?ci82UWR5S3ZKdTRtOHBuTGY0T0t6MUE3dndKY01tTWhyMjg5K1dHUjNyWjFK?=
 =?utf-8?B?STlWMkFkbWxvcVZVRG9NbFRsUzVXQlZ0N05xSzNVWEduMGFyS0NFY1Y4Q2ZP?=
 =?utf-8?B?MG9IcnFzOUVmMUFBRFhxblVCNFNNYjAyRDJxZEF0bmRZQnhoMWl2eFdEN3BT?=
 =?utf-8?B?MmdWY3Z4cFowR2xTUnlVcHNaU0RHbkx2WFRhL2pYYkZZZG5GSENBd3dqODdk?=
 =?utf-8?B?VEtNSU5sLzFtaks3UGFIa1VKR21YSThlWFlMd3ZubW1LTVdSbnY0dkRZVWZa?=
 =?utf-8?B?RnNYckF1Q2JpRzQ1NFNWTzRkRnBnb2lzOEhxUlJSZ1MwYmVwT2hQNnVSTk9i?=
 =?utf-8?B?MWFhWGxFZUErOTlwNjM1eC9IU21nbzVOQ1NzaTUySnVMclhtcm1YWHptRmlS?=
 =?utf-8?B?N29Yb3YxSmdad1BDcXFCV0hJc0lLbm5wR0tDZFJOcFA4SlNSVHN5dHZmVXVU?=
 =?utf-8?B?VVIzNWZReFdnV2lQZC9ONE9KcVNNZmJqeTlrV1pyd0ZiRmsvYWorWGFzVm9t?=
 =?utf-8?B?b3J3Um1MNnlLVXFEMXpwK0pVb2E3bVF6QUlMQ1lCZDdVY3NOZ0RBMnYvcnpy?=
 =?utf-8?B?WHRhVFFVM3ZlTUdldG5DamZDWlU2WkN5K1dteG1kZGV3dlJIaFVKK2h2Qk05?=
 =?utf-8?B?RTZjbUdjbnc0L2cvalN5cGtDTHlMV29HM2ZyZ1ZxODMwU2NIOXVZU3YxNGt4?=
 =?utf-8?B?UkgyWFV0QnZ6amFEcVJ6NEkwc2VsZzN1NU9yS1liZUpXR3Juc2h1WTNRL0Rm?=
 =?utf-8?B?VmxkbnZUS2hPWktJT1ZVRHFkTkRpWEFiRy9wT1JteVdrMmlIbk1TQlJiMkxn?=
 =?utf-8?B?d2xQNkkrMElXNmRtNWk4Y2p0ZUhLWm5mNks2UzRmWlZYOWJKMjFiNTIzVjZK?=
 =?utf-8?B?WU5EcmQwVVorV0RwVmxKMHdQOGplTTl3ckdyc0JjaDdsU1UveTloTFRyaGVt?=
 =?utf-8?B?Y29CZUttQzdPMVlCZmtqc2ZGRGQ5d1kvdjR4NXJ3UWc5RmpaQ09DQWVZMklI?=
 =?utf-8?B?T28vUjB6RGF4cDJMZkVxTHdGb05wOS9FbWFZV293anI0TG90WC9BV1Vpb0RH?=
 =?utf-8?B?ZjdZTFhHZGdLa0NDR05EM2l6Mld4NGJRM0tocnFtTXl3d2NncmlXNjR5ano1?=
 =?utf-8?B?V3lrR1N3TURWeEdxZmV6WGZnaUMzRmZTY29qMEpRa1UwODJyOHdtWldMdkhZ?=
 =?utf-8?B?U3EzNHdLbk9Uc016L2R0azZORUNreXY3R0JjS0RCL0I4Ni9XVGpLd0hmcGt2?=
 =?utf-8?B?aHNFSHg5U0I5RWNBNWpVRG9YYmQ3dGpUNnFjSHB6Q0d3ZnQwekhpR2JGL0ZW?=
 =?utf-8?B?dDZ0cEtFbFhLUU9CaEFNYWc3cmxmYnRuUktCTjQ0Ty8zLzMydTB5SzZOWlJ5?=
 =?utf-8?B?Z25kWHV5djlPbEczMXRROWhFSG4rNDdDMnFSSUE1bkFaR1VNNW1BS04ya2hs?=
 =?utf-8?B?U3FKUDlwVGh5aWdPcFhUdnhKbWphNm84OTBqY0FyTGJYQ3hsZ0NmekRUOFRY?=
 =?utf-8?B?N2ZNNUZaZTFXS0k3aXRKOUllM3V3UTNhOGNOZVVNQ28rTjRIdFh0QUVOdjVR?=
 =?utf-8?B?cHc9PQ==?=
Content-ID: <F91FFBD01EDBF448BB93CF127C0E6034@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc72dfc-54e2-4c18-682a-08da68dd3722
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 16:47:34.8096
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I/sBaN9qJtGG2CbtMKWY0SRsDsbM0Eub5YQ+IdNNZeCmlOQBo9kTzUtU6nDbQXLBhwYvFRWdS85nuuAisIGJZBrq5Ioa9uquLbdEFLFdjjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1784
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_094811_890956_F4ABCABC 
X-CRM114-Status: GOOD (  22.67  )
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

On 6/29/22 16:30, patrice.chotard@foss.st.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> For erase operations, reg_proto must be used as indicated in
> struct spi_nor description in spi-nor.h.
> 
> This issue was found when DT property spi-tx-bus-width is set to 4.
> In this case the spi_mem_op->addr.buswidth is set to 4 for erase command
> which is not correct.
> 
> Tested on stm32mp157c-ev1 board with mx66l51235f spi-nor.
> 
> Fixes: 0e30f47232ab ("mtd: spi-nor: add support for DTR protocol")
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  drivers/mtd/spi-nor/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 502967c76c5f..61027330848f 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -972,7 +972,7 @@ static int spi_nor_erase_chip(struct spi_nor *nor)
>         if (nor->spimem) {
>                 struct spi_mem_op op = SPI_NOR_CHIP_ERASE_OP;
> 
> -               spi_nor_spimem_setup_op(nor, &op, nor->write_proto);
> +               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
> @@ -1115,7 +1115,7 @@ int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
>                         SPI_NOR_SECTOR_ERASE_OP(nor->erase_opcode,
>                                                 nor->addr_width, addr);
> 
> -               spi_nor_spimem_setup_op(nor, &op, nor->write_proto);
> +               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> 
>                 return spi_mem_exec_op(nor->spimem, &op);
>         } else if (nor->controller_ops->erase) {
> --
> 2.25.1
> 

should you also update the following?

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ce5d69317d46..23487e9a9282 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -177,7 +177,7 @@ int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
 
 static int spi_nor_controller_ops_erase(struct spi_nor *nor, loff_t offs)
 {
-       if (spi_nor_protocol_is_dtr(nor->write_proto))
+       if (spi_nor_protocol_is_dtr(nor->reg_proto))
                return -EOPNOTSUPP;
 
        return nor->controller_ops->erase(nor, offs);
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
