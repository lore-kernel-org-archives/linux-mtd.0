Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B985BC43334
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jul 2022 14:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DT5TM24r5EVbbMidVsV2gjf4puenPJCsmQ1ze4L4JCE=; b=PpJUKy0KrabiyE
	w3f2tWCHEbMpwnXDMm4zSUVEHnRLx9MeCG/LZmbZcBOYWBAF4/i10RinXTTGVve60cLKuUdROSU+6
	6Hzpoyia8o+n3XFyeeLrgH8DsSQJMZg/fb7sXQ1Kxx6IOsc+PemeXs8zJjGFM/jJIbbQmB1svCJz9
	rsZA6UCDGmp/DnIN1OdZfAOw3KhlWFL0oyA9TeBe61NXunUo0GqRaA3R8aDfl79zs30zGLJnFSZhs
	KujeZBcifgEOzUttpPZC+bHak5uZPm27LuNugA9wYQ4fAg0ig4iK2G/+sr7EU1t0GtyFq3JF5bv6e
	hMwhR3WzqKm5SgIgjTOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXFN-0082w7-9P; Thu, 21 Jul 2022 14:33:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXFJ-0082rc-Bn
	for linux-mtd@lists.infradead.org; Thu, 21 Jul 2022 14:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658414026; x=1689950026;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=57g0o8mJrNZ+OPPqe1H77iP42+VuH6k3fuc6oD0nhpM=;
  b=lLzPjZLFtruNSPpVFpFGaNUIrySvg6ir44zGSQrcdrnMWmBAsHeMcLy+
   Cy/yJbNyR9pfp5hsa3m6PkHC9mForm8HrsSFoB+xyH3SrnVwqjS40x4sd
   7NjJI+wZY2dL96d57ugAW+dxUhozDNSsQN9V9qbxDrvRhpOn1xop/EXRf
   eB2dZ8L3uN6RFJ/Vw3iIa8BsVX7BXSc27dJ2NcqracGbfjdG7AYpfnRD8
   rsPCNcLjJZfkk25zAbsBAiwKOvgiLua2GaBlSgdkhWwPSy0tu86nrsrMo
   KWjsPvzx2h7PO2YfUmCMdpKhwJmudjRYQEGZThN5heAHvgg859uotnI0n
   A==;
X-IronPort-AV: E=Sophos;i="5.93,289,1654585200"; 
   d="scan'208";a="165813206"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Jul 2022 07:33:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Jul 2022 07:33:38 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 21 Jul 2022 07:33:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QlVwSGYxfXnvpVFNGJjCTaGzrbOHwjYUjz0WR09q9yn4ezIHedyIawGTZeR5bsnS9UUrxeeUmGkJ3zcdojpIK8f2PD9To2BFqZhp6s9eyfocYjEgoD3acP6P9hG5jIQ5EUE46qTp9ozrVmfEbRvnuh2sLfstFrUX5gW3Q+yKXPRGaQcipveoL6WWPLwJfS+Qm7s2WWGBZcTScx4J3wEOxWy8tg+TvjVnEpwcjF6cxsFwPxFaSq1sSOpCk7mzAQQ4fX05c7glULy56hxPT8vnRAQtuvv3QXn8UHmSA1w7KTojF5GL2FZRlGvvgdiGXePspFdg7kujo4nTYNojXCFSyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57g0o8mJrNZ+OPPqe1H77iP42+VuH6k3fuc6oD0nhpM=;
 b=hOlpCCkLQqPwDqFaYYc1rcuZ1tmYPblkoTtqUgarFuPLBDpkwT4hi9xpipsf4m7OPbB2qjs9I0zm2ICH1avsY1Mo66vThrQ9zVKv4auqWdu4DnvKD3G/dQJK7JZGVbNcTVbxlrVOUCLvZI/NgxwFdAuLycoyoCEv396hjoWXt5fngvcZeP7GTOemLCCuLc1E07YgvXIjTZiOivlpwW7mXKREfPm4njOjjeLXgHTeNWEveNZ0v3f5JLLh7IkNydUmzQcmN5brePokZ+ol05Yd2m+HoOJ4MZCsA8IXyJpqW3qPEcB+dIFJpdCWhHz/fdb5kniplBQW1Dlhz0LAux344Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57g0o8mJrNZ+OPPqe1H77iP42+VuH6k3fuc6oD0nhpM=;
 b=AhV1wGrFZc+RVl9b9MSCVel0ETPITnlMKTErZ2pTJntV7O9TAseFuat1M8SZTH+d9R+050hWjE4rY7kaygpZxMnMUfklwY+cYz9r1T9ntXFfsQZ5JP8m4sP5i5zla4urtXCOD7NSVj4MDDXbBjdyhPcCjKN7hKPEbVvPsGPgHTM=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.19; Thu, 21 Jul 2022 14:32:36 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4%6]) with mapi id 15.20.5458.019; Thu, 21 Jul 2022
 14:32:36 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <tkuw584924@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <michael@walle.cc>,
	<Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v15 4/8] mtd: spi-nor: Do not change nor->addr_nbytes at
 SFDP parsing time
