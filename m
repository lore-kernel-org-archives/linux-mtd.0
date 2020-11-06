Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB52DC2D0A3
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 13:38:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50E6520735
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 13:38:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MSn2FWvf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="eWB9jV/3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50E6520735
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lEMnngbwe0d9+ndQNSvJH9eB55ovTvi2Or25InzQ6pM=; b=MSn2FWvf7ahUZT30IKdRGOk7I
	fR1aEEaDzAtBQPS2Hgg8MY0t8vPBWDOJMBO5YHLa2rnb5Ps2ZKHwE8ejOf7msDhAK2U9UfRAMLtTM
	l9Yw23FGFjpHYe5kiGKUYZIAzqEyS21C6RZR4H6Q3OQ0kFXoiwSwGRRsgWxAdOjR0UXhdgJcdzx4K
	y41Wx4+llJiEYR+mrx6AccaetlYPqnA7L3yk0Co/Lvolei/5U8uto1bmRK1+tbd+k1q5oYnh/fBQ7
	zu96vXafG2fuzo6Say3pvlN4JzapTIzuFwZts76cJwTJ3Rf8NXlG4bEDelMUKDEFKNsJP+luYmKgD
	wMmvIqZVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb1vl-0004lT-Mx; Fri, 06 Nov 2020 13:37:29 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb1vj-0004ky-He
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 13:37:28 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A6DbGJ8102374;
 Fri, 6 Nov 2020 07:37:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604669836;
 bh=a/oKUWOuKW3ydPesK1Xly4sled9yN1hC7tAR646Mr6U=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=eWB9jV/3IRkMGKzVpRcoSFtbBTO1+tFzf2zseIuXMZL7v3jLbprFGMuDxfIefbP7h
 gr5fA2fj/YomyzUD43uycDx2WlUE7ANmGW3RHz1NBuCJ5mpuWu92YrcmknbP164JX9
 LiZOPsGrq8lXpDwB861e6Pveryh/dUpapGB48gew=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A6DbFMs119490
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 6 Nov 2020 07:37:15 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 6 Nov
 2020 07:37:15 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 6 Nov 2020 07:37:15 -0600
Received: from [10.250.233.179] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A6DbB3W081197;
 Fri, 6 Nov 2020 07:37:12 -0600
Subject: Re: [PATCH 07/23] mtd: spi-nor: controllers: hisi-sfc: Demote
 non-conformant kernel-doc
To: Lee Jones <lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
 <20201102115406.1074327-8-lee.jones@linaro.org>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <5ba82a34-5dfe-71f0-703e-6603de6ef468@ti.com>
Date: Fri, 6 Nov 2020 19:07:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201102115406.1074327-8-lee.jones@linaro.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_083727_671904_46F180C2 
X-CRM114-Status: GOOD (  18.55  )
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAxMS8yLzIwIDU6MjMgUE0sIExlZSBKb25lcyB3cm90ZToKPiBGaXhlcyB0aGUgZm9sbG93
aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKPiAKPiAgZHJpdmVycy9tdGQvc3BpLW5v
ci9jb250cm9sbGVycy9oaXNpLXNmYy5jOjMyODogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVy
IG9yIG1lbWJlciAnbnAnIG5vdCBkZXNjcmliZWQgaW4gJ2hpc2lfc3BpX25vcl9yZWdpc3RlcicK
PiAgZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9oaXNpLXNmYy5jOjMyODogd2Fybmlu
ZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnaG9zdCcgbm90IGRlc2NyaWJlZCBpbiAn
aGlzaV9zcGlfbm9yX3JlZ2lzdGVyJwo+IAo+IENjOiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJh
cnVzQG1pY3JvY2hpcC5jb20+Cj4gQ2M6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9v
dGxpbi5jb20+Cj4gQ2M6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Cj4gQ2M6
IFZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KPiBDYzogU3VtaXQgU2Vtd2Fs
IDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwo+IFNp
Z25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRy
aXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvaGlzaS1zZmMuYyB8IDIgKy0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvaGlzaS1zZmMuYyBiL2RyaXZlcnMvbXRk
L3NwaS1ub3IvY29udHJvbGxlcnMvaGlzaS1zZmMuYwo+IGluZGV4IDk1YzUwMjE3M2NiZGEuLjdj
MjZmOGY1NjVjYmEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVy
cy9oaXNpLXNmYy5jCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9oaXNp
LXNmYy5jCj4gQEAgLTMyMCw3ICszMjAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNwaV9ub3Jf
Y29udHJvbGxlcl9vcHMgaGlzaV9jb250cm9sbGVyX29wcyA9IHsKPiAgCS53cml0ZSA9IGhpc2lf
c3BpX25vcl93cml0ZSwKPiAgfTsKPiAgCj4gLS8qKgo+ICsvKgo+ICAgKiBHZXQgc3BpIGZsYXNo
IGRldmljZSBpbmZvcm1hdGlvbiBhbmQgcmVnaXN0ZXIgaXQgYXMgYSBtdGQgZGV2aWNlLgo+ICAg
Ki8KPiAgc3RhdGljIGludCBoaXNpX3NwaV9ub3JfcmVnaXN0ZXIoc3RydWN0IGRldmljZV9ub2Rl
ICpucCwKPiAKClJldmlld2VkLWJ5OiBWaWduZXNoIFJhZ2hhdmVuZHJhIDx2aWduZXNockB0aS5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
