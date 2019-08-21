Return-Path: <SRS0=1vkS=WR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0591EC3A59E
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 08:03:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD30022D6D
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 08:03:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uIFIMISt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=infinera.com header.i=@infinera.com header.b="enyUIoh0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD30022D6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=infinera.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DI/osadMnbygmcLAGcwxfAWVkS04DHOht6bHupeAFfA=; b=uIFIMIStmIJzIb
	gbs9aiUB2wQ5IUwt19WJAcuS2tDxSQx2wYrAf4VHtnFDvabCMQIbWaQbWFSnHYgsL1Y743hMh5gqN
	/ufJX3liajl74gWuq67ivrijPDC5r2KcbLWESGsSUTsOTZhyaBWr0HZeY659W5joFdZpVpVSNuS+t
	QhvnHX9BtM61jAcYYACzfy2elucT3KAXxuroP2P5Gm/N/unY78JlqHn6UpacoYRhxI6vuoMms0egu
	Y1HPR3YRHTix472+JacFDbnOFZaH8qFgIgNgIeLCnYS5VZ4o5BeN5DH8UeL+dTP8AueYt2ak7jXMr
	2s0kY0MalDGXIdJe6RVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0LaI-00071n-RL; Wed, 21 Aug 2019 08:03:10 +0000
Received: from mail-eopbgr690072.outbound.protection.outlook.com
 ([40.107.69.72] helo=NAM04-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0LaF-00071I-SC
 for linux-mtd@lists.infradead.org; Wed, 21 Aug 2019 08:03:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHeAONICPriE964shs3c3CuuefhHjH0JpG1uhiykDUYPo6Ls7qBO2ACNZb4F/DvlaqvR3pWVS4VwlO8iO6VCF82+t5fn3N8zqUyblBfm8PxBY2suLCF54LDh+Z1YjCBYfXtyuXzp1JVJkbtAgLsCF5FVoM43U+kKv0PQWiJj6RLjEwKcf2x/Z9url38uwwohtVGrn7hjoEFaqmawd98Yk9es4A3Ddjofej344S9A5KrGgjBGUpeXtr2X9njM8GP9Rp7+72srRaS6cgFgMvDq7o8J/k7YKYK2/mXI/mAa9f4b2LUNhoWnXll1mJ1m+S981DkjDCtdxrgMWXRn/HAfnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a25+HKNuod/vhH2PuHYTraSgc1GkMtFebCIsqUVDKTA=;
 b=iclTQefDslnkV5WA8cAILEOQ1Kt9gEzElSzCGQr7abs6q3nordYK65ILSnhgALcp9oDvyohExF1T3D5iN5lRJ3XjgUmflzLqSklv9UWpPgDqzLmCA3Vkc2iN65fbXjlgOZjXARJi/mb1csrTY9zoCgwJmwU3+IZO/XInQ12UYclr9iBbvQMgIoclunVYR+n+zUsFLxzPXnSkirO6kIsSKQcpoAoZdEvLeS0jYi4ntwBnGagZGs52w21Mu3yifMQf45sJ7rYWsSSkv+ecE02KEzWlueLk+qhjtKHh8a/IjXMypPrTQkhcY7u+E5NvWx0wvzIHZ76c4GZUoIptC9bGXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a25+HKNuod/vhH2PuHYTraSgc1GkMtFebCIsqUVDKTA=;
 b=enyUIoh0yndYFusxOgJ9tsI21z6SrAZQTDBHI6iDJi/gCM7fhoI3+DjH5ibXSQDyloMLMwSm1jO3xg6RISGv0Ho5cglNPN35q78FEPbFu3WcQK1DvgQODJPwlt5Xj/YgtBf6Ms1V+Ov0vcUBxPboG5LhwSu3hjAyaD9g7Pkv6cw=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (20.179.78.205) by
 BN8PR10MB3233.namprd10.prod.outlook.com (20.179.138.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Wed, 21 Aug 2019 08:03:05 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::ed3c:99c5:c9c:92cc]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::ed3c:99c5:c9c:92cc%7]) with mapi id 15.20.2178.020; Wed, 21 Aug 2019
 08:03:05 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "vigneshr@ti.com" <vigneshr@ti.com>, "ikegami.t@gmail.com"
 <ikegami.t@gmail.com>
Subject: Re: [PATCH v7 0/9] mtd: cfi_cmdset_0002: Fix flash write issue for
 OpenWrt Project
Thread-Topic: [PATCH v7 0/9] mtd: cfi_cmdset_0002: Fix flash write issue for
 OpenWrt Project
