Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B408C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 17:42:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 663DF64EE6
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 17:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 663DF64EE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=milecki.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AAfydkYdy4MnBOHxyjoUjiQXI8c+LEEq+6fv2VeM63A=; b=bdVo56M4FoMmzNdIQKM8il13P
	0tKscNki/DGvQfercEL9BZOMu+sCta0KJKQpC3i1eCrUIf7WWCzALWsUXsCMelQ29o3FjGxNcQZXO
	QGAXrt7etafZOzywjS7l9aRtPX3nopkp+JAFYGN89q8CS6Du22n5DVD8ubQg/O5G1HGitYwZa62qR
	H+Nvj9va2TXJxHR6iaLQ+XtvRSEvlwiD7r/tC7yb9r5ayrUQ8RoxlQ/Ne608HyvYzuO74yjRaeEg3
	eHUsrwrK53dSydRVdgfzMgJ34xJDZB+xCHqh+ZblpdPmuCPXpgVw5FopuVBfsz5siKDjl3NYEAKs7
	E48+BVuoQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHVUz-005qdn-K9; Wed, 03 Mar 2021 17:41:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSvx-005FhM-6A
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:57:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=t8phNxhh2FLYixOK3yQwOFlNwR652rYXpwQznJs2U+A=; b=QLem480ZELyqY1RlnNf0uVu+Kd
 bYmlSVxre3z2Lu7GIrZg9WugjDlS48E9u2GmEP+oI6HDDvcTTZg6uhgaG2kSCxoJMABVpipMZvwOQ
 VfaTMkHZdxxJ1Ki72lHiBR6AHpjoqhIQqECqSrKhNLYKZX50a6nGFioj9EAg6PEpmJ1md98HLf0VX
 Ow7POl/nFBfIpantufAj0uJ7wa63iNSjAX10WrMYDaSt85lI7Ff+UDCaVMXPTRfELWiN60okuyZw2
 aCG59jZ51eOcC+XHYY6LM0wLNnL/WaVDMhTsPpfsGrLtLsHK9bvnk1HPqYmWzOxGEhObq6nyhrFBR
 q82//Dhg==;
Received: from 3.mo4.mail-out.ovh.net ([46.105.57.129])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHBYY-000Gv5-0y
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 20:23:46 +0000
Received: from player694.ha.ovh.net (unknown [10.108.20.46])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id C19262690EA
 for <linux-mtd@lists.infradead.org>; Tue,  2 Mar 2021 21:23:28 +0100 (CET)
Received: from milecki.pl (ip-194-187-74-233.konfederacka.maverick.com.pl
 [194.187.74.233]) (Authenticated sender: rafal@milecki.pl)
 by player694.ha.ovh.net (Postfix) with ESMTPSA id C856E1B892D31;
 Tue,  2 Mar 2021 20:23:19 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001e4219103-50b8-4c6d-a6b0-c85a43e4d55a,
 30A6642CDD8C470EE0968BB77936367BDB6FAF8D) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 194.187.74.233
Subject: Re: R: [PATCH] mtd: parsers: ofpart: limit parsing of deprecated DT
 syntax
To: ansuelsmth@gmail.com, =?UTF-8?B?J1JhZmHFgiBNacWCZWNraSc=?=
 <zajec5@gmail.com>, 'Miquel Raynal' <miquel.raynal@bootlin.com>,
 'Richard Weinberger' <richard@nod.at>,
 'Vignesh Raghavendra' <vigneshr@ti.com>
Cc: 'Boris Brezillon' <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org
References: <20210302190012.1255-1-zajec5@gmail.com>
 <000801d70f9b$9c902980$d5b07c80$@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Message-ID: <98afbb1a-d80e-4c0a-90c9-077c2361d753@milecki.pl>
Date: Tue, 2 Mar 2021 21:23:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <000801d70f9b$9c902980$d5b07c80$@gmail.com>
Content-Language: en-US
X-Ovh-Tracer-Id: 11439143057269886643
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddttddguddvlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeftrghfrghlucfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeekudehjeehffdufefhgffhgeejjeelteekveeuleevgeekhffhffeiheellefgveenucfkpheptddrtddrtddrtddpudelgedrudekjedrjeegrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieelgedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehrrghfrghlsehmihhlvggtkhhirdhplhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_202346_611444_7933F1D0 
X-CRM114-Status: GOOD (  11.54  )
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

