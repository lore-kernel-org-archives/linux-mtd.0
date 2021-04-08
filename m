Return-Path: <SRS0=gt70=JF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69AF1C433B4
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 12:47:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8DFC610FC
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 12:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8DFC610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nLmaFxhQP2MjShLr1QQqg/VgHdOUiG0Rn6gZc3fLyV0=; b=TIHGzritrtn14uGrz6N57fhxi
	zaY+AULvJL8IGrG/1Yr3c7KagHXlbYd43+fMhE11YkNcfnu7jtIi5X+63qdeRsb5KcPepOEhaurp7
	hkG+QKRoHGoKGxrq6Hpcx9y++J913NqFCBSPs0E9b4L+OK7jdLVDTpsULL99sn0AA8USGTSLBvS/Z
	hgEA1y0nr63W8Q69n2zj7lgzvQkqg2bSpKRhKzOB7S9Gbw8KNFsEnKOkxc5B96zHSv+hOT7g5n3qg
	Kx+rj1TDGWq9pOFssAcLnrsg3x1R/7WwCg52g/b1prFXam3vK22xN6fp3GV4/iBsUdEqh6JPkltxc
	k5H9x97Fw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUU3N-00828J-Ib; Thu, 08 Apr 2021 12:46:34 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUU37-00826o-5m; Thu, 08 Apr 2021 12:46:18 +0000
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 589EB100013;
 Thu,  8 Apr 2021 12:46:12 +0000 (UTC)
Date: Thu, 8 Apr 2021 14:46:10 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yu Kuai <yukuai3@huawei.com>
Cc: <joern@lazybastard.org>, <richard@nod.at>, <vigneshr@ti.com>,
 <matthias.bgg@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <yi.zhang@huawei.com>
Subject: Re: [PATCH 3/3] mtd: phram: Fix error return code in phram_setup()
Message-ID: <20210408144610.0c0686ae@xps13>
In-Reply-To: <20210408111514.1011020-4-yukuai3@huawei.com>
References: <20210408111514.1011020-1-yukuai3@huawei.com>
 <20210408111514.1011020-4-yukuai3@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_134617_295660_3A62E6A3 
X-CRM114-Status: GOOD (  14.43  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWXUsCgpZdSBLdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+IHdyb3RlIG9uIFRodSwgOCBBcHIg
MjAyMSAxOToxNToxNCArMDgwMDoKCj4gRml4IHRvIHJldHVybiBhIG5lZ2F0aXZlIGVycm9yIGNv
ZGUgZnJvbSB0aGUgZXJyb3IgaGFuZGxpbmcKPiBjYXNlIGluc3RlYWQgb2YgMCwgYXMgZG9uZSBl
bHNld2hlcmUgaW4gdGhpcyBmdW5jdGlvbi4KPiAKPiBSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8
aHVsa2NpQGh1YXdlaS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogWXUgS3VhaSA8eXVrdWFpM0BodWF3
ZWkuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9kZXZpY2VzL3BocmFtLmMgfCAxICsKPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L2RldmljZXMvcGhyYW0uYyBiL2RyaXZlcnMvbXRkL2RldmljZXMvcGhyYW0uYwo+IGluZGV4IDVi
MDRhZTZjMzA1Ny4uNmVkNmM1MWZhYzY5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL2Rldmlj
ZXMvcGhyYW0uYwo+ICsrKyBiL2RyaXZlcnMvbXRkL2RldmljZXMvcGhyYW0uYwo+IEBAIC0yNzAs
NiArMjcwLDcgQEAgc3RhdGljIGludCBwaHJhbV9zZXR1cChjb25zdCBjaGFyICp2YWwpCj4gIAlp
ZiAobGVuID09IDAgfHwgZXJhc2VzaXplID09IDAgfHwgZXJhc2VzaXplID4gbGVuCj4gIAkgICAg
fHwgZXJhc2VzaXplID4gVUlOVF9NQVggfHwgcmVtKSB7Cj4gIAkJcGFyc2VfZXJyKCJpbGxlZ2Fs
IGVyYXNlc2l6ZSBvciBsZW5cbiIpOwo+ICsJCXJldCA9IC1FSU5WQUw7Cj4gIAkJZ290byBlcnJv
cjsKPiAgCX0KPiAgCgpJdCBsb29rcyBsaWtlIHlvdSdyZSBkb2luZyB0aGUgb3Bwb3NpdGUgb2Yg
d2hhdCB5b3Ugc2F5LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