Thread-Topic: [PATCH v15 4/8] mtd: spi-nor: Do not change nor->addr_nbytes at
 SFDP parsing time
Thread-Index: AQHYnQ63gJwopk3ciUahhybJr+4c6A==
Date: Thu, 21 Jul 2022 14:32:36 +0000
Message-ID: <70133c7b-6436-62ae-cb49-bc1596ab26da@microchip.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
 <ccff78b42bab8d6eb0ffa2127f4fe6c4daddf6af.1652063152.git.Takahiro.Kuwano@infineon.com>
 <20220531113056.elquk3pup5lsrz4o@ti.com>
In-Reply-To: <20220531113056.elquk3pup5lsrz4o@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d092c69f-51e6-4ade-fe2b-08da6b25db95
x-ms-traffictypediagnostic: BN9PR11MB5530:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R615v04AdphQlbA/BwDEaXpMGY0jiT98R4JRZdGHlj5tOTlEUbN+OdElevyDS5ftAzXzBnZqnr4OalLfpg3ZTtUx2nAq1RY1OOa9ZfVi2q6uxbV94wkHIyoRzFROmst6k7YvgjJJkPbRLMfytqE5odcW/dcX5yM0XvSSIZa+hNsa4NTR1iEgkcQZwudevB9ZC2oSdKjo1WjjiMUh7oTWtbkp5EcO/uRb5tPBAu+pGnUD+rcXPCRbL9mYlVjGBRh5ZYKq79nbpHExUm8sUkG+F3xSo8LHLPo1gGwcGeuf24XIuY+vD3GDa8CLuagCcVjOSXfMeNls0qN5y2Rwtq4CDYcawSkpd05wuGt0CK8IC3J/ihy27lAVWEjGWdmgQW5aB9V4ypDZ/iCB9Vihrzq2p2MjXQcF4MZ/fsLh/CU+u5tiAy6iDstYorxewh5PfWrGdTLGgOZ9HMs90Ziguxkfhks7dXuyPyJrEq79RM1k4WdqZb56ZqUVB/17t7i+Zh220/5PLxLQB9RpraYBC70b0i6cw6+UBS+Lnu472Haw0tGqIzEUEXYvMZ8CIbxGaHi814BOhHr7rA68YaypnYH6GGTAhoEBWd0MI5FZv755UEWHHprCeuSLwZGKKs4DTfWF1RxealvbbiFIaXbMHYJ8PJ74RnvdsArZcgISX/3cDlwoJovtQrU7yE6q7Bg6/D3WYcjuMysfYF0S8jefIcvCORe2k4gKfSQhCDwHLzKTKIqokDsAaKwyjqUyzUzUVCn+WMUMUhCGN2CtKJK7zyjdutkfxQ1J7NTjWbJlLidE6+7ANa+VUXu7BKL8K99nXNTsI7aHXfMz+Je6G9JTPBm8UcbMJep57VwRPIHZzYQR0qVvUJUWrZk5FEhA8usrcI/T
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(376002)(136003)(39860400002)(396003)(41300700001)(316002)(6506007)(54906003)(53546011)(478600001)(6486002)(110136005)(71200400001)(2906002)(66946007)(91956017)(76116006)(66556008)(66476007)(4326008)(66446008)(8676002)(64756008)(5660300002)(8936002)(83380400001)(31686004)(122000001)(558084003)(26005)(38100700002)(36756003)(6512007)(38070700005)(2616005)(31696002)(186003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXBicmlvRTdobVZvSHMvSEhONTJ0VmdzOGcwbUJSdjQrMXlncEp0OC8zZVBa?=
 =?utf-8?B?d2o1dmFaeGlVWjg4THRUYUdJd0lhTnBCZjVrUlhZcXhCeDl5YVk0YXJZTFlF?=
 =?utf-8?B?RS94bFFsVmlVeDhXTmRWZ2FQUENhUnZvMXdndFBwc1Y3cy95aUdHa3h5M2FT?=
 =?utf-8?B?R3dFeHNWTXBLOWNObUtXQmQ1Y0NXTmh0RHIzWFlTQ0xnRGx0NldvOGlXTENI?=
 =?utf-8?B?NlZ6SUw5N1VSMDlqWmNNdS9XOHBoNXVjTElacnNQcFovNWRSQ0VvekxIbEp0?=
 =?utf-8?B?QXNEcFFFNGVhdlQyM2Nxc1Yyb09Zd0dxZkpzTXI4WnFETUhvQzFYbXdWY2VU?=
 =?utf-8?B?OVBJM1FodW1WVmZVenNjay83d0RxcXhoVE1sbWtpa1hrWDJPUEJ3Q0V6eFAw?=
 =?utf-8?B?Y2d3dGZLN3FwY2UvSXlFQklCc3QwNm85SEJKL3BjRzFjTFNaVkpFcGJZSXNY?=
 =?utf-8?B?cSt4NFM3WkR3dUJ2ZmRMcEtmbmZFVW0yYTlLUThFdWI2M0pzenVBcjE0VWxo?=
 =?utf-8?B?VUpPakF0TUh3dElRVE1hU1JsN2N4VlNhQm9VZTY1Z1JsRVRya2pMbVZMSXMr?=
 =?utf-8?B?MldZODJKeHJLTE9aanRKYjBsNjFrUjA1Z2UzanRpS3NDZmRaUnoySDZFbXpx?=
 =?utf-8?B?NDlDUGJiU2RxY096dUtnN1F5Qjc5WklRN0ZualJQOC80eHpTNmM1SUE0d2xE?=
 =?utf-8?B?Um02ci9heVNBWWVpU1RCM1dCWktOZFd3UCtheU9BWWdFL25hTkxhS0FKZGI0?=
 =?utf-8?B?QUNLRHJ4dG9TM2FiTzdoNkJrNW9RL3o4S1RWamsvamJUcis1bWxvSXRPWXFl?=
 =?utf-8?B?bnhWeXExU05hMkllUTZhZ29GbUZ6aHFpYnE0ZHNLMkVJT3MvQ2lxcVdZUnVO?=
 =?utf-8?B?aFNYYnlTelV4VzExRjZHUmw0RWtDZm5MdmVaaXpEWkN0b0ZCWFNmSXA5NTRk?=
 =?utf-8?B?OVpWRGJmWWJ1ZVVIMW1OTUxDRVg3NDNXanF2TEZEeHZBM1ZOdXhjQmJ2b3c0?=
 =?utf-8?B?MUgrOGs1KzFxWlhKMjMvcHpqQXEvbXFUUE9CYTlLd1JYUVJCd0wzRnJCaUdv?=
 =?utf-8?B?TkhvaldlK1R6V3FkVnpOVlREMThVeGpzOGcxYmp5TjhIaFIxR3ZSTE9tdXli?=
 =?utf-8?B?WmN2NVZwTG54aXlPNnBjN09xUmIvQVRXbng3SFVIUS9OSHdWV0JuU1lwa0ts?=
 =?utf-8?B?VmNDYXBJVUtHcm5LUWpQZkFSRzVYZnV4dERQVEZucXpXRVN1N3BhaVFJZTdW?=
 =?utf-8?B?TmJsMmtyNll2MWhUeUJkMWRkTk9oT2MzRzUya2ZpR1ZHL053MUdHYkl5akFC?=
 =?utf-8?B?bkcyd0Z3elRUMkJnUUZMWTBPYXFtRS9kNnAvSTlBd1RseVkvREdiSVdHek9I?=
 =?utf-8?B?eGdKNEZCZEpyVVJIWVY4dkR1T1k3RGNZSXMyc0lCbzRycmJNZ1lCTUJ0Zlpo?=
 =?utf-8?B?QzlJdFA4WjNDTHFyVmVPbyt4aTlISG51aGpPVkxyaFd4TFlVaDBUOEhMQ005?=
 =?utf-8?B?VklsZnlwVW9jQ0Q4MUJYTEVuVUEyUUcwdUJObHBUZkw1bXRMN1dJOHdnaHVt?=
 =?utf-8?B?YzdPN1J5R3NUYXZTSzQrRC9FaUNVYnJGbWhmQmN2WDVkUDRqOVZGblhHL3lN?=
 =?utf-8?B?WVpYTi9lOEdKOVRNbnlVd3ozNjNBdHZyK0FhMjBlOEdnY3BCdUlLcDRYRHBh?=
 =?utf-8?B?aUlaZ0hzYXRRZllQdldsQmpJcks5WFg2QjVnU2dVY2dRTHRqNCtHY05UaFhm?=
 =?utf-8?B?M2x4bHkwWFRoYy9HZnF5U2UzU0ZaYk4rWVZFcHpEZE5lenE3MTJxS1lSbkdy?=
 =?utf-8?B?cjEwZWhkUDBDZGVqR0VUeUZVaFJ5cVdteDNLb3J2eFpYQlVVQURuK25SMTRp?=
 =?utf-8?B?R2tGQVNYbng1Ym9hbVhPRVIvKzVZSitWVDJzZzFXRloya3M5V2NlbnpMTE5T?=
 =?utf-8?B?Q09jeGxwTEt1cmZxMVZTODJNa0J3VFphMzcrRTNOa0s2ZHorTkR6WlhKOTds?=
 =?utf-8?B?dmowTiszbkwzRmkrZG95Q0hIN2I2TC9LNUNRUWNXSVJ2YitRc05UcXU5cUFn?=
 =?utf-8?B?RVFzZGhXZDEwL09DODBZdUVOMDJsTnFjbXFIQXF3RUxqTTI4SUxVV0tnUUxI?=
 =?utf-8?B?eG1FeTViKytDc1VwQ2sxclc1QWdkNUgreGxueE1qTTZPRE85MjhGTmo4RW5Z?=
 =?utf-8?B?cGc9PQ==?=
Content-ID: <985A1E4549DC744B85994D739FE00F01@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d092c69f-51e6-4ade-fe2b-08da6b25db95
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 14:32:36.7880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l8tLKqr6GTyIs9vfeoNWxPzBL0nW5FxLwmgdG/DSiTa5vHAEdBJ4jfa72wL9sR7swmt5AT58q6TT4a9A5YI6gzeH/c3fAToAmAq/XPhkoW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5530
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_073345_741799_85FAC560 
X-CRM114-Status: UNSURE (   8.55  )
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

On 5/31/22 14:30, Pratyush Yadav wrote:
> issi.c's is25lp256_post_bfpt_fixups() also sets nor->addr_nbytes. Should
> that be updated to use params->addr_nbytes instead?

Yes, it should, good catch! I've revisited this patch, otherwise
it looks good.
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