Thread-Index: AQHVJr8UFvV/ypnW6kmpWikqjlHsHqcFoDkA
Date: Wed, 21 Aug 2019 08:03:05 +0000
Message-ID: <7f092ec3300c2c982b85ecd58d45f39e3dbae98e.camel@infinera.com>
References: <20190619165001.28410-1-ikegami.t@gmail.com>
In-Reply-To: <20190619165001.28410-1-ikegami.t@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Joakim.Tjernlund@infinera.com; 
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 666e83f2-8a79-48b3-a659-08d7260dff46
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN8PR10MB3233; 
x-ms-traffictypediagnostic: BN8PR10MB3233:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR10MB32337D8F7B614BF3A550CB40F4AA0@BN8PR10MB3233.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(199004)(189003)(229853002)(118296001)(36756003)(5660300002)(476003)(305945005)(99286004)(25786009)(6306002)(110136005)(66446008)(186003)(6506007)(6436002)(446003)(86362001)(102836004)(66556008)(7736002)(76116006)(2616005)(91956017)(64756008)(66476007)(11346002)(6486002)(66946007)(71190400001)(76176011)(5024004)(478600001)(53936002)(316002)(54906003)(26005)(486006)(2906002)(6512007)(6116002)(8936002)(2501003)(71200400001)(14454004)(3846002)(66066001)(81156014)(81166006)(8676002)(256004)(4326008)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR10MB3233;
 H:BN8PR10MB3540.namprd10.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: infinera.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WWNOcbR2fwdTC80Tdt/8yxizp+0oIKHV7X9QVgV7ojl1aB55UtrERnWpOYrgCfbVxlqgYgghSqdO+K/U6htGN6QG9/FshWkx3dTRN7owTMP+zsM9zyGMiz7niNO4KD24JRvAAtbc9Bs2iuFiKuKU3G0IpZv1zYZoC8M5PBjng/rij/7CNk0WDcXRiE7hxdJ+iZKPU4C+DY/FCf5eYbCwbCLLwOvviru/aURaTwZLGQSu/CExUc0qnh32MkI8OmECGSQcQZLfP2+IP0jlN1eRxymVG0S0XAVH2rRF9qqvu94JNplcHxJ7MjA+uMhndD75V85PcCLHtr4p3+hquIg2B9kN+5H3l4Z7+HD83w5ySgL7NmdRceXGpTwrZ5KZZLnorZ9sX6tNp4Daae0Eod+ogoRahkH3dlhpVTu4uYZ4LPE=
x-ms-exchange-transport-forked: True
Content-ID: <6C6076DA429D10439E6FD6DF6C7D25C5@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 666e83f2-8a79-48b3-a659-08d7260dff46
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 08:03:05.3646 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iZ3mMWLgOWhSIFR8QWWucRo9OdkMcC5mgu0QgIkzCPMu9gVSmPkEL2h44XnhzmRldN23Wk4LhmwbpAp4UZXrXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3233
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_010308_020112_89B1C48F 
X-CRM114-Status: GOOD (  14.09  )
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
Cc: "chris.packham@alliedtelesis.co.nz" <chris.packham@alliedtelesis.co.nz>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "fbettoni@gmail.com" <fbettoni@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2019-06-20 at 01:49 +0900, Tokunori Ikegami wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> The change is based on the fix for flash erase to use chip_good() done in
> the past. And it is fixed as same way in the OpenWrt Project as below.
>  <https://nam03.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.openwrt.org%2F%3Fp%3Dopenwrt%2Fopenwrt.git%3Ba%3Dcommitdiff%3Bh%3Dddc11c3932&amp;data=02%7C01%7CJoakim.Tjernlund%40infinera.com%7Cc576b3ddad2d4f3c09f008d6f4d635b2%7C285643de5f5b4b03a1530ae2dc8aaf77%7C1%7C0%7C636965598194534713&amp;sdata=1XV5w3jD6tbfP%2B2Q2eBqfeHp07kHLDxpiJhW4ZA5Ea8%3D&amp;reserved=0>
> Also includes some refactoring changes.
> 

Did this go anywhere?

 Jocke 

> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
> Cc: Fabio Bettoni <fbettoni@gmail.com>
> Co: Hauke Mehrtens <hauke@hauke-m.de>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> Cc: linux-mtd@lists.infradead.org
> 
> Tokunori Ikegami (9):
>   mtd: cfi_cmdset_0002: Use chip_good() to retry in do_write_oneword()
>   mtd: cfi_cmdset_0002: Remove goto statement from do_write_buffer()
>   mtd: cfi_cmdset_0002: Split do_write_oneword() to reduce function size
>   mtd: cfi_cmdset_0002: Split do_write_oneword() op_done goto statement
>   mtd: cfi_cmdset_0002: Remove op_done goto statement from
>     do_write_oneword()
>   mtd: cfi_cmdset_0002: Split write-to-buffer-reset sequence
>   mtd: cfi_cmdset_0002: Split to wait write buffer to check if completed
>   mtd: cfi_cmdset_0002: Split do_write_oneword() to reduce exit paths
>   mtd: cfi_cmdset_0002: Disable write buffer functions if
>     FORCE_WORD_WRITE is 1
> 
>  drivers/mtd/chips/cfi_cmdset_0002.c | 290 ++++++++++++++++++++++--------------
>  1 file changed, 182 insertions(+), 108 deletions(-)
> 
> --
> 2.11.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
