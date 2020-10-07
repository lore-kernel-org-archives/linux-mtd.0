Return-Path: <SRS0=AJHc=DO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C490FC4363C
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2020 05:46:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3272F208C7
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2020 05:46:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VJ0XxGmy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3272F208C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kaod.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xCTfGOFv3pKEfXaK/+/Dt6q07S7dbCUxu+d1uaDjqgg=; b=VJ0XxGmyJ0459sx7JcK5m4f7M
	5la5zbIp4krB0ZZxLBnn3DV+BFCcS793H69dAJw7Sy4XCS027ThrNdgDArBbeqz1pEKs3W/ts3WdM
	V5F0SRNYRC7d7xPOvYJbCFNIPEn2PEJ6hFm2O8uvpSdigardNs4hwqgpMUnXYsZHG0O650GXPZlYF
	Xse2sr0J5oFN9RwwGvKpaDhaDvOqT++aRLD5CsjqyJYkqrnupE05eSmIabvdggN7/7lCugt+wSeZ7
	Id+h+3IqKAl5uO3/mj2EPRQWZ/03YFDnf4z9/9B7bT+8LH9fUWBEw7ZmnNTjyeEY+XbRj9puSb3G0
	mgf3NNfZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ2GG-0005ao-2x; Wed, 07 Oct 2020 05:45:12 +0000
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ2GD-0005ZL-1p
 for linux-mtd@lists.infradead.org; Wed, 07 Oct 2020 05:45:10 +0000
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.114])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 17B006974A95;
 Wed,  7 Oct 2020 07:44:56 +0200 (CEST)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 7 Oct 2020
 07:44:55 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0064af6da83-515b-414c-86c4-642b6e60958a,
 A1FB6DEFD4FFF4B2E39ADAD8D1A9CF0B60FA0B96) smtp.auth=clg@kaod.org
Subject: Re: [PATCH v2] mtd: spi-nor: Fix address width on flash chips > 16MB
To: Joel Stanley <joel@jms.id.au>, Bert Vermeulen <bert@biot.com>
References: <20201004213204.11584-1-bert@biot.com>
 <CACPK8XceL_QHCQOhfus27rei0vwfRJAFjfL6JkVw9pwxJj2d6Q@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <df901923-ede9-baf0-b82d-517839305d12@kaod.org>