T24gMDIuMDMuMjAyMSAyMDozOCwgYW5zdWVsc210aEBnbWFpbC5jb20gd3JvdGU6Cj4+IEZyb206
IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPj4KPj4gRm9yIGJhY2t3YXJkIGNv
bXBhdGliaWxpdHkgb2ZwYXJ0IHN0aWxsIHN1cHBvcnRzIHRoZSBvbGQgc3ludGF4IGxpa2U6Cj4+
IHNwaS1mbGFzaEAwIHsKPj4gCWNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7Cj4+IAlyZWcg
PSA8MHgwPjsKPj4KPj4gCXBhcnRpdGlvbkAwIHsKPj4gCQlsYWJlbCA9ICJib290bG9hZGVyIjsK
Pj4gCQlyZWcgPSA8MHgwIDB4MTAwMDAwPjsKPj4gCX07Cj4+IH07Cj4+ICh3aXRob3V0ICJwYXJ0
aXRpb25zIiBzdWJub2RlKS4KPj4KPj4gVGhlcmUgaXMgbm8gcmVhc29uIGhvd2V2ZXIgdG8gc3Vw
cG9ydCBuZXN0ZWQgcGFydGl0aW9ucyB3aXRob3V0IGEgY2xlYXIKPj4gImNvbXBhdGlibGUiIHN0
cmluZyBsaWtlOgo+PiBwYXJ0aXRpb25zIHsKPj4gCWNvbXBhdGlibGUgPSAiZml4ZWQtcGFydGl0
aW9ucyI7Cj4+IAkjYWRkcmVzcy1jZWxscyA9IDwxPjsKPj4gCSNzaXplLWNlbGxzID0gPDE+Owo+
Pgo+PiAJcGFydGl0aW9uQDAgewo+PiAJCWxhYmVsID0gImJvb3Rsb2FkZXIiOwo+PiAJCXJlZyA9
IDwweDAgMHgxMDAwMDA+Owo+Pgo+PiAJCXBhcnRpdGlvbkAwIHsKPj4gCQkJbGFiZWwgPSAiY29u
ZmlnIjsKPj4gCQkJcmVnID0gPDB4ODAwMDAgMHg4MDAwMD47Cj4+IAkJfTsKPj4gCX07Cj4+IH07
Cj4+ICh3ZSBuZXZlciBvZmZpY2lhbGx5IHN1cHBvcnRlZCBvciBkb2N1bWVudGVkIHRoYXQpLgo+
Pgo+PiBNYWtlIHN1cmUgb2ZwYXJ0IGRvZXNuJ3QgYXR0ZW1wdCB0byBwYXJzZSBhYm92ZS4KPj4K
PiAKPiBJIGhhdmUgb25lIHF1ZXN0aW9uLgo+ICBGcm9tIHdoYXQgSSBjYW4gc2VlIGluIHRoZSBu
ZXcgY29kZSwgaW4gdGhpcyBleGFtcGxlICJzb21ldGhpbmciCj4gcGFydGl0aW9uIHdvbid0IGJl
IHBhcnNlZCB3aXRoIHRoZSBmaXhlZC1wYXJ0aXRpb24gcGFyc2VyLiBDb3JyZWN0Pwo+IAo+IHBh
cnRpdGlvbnMgewo+IAljb21wYXRpYmxlID0gImZpeGVkLXBhcnRpdGlvbnMiOwo+IAkjYWRkcmVz
cy1jZWxscyA9IDwxPjsKPiAJI3NpemUtY2VsbHMgPSA8MT47Cj4gCj4gCXBhcnRpdGlvbkAwIHsK
PiAJCWxhYmVsID0gImJvb3Rsb2FkZXIiOwo+IAkJcmVnID0gPDB4MCAweDEwMDAwMD47Cj4gCQlj
b21wYXRpYmxlID0gInJhbmRvbS1wYXJzZXIiOwo+IAo+IAkJcGFydGl0aW9uQDAgewo+IAkJCWxh
YmVsID0gInNvbWV0aGluZyI7Cj4gCQkJcmVnID0gPDB4MCAweDEwMD47Cj4gCQl9Owo+IAl9Owo+
IH07CgpDb3JyZWN0LgoKQm90aDogImJvb3Rsb2FkZXIiIGFuZCAic29tZXRoaW5nIiBwYXJ0aXRp
b25zIGluIHlvdXIgZXhhbXBsZSB3aWxsIGhhdmUKbWFzdGVyLT5wYXJlbnQgc2V0IHRvIHRoZWly
IHBhcmVudHMuIFBhcnNlciAib2ZwYXJ0IiB3aWxsIE5PVCBhdHRlbXB0IHRvCnBhcnNlICJib290
bG9hZGVyIiBzdWJub2RlcyBvciAic29tZXRoaW5nIiBzdWJub2Rlcy4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
