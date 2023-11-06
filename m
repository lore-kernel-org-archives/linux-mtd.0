Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB9CC4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Nov 2023 09:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lSpNLVs+XmBJ/QA68AOkb7DckAFpCWajxoVCFEeLSFM=; b=PQpf9XS813XWiZ+gtnmL2E//p1
	n2hbSOk1hZrV4RO+xEdjHZjD7BXPbY6ARBbKm7mEg0D9L0MnuDqj00R5MF3T1QvRGOUIQSy+v5a61
	JvjLj4ecB/Kx5V+DDcJejZv2UUIoTiSOvjUh6WWW9flq6amEMmLhzPHN6j+cTVTISqTO2k2vOY9iD
	XlQdsCiJiYAMPxRJYimveKIVzf3QyyZAc55ax21xUDuGl3Pc6qdm9Cw7pX93PHJCHtPt50rV0r41L
	V8UivJM5uF6VqkfjPAOqAY9IZ3v0FhHDDxUJtxN5z1m2E0Fvl7uRsrpTqtHJihdoBmi7JwkTq4kSe
	jlgRVJTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzw05-00GB4P-04;
	Mon, 06 Nov 2023 09:34:29 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzw01-00GB3K-0E;
	Mon, 06 Nov 2023 09:34:27 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 86C7A4E7;
	Mon,  6 Nov 2023 10:34:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1699263257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iXA/6WE32gLKdJ1uReu2MZeHm4K0U0O00bLXPsiik2E=;
	b=0urA7EmXnbLlaibHHUUybwSgrbu9recduORiS/ozmeg4bypj+urhUyvKWjtghDuQK6POcV
	nbFqISfJl/mbN426zkHDCNDzc2KJSbV1m5vQnW+F39vFkylcFy0zThoOA9TJRgcKcVNPgY
	CM9a4dKMqHKSDqd0ig//FYXtCSuOB6egVVoW8kyHvW1l/DUri1VJY8V3zkidJCsWUzSPyk
	qnAbmw9iwNhNak9qbY1F01e1CVxGI28lru/bjlRK3kIUXTlnExlFH9wyJ6aWXGp+Pl98kG
	SiHDUPbglZv01URwIKMVWrWUBjo401SlnNEwp0JaY9fF5EspDb8s2y33RrBDmQ==
MIME-Version: 1.0
Date: Mon, 06 Nov 2023 10:34:17 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Fabio Estevam <festevam@denx.de>, Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>, pratyush@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 bacem.daassi@infineon.com, miquel.raynal@bootlin.com, richard@nod.at
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
In-Reply-To: <a3ccb98e-b8bd-4ea3-98c4-df429602a7ef@linaro.org>
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
 <216d99d671caa2465519fcc3360c5001@denx.de>
 <e3901646-c918-426f-b219-e1670dc1e854@linaro.org>
 <5c48f93a9dd9b2bdc1874dd4eebbf5bb@denx.de>
 <a7bee4f0-8591-411a-a105-0284df22c464@linaro.org>
 <632457ed6b022856496537bdf8a738ba@denx.de>
 <aa123456-7ec9-4bdc-a521-66c9582d5d45@linaro.org>
 <c26f6623-2d58-43ed-95bb-957870890a02@linaro.org>
 <6f1aa670-b3f7-4ea3-bc80-773a57e46c36@linaro.org>
 <968ba4c249926e986b02440ad0421e98@denx.de>
 <f2141a88-13d4-47b8-8382-5df8cc1bc42b@linaro.org>
 <cf0e4284f2e3193ddd57b715196ca202@denx.de>
 <25ca1a4c-683c-4b6d-938b-07323b211815@linaro.org>
 <c3f2b8a6-8b23-4a33-948e-62ff64db9a2f@linaro.org>
 <5872f7233bc0dc4669aa1324f3ae3cf0@denx.de>
 <95c16eb0-a785-4a8d-bb42-c5a09b034d0a@linaro.org>
 <e665266fc1565f9d346c95215df39f12@denx.de>
 <085ba0f9780b1f8b34bc9e1037fec5e7@denx.de>
 <b5c1d4d7-1583-4469-a604-dcf5bb3f96a4@linaro.org>
 <9004acceea77d2f06aaff0ca5f916cd7@denx.de>
 <a3ccb98e-b8bd-4ea3-98c4-df429602a7ef@linaro.org>
Message-ID: <ea846bc8c214836c40c06fd875aee575@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_013425_493601_3EB1034F 
X-CRM114-Status: GOOD (  11.71  )
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

