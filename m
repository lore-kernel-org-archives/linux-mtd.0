Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37733C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Feb 2022 09:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bxeITb0wFlen+SnMG2I9xur8Yj/KUUXyBUvYWR5RyGU=; b=j8lS8y4YrQ1ymd
	BQIyPIw6PtDcfdL5YWFiyTFicnZOY/p49McEf0oJTIYAW39FgJmf/P9hdL0sc6xhJVVwm3VDKsNHC
	Tj+RNHn4KVRAnqUo0DMTJIUjgkcYPY3WmQW2S69mISWV93t58UISmuK14esQ3KY0H0lbUbFiPIZ+D
	YgpV8oECnmt5LF/GTJLuV8elAv35z7/+S53PC4KDxiK5yaMXQC0/jbv9v6w66YAi1vb1FVzN0hMBT
	2MoFmWRjQRRUXDs2LlhWkLK6s63RBUSB2LvYdTahFMl2BFCFVSSHrTONNF61/j/MzvsITdlULG2+w
	bFaPKrLFhnzc6Ix5nsgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJtom-001uyj-Df; Tue, 15 Feb 2022 09:08:16 +0000
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJtoV-001uqU-4c
 for linux-mtd@lists.infradead.org; Tue, 15 Feb 2022 09:08:02 +0000
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.11])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 8335821EFF;
 Tue, 15 Feb 2022 09:07:53 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 15 Feb
 2022 10:07:52 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002b27b64c4-57a5-44f9-a47c-4a83fe5690ca,
 2487B4E7026A90D95ED29794538901B35B4D209A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <76c3f352-a0fc-f72f-e66e-594f9249cb8c@kaod.org>
Date: Tue, 15 Feb 2022 10:07:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 03/10] spi: spi-mem: Add driver for Aspeed SMC controllers
Content-Language: en-US
To: Lukas Wunner <lukas@wunner.de>
CC: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Mark Brown
 <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 <linux-aspeed@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@aj.id.au>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220214094231.3753686-1-clg@kaod.org>
 <20220214094231.3753686-4-clg@kaod.org> <20220215062743.GA12431@wunner.de>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220215062743.GA12431@wunner.de>
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4e02782a-965d-4bc5-8fe7-6f59370c6abd
X-Ovh-Tracer-Id: 7883832626687085383
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeefgdduvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_010759_523579_DAC8DADD 
X-CRM114-Status: GOOD (  14.19  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8gTHVrYXMsCgpPbiAyLzE1LzIyIDA3OjI3LCBMdWthcyBXdW5uZXIgd3JvdGU6Cj4gT24g
TW9uLCBGZWIgMTQsIDIwMjIgYXQgMTA6NDI6MjRBTSArMDEwMCwgQ8OpZHJpYyBMZSBHb2F0ZXIg
d3JvdGU6Cj4+ICtzdGF0aWMgaW50IGFzcGVlZF9zcGlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKPj4gK3sKPiBbLi4uXQo+PiArCWN0bHIgPSBzcGlfYWxsb2NfbWFzdGVyKGRl
diwgc2l6ZW9mKCphc3BpKSk7Cj4+ICsJaWYgKCFjdGxyKQo+PiArCQlyZXR1cm4gLUVOT01FTTsK
PiAKPiBVc2UgZGV2bV9zcGlfYWxsb2NfbWFzdGVyKCkgYW5kIHJlbW92ZSB0aGUgInB1dF9jb250
cm9sbGVyIiBlcnJvciBwYXRoCj4gZm9yIHNpbXBsaWNpdHkuCiAgCnllcy4KCj4+ICsJcmV0ID0g
ZGV2bV9zcGlfcmVnaXN0ZXJfY29udHJvbGxlcihkZXYsIGN0bHIpOwo+IFsuLi5dCj4+ICtzdGF0
aWMgaW50IGFzcGVlZF9zcGlfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+
ICt7Cj4+ICsJc3RydWN0IHNwaV9jb250cm9sbGVyICpjdGxyID0gcGxhdGZvcm1fZ2V0X2RydmRh
dGEocGRldik7Cj4+ICsJc3RydWN0IGFzcGVlZF9zcGkgKmFzcGkgPSBzcGlfY29udHJvbGxlcl9n
ZXRfZGV2ZGF0YShjdGxyKTsKPj4gKwo+PiArCWFzcGVlZF9zcGlfZW5hYmxlKGFzcGksIGZhbHNl
KTsKPj4gKwlzcGlfdW5yZWdpc3Rlcl9jb250cm9sbGVyKGN0bHIpOwo+PiArCWNsa19kaXNhYmxl
X3VucHJlcGFyZShhc3BpLT5jbGspOwo+PiArCXJldHVybiAwOwo+PiArfQo+IAo+IFlvdSBuZWVk
IHRvIG1vdmUgdGhlIGNhbGwgdG8gc3BpX3VucmVnaXN0ZXJfY29udHJvbGxlcigpICpiZWZvcmUq
Cj4gdGhlIGNhbGwgdG8gYXNwZWVkX3NwaV9lbmFibGUoKS4gIFRoZSBjb250cm9sbGVyIG11c3Qg
YmUgZnVsbHkKPiBvcGVyYXRpb25hbCB1bnRpbCBzcGlfdW5yZWdpc3Rlcl9jb250cm9sbGVyKCkg
cmV0dXJucy4KPiAKPiBZb3UgYWxzbyBuZWVkIHRvIHJlcGxhY2UgdGhlIGNhbGwgdG8gZGV2bV9z
cGlfcmVnaXN0ZXJfY29udHJvbGxlcigpCj4gaW4gYXNwZWVkX3NwaV9wcm9iZSgpIHdpdGggc3Bp
X3JlZ2lzdGVyX2NvbnRyb2xsZXIoKS4KPiBPdGhlcndpc2UgeW91J2xsIHVucmVnaXN0ZXIgdGhl
IGNvbnRyb2xsZXIgdHdpY2UgYmVjYXVzZSB5b3UncmUKPiBjYWxsaW5nIHNwaV91bnJlZ2lzdGVy
X2NvbnRyb2xsZXIoKSBpbiBhc3BlZWRfc3BpX3JlbW92ZSgpLgoKb2suIFVuZGVyc3Rvb2QuIERv
bmUgaW4gdjIuCgpUaGFua3MsCgpDLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