Date: Wed, 7 Oct 2020 07:44:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XceL_QHCQOhfus27rei0vwfRJAFjfL6JkVw9pwxJj2d6Q@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7bbe3df6-b180-4240-b832-b998933fa573
X-Ovh-Tracer-Id: 6185412613786995564
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrgeehgddutddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_014509_210474_72EAA082 
X-CRM114-Status: GOOD (  21.61  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTAvNy8yMCAzOjUxIEFNLCBKb2VsIFN0YW5sZXkgd3JvdGU6Cj4gT24gU3VuLCA0IE9jdCAy
MDIwIGF0IDIxOjMzLCBCZXJ0IFZlcm1ldWxlbiA8YmVydEBiaW90LmNvbT4gd3JvdGU6Cj4+Cj4+
IElmIGEgZmxhc2ggY2hpcCBoYXMgbW9yZSB0aGFuIDE2TUIgY2FwYWNpdHkgYnV0IGl0cyBCRlBU
IHJlcG9ydHMKPj4gQkZQVF9EV09SRDFfQUREUkVTU19CWVRFU18zX09SXzQsIHRoZSBzcGktbm9y
IGZyYW1ld29yayBkZWZhdWx0cyB0byAzLgo+Pgo+PiBUaGUgY2hlY2sgaW4gc3BpX25vcl9zZXRf
YWRkcl93aWR0aCgpIGRvZXNuJ3QgY2F0Y2ggaXQgYmVjYXVzZSBhZGRyX3dpZHRoCj4+IGRpZCBn
ZXQgc2V0LiBUaGlzIGZpeGVzIHRoYXQgY2hlY2suCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEJlcnQg
VmVybWV1bGVuIDxiZXJ0QGJpb3QuY29tPgo+IAo+IEFmdGVyIHJlcGx5aW5nIHRvIHRoZSBvdGhl
ciB0aHJlYWQsIEkganVzdCBzYXcgdGhpcyBvbmUuCj4gCj4gUmV2aWV3ZWQtYnk6IEpvZWwgU3Rh
bmxleSA8am9lbEBqbXMuaWQuYXU+Cj4gVGVzdGVkLWJ5OiBKb2VsIFN0YW5sZXkgPGpvZWxAam1z
LmlkLmF1Pgo+IAo+IFRoYW5rcyBCZXJ0IQoKClllcy4gSSB3YXMgc3RhcnRpbmcgdG8gYWRkIGJm
cHQtZml4dXBzIGZvciBhbGwgY2hpcHMgd2UgdXNlIG9uIEFzcGVlZCAKYmFzZWQgc3lzdGVtLgoK
UmV2aWV3ZWQtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+ClRlc3RlZC1ieTog
Q8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KClRoYW5rcywKCkMuIAoKCgo+IENoZWVy
cywKPiAKPiBKb2VsCj4gCj4+IC0tLQo+PiAgZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgfCA4
ICsrKysrLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgYi9kcml2
ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+PiBpbmRleCAwMzY5ZDk4YjJkMTIuLmEyYzM1YWQ5NjQ1
YyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPj4gKysrIGIvZHJp
dmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPj4gQEAgLTMwMDksMTMgKzMwMDksMTUgQEAgc3RhdGlj
IGludCBzcGlfbm9yX3NldF9hZGRyX3dpZHRoKHN0cnVjdCBzcGlfbm9yICpub3IpCj4+ICAgICAg
ICAgICAgICAgICAvKiBhbHJlYWR5IGNvbmZpZ3VyZWQgZnJvbSBTRkRQICovCj4+ICAgICAgICAg
fSBlbHNlIGlmIChub3ItPmluZm8tPmFkZHJfd2lkdGgpIHsKPj4gICAgICAgICAgICAgICAgIG5v
ci0+YWRkcl93aWR0aCA9IG5vci0+aW5mby0+YWRkcl93aWR0aDsKPj4gLSAgICAgICB9IGVsc2Ug
aWYgKG5vci0+bXRkLnNpemUgPiAweDEwMDAwMDApIHsKPj4gLSAgICAgICAgICAgICAgIC8qIGVu
YWJsZSA0LWJ5dGUgYWRkcmVzc2luZyBpZiB0aGUgZGV2aWNlIGV4Y2VlZHMgMTZNaUIgKi8KPj4g
LSAgICAgICAgICAgICAgIG5vci0+YWRkcl93aWR0aCA9IDQ7Cj4+ICAgICAgICAgfSBlbHNlIHsK
Pj4gICAgICAgICAgICAgICAgIG5vci0+YWRkcl93aWR0aCA9IDM7Cj4+ICAgICAgICAgfQo+Pgo+
PiArICAgICAgIGlmIChub3ItPmFkZHJfd2lkdGggPT0gMyAmJiBub3ItPm10ZC5zaXplID4gMHgx
MDAwMDAwKSB7Cj4+ICsgICAgICAgICAgICAgICAvKiBlbmFibGUgNC1ieXRlIGFkZHJlc3Npbmcg
aWYgdGhlIGRldmljZSBleGNlZWRzIDE2TWlCICovCj4+ICsgICAgICAgICAgICAgICBub3ItPmFk
ZHJfd2lkdGggPSA0Owo+PiArICAgICAgIH0KPj4gKwo+PiAgICAgICAgIGlmIChub3ItPmFkZHJf
d2lkdGggPiBTUElfTk9SX01BWF9BRERSX1dJRFRIKSB7Cj4+ICAgICAgICAgICAgICAgICBkZXZf
ZGJnKG5vci0+ZGV2LCAiYWRkcmVzcyB3aWR0aCBpcyB0b28gbGFyZ2U6ICV1XG4iLAo+PiAgICAg
ICAgICAgICAgICAgICAgICAgICBub3ItPmFkZHJfd2lkdGgpOwo+PiAtLQo+PiAyLjE3LjEKPj4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