QW0gMjAyMy0xMS0wMyAxNDo0OCwgc2NocmllYiBUdWRvciBBbWJhcnVzOgo+IE9uIDAzLjExLjIw
MjMgMTU6MzcsIEZhYmlvIEVzdGV2YW0gd3JvdGU6Cj4+IE9uIDAzLzExLzIwMjMgMTA6MjYsIFR1
ZG9yIEFtYmFydXMgd3JvdGU6Cj4+IAo+Pj4gV2hpY2ggdmVyc2lvbiBvZiBtdGQtdXRpbHMgYXJl
IHlvdSB1c2luZz8gSSBndWVzcyB0aGUgZmxhc2gtZXJhc2UKPj4gCj4+IG10ZC11dGlscyAyLjEu
NQo+PiAKPj4+IHV0aWxpdHkgaXMgd3JpdHRlbiBpbiBhIGJhZCB3YXkuIFBsZWFzZSB1c2UgdGhl
IGZvbGxvd2luZyB3aGlsZSBJIAo+Pj4gY2hlY2sKPj4+IHdoYXQgZmxhc2hfZXJhc2UgaXMgZG9p
bmc6Cj4+PiAKPj4+IHRpbWUgbXRkX2RlYnVnIGVyYXNlIC9kZXYvbXRkMCAwIDEzNDIxNzcyOAo+
PiAKPj4gIm10ZF9kZWJ1ZyBlcmFzZSIgZ2l2ZXMgdGhlIHNhbWUgdGltZSBhcyB3ZWxsOgo+PiAK
Pj4gcm9vdEBtY2RlMzAwMGE6fiMgdGltZSBtdGRfZGVidWcgZXJhc2UgL2Rldi9tdGQwIDAgMTM0
MjE3NzI4Cj4+IFsgNDMyMi4xMTQ5NjddIHNwaS1ub3Igc3BpMC4wOiAqKioqKiBub3ItPnJlZ19w
cm90byA9IDB4MDAwMTAxMDEKPj4gWyA0MzIyLjEyMDg2MV0gc3BpLW5vciBzcGkwLjA6ICoqKioq
Cj4+IFsgNDMyMi4xMjQyMTBdIHNwaS1ub3Igc3BpMC4wOiAqKioqKiBvcC5jbWQubmJ5dGVzID0g
MHgwMQo+PiBbIDQzMjIuMTI5NDc4XSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuY21kLmJ1c3dp
ZHRoID0gMHgwMQo+PiBbIDQzMjIuMTM0OTAzXSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuY21k
Lm9wY29kZSA9IDB4YzQKPj4gWyA0MzIyLjE0MDE1NF0gc3BpLW5vciBzcGkwLjA6ICoqKioqCj4+
IFsgNDMyMi4xNDM0OTFdIHNwaS1ub3Igc3BpMC4wOiAqKioqKiBvcC5hZGRyLm5ieXRlcyA9IDB4
MDQKPj4gWyA0MzIyLjE0ODgzMV0gc3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmFkZHIuYnVzd2lk
dGggPSAweDAxCj4+IFsgNDMyMi4xNTQzNDFdIHNwaS1ub3Igc3BpMC4wOiAqKioqKiBvcC5hZGRy
LmJ1c3dpZHRoID0gMHgwCj4+IFsgNDMyMi4xNTk3NjFdIHNwaS1ub3Igc3BpMC4wOiAqKioqKgo+
PiBbIDQzMjIuMTYzMDk4XSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuZHVtbXkubmJ5dGVzID0g
MHgwMAo+PiBbIDQzMjIuMTY4NTI0XSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuZHVtbXkuYnVz
d2lkdGggPSAweDAwCj4+IFsgNDMyMi4xNzQxMThdIHNwaS1ub3Igc3BpMC4wOiAqKioqKgo+PiBb
IDQzMjIuMTc3NDM5XSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuZGF0YS5idXN3aWR0aCA9IDB4
MDAKPj4gWyA0MzIyLjE4Mjk0OF0gc3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmRhdGEubmJ5dGVz
ID0gMAo+PiBbIDQ0MzkuOTY2MDYwXSBzcGktbm9yIHNwaTAuMDogKioqKiogbm9yLT5yZWdfcHJv
dG8gPSAweDAwMDEwMTAxCj4+IFsgNDQzOS45NzE5MjBdIHNwaS1ub3Igc3BpMC4wOiAqKioqKgo+
PiBbIDQ0MzkuOTc1MjUyXSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuY21kLm5ieXRlcyA9IDB4
MDEKPj4gWyA0NDM5Ljk4MDUxMV0gc3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmNtZC5idXN3aWR0
aCA9IDB4MDEKPj4gWyA0NDM5Ljk4NTkyOF0gc3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmNtZC5v
cGNvZGUgPSAweGM0Cj4+IFsgNDQzOS45OTExNzRdIHNwaS1ub3Igc3BpMC4wOiAqKioqKgo+PiBb
IDQ0MzkuOTk0NTA0XSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuYWRkci5uYnl0ZXMgPSAweDA0
Cj4+IFsgNDQzOS45OTk4MzRdIHNwaS1ub3Igc3BpMC4wOiAqKioqKiBvcC5hZGRyLmJ1c3dpZHRo
ID0gMHgwMQo+PiBbIDQ0NDAuMDA1MzM1XSBzcGktbm9yIHNwaTAuMDogKioqKiogb3AuYWRkci5i
dXN3aWR0aCA9IDB4NDAwMDAwMAo+PiBbIDQ0NDAuMDExMjcyXSBzcGktbm9yIHNwaTAuMDogKioq
KioKPj4gWyA0NDQwLjAxNDYwNF0gc3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmR1bW15Lm5ieXRl
cyA9IDB4MDAKPj4gWyA0NDQwLjAyMDAxOF0gc3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmR1bW15
LmJ1c3dpZHRoID0gMHgwMAo+PiBbIDQ0NDAuMDI1NjA2XSBzcGktbm9yIHNwaTAuMDogKioqKioK
Pj4gWyA0NDQwLjAyODkzN10gc3BpLW5vciBzcGkwLjA6ICoqKioqIG9wLmRhdGEuYnVzd2lkdGgg
PSAweDAwCj4+IFsgNDQ0MC4wMzQ0MzhdIHNwaS1ub3Igc3BpMC4wOiAqKioqKiBvcC5kYXRhLm5i
eXRlcyA9IDAKPj4gRXJhc2VkIDEzNDIxNzcyOCBieXRlcyBmcm9tIGFkZHJlc3MgMHgwMDAwMDAw
MCBpbiBmbGFzaAo+PiAKPj4gcmVhbMKgwqDCoCAzbTU3LjM4NHMKPj4gdXNlcsKgwqDCoCAwbTAu
MDA1cwo+PiBzeXPCoMKgwqAgM20zNS4yMTFzCj4+IAo+IAo+IFllcCwgaXQncyBzdHJhbmdlLCB3
ZSdsbCBoYXZlIHRvIGNoZWNrIHdoYXQncyBoYXBwZW5pbmcuIEkgZm91bmQgbXkKPiBuMjVxMDAg
Zmxhc2gsIG9uIG15IHNpZGUgYWxsIGl0cyA0IGRpY2UgYXJlIGVyYXNlZCBpbiA1IHNlYy4gIFNG
RFAKPiBkZWZpbmVzIGhvdyBsb25nIHRoZSBlcmFzZSBkaWUgc2hvdWxkIHRha2UsIHNlZSBCRlBU
IGR3b3JkIDExLiBZb3UgY2FuCj4gc3RhcnQgd2l0aCB0aGF0LgoKSGFkIHRoZSBmbGFzaCBzb21l
IGNvbnRlbnRzIG9yIHdhcyBpdCBhbGwtZmY/IE1heWJlIHRoZSBNaWNyb24gZmxhc2ggCndpbGwK
Y2hlY2sgaWYgYWxsIGJ5dGVzIGFyZSBvbmUgYW5kIHdpbGwgc2tpcCB0aGUgZXJhc2UuCgpEaWUv
Q2hpcCBlcmFzZXMgd2lsbCB0YWtlIG11Y2ggbG9uZ2VyIG1vc3Qgb2YgdGhlIHRpbWUgYW5kIGFy
ZSAKY29tcGFyYWJsZQp0byBpbmRpdmlkdWFsIHNlY3RvciBlcmFzZXMgKGFzIEZhYmlvIGFsc28g
Zm91bmQgb3V0KS4gWW91J2xsIHByb2JhYmx5Cmp1c3Qgc2F2ZSB0aGUgb3ZlcmhlYWQgb2YgdGhl
IGluZGl2dWRhbCBjb21tYW5kcy4KCkkndmUgbG9va2VkIGF0IHRoZSBOMjVRMDBBQSBkYXRhc2hl
ZXQgYW5kIHRoZSBlcmFzZSB0aW1lIHRoZXJlIGlzIDE1M3MKKHR5cCkgZm9yICpvbmUqIGRpZS4K
Ci1taWNoYWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
