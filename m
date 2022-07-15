Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FCCC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 20:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dvXVEZTTktKDT0x/lD2049j517+ybMHZBmSpmAujA8o=; b=QR9Gxpb60UQ4hk
	lrLFan9NFqNxtjAjKJXDJfUw80AJuTec2oEF15B5MwYHRjy522qaCwmaGC6uwY5TWNzaGMnkMhsMT
	7nORnHnd/bU0jiJvz/ce38PTgVsx5aouCpWq7xGAgpC0owvyTDW/J294QuFpb/Vp9ikRL8piCq3WM
	1DD+pTG7lpIcb61TYRyw0Olsc1Sh0ANTcht/gGl1FEiv70Y46BNzUJLhOXpSbhD9zFt9VMZeeMHEv
	L9btEAW3S4HcHrmXlCQStuL5M9pJ9cH/UAFWjnuEkAUoKDhcLnp3YsIEGl8zLm+PifeWmRKg6Y+jz
	8zOjPdhE/Ptym6gvUeUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCRjH-00A5aR-Os; Fri, 15 Jul 2022 20:16:03 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCRjE-00A5Wy-QV
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2022 20:16:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657916160; x=1689452160;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=1nlVhVKZtrdns47gN14LRSO9NKMtthGr23polt2Dpsk=;
  b=NqluxlhVuWfN17EMpqV99JWQ2X5dzV1hxW21V03fPTlJDY3/ihEIBv/r
   ljDrhrX9z5QJEfNh2D1i2s7/5qN03mMvfkE7S2r1vvUWFMEC68NJLtgBy
   T4mNZgu8PHYvBuORN9Fxn/6huX/pykec2DLGZIaaI2KL0I6QVCdGg5vAJ
   w=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Jul 2022 13:15:51 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2022 13:15:51 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 15 Jul 2022 13:15:50 -0700
Received: from [10.110.97.72] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 15 Jul
 2022 13:15:49 -0700
Message-ID: <b42cb229-f241-6e29-a138-29023ce316d9@quicinc.com>
Date: Fri, 15 Jul 2022 13:15:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] mtd: spi-nor: winbond: add support for W25Q512NW-IQ/IN
Content-Language: en-US
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Michael Walle <michael@walle.cc>
CC: <clg@kaod.org>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <p.yadav@ti.com>,
	<quic_ggregory@quicinc.com>, <quic_jiles@quicinc.com>,
	<tudor.ambarus@microchip.com>
References: <20220710145721.1207157-1-quic_jaehyoo@quicinc.com>
 <20220711095042.2095360-1-michael@walle.cc>
 <a42fbef2-3eff-9e88-233e-a805cfbe2376@quicinc.com>
 <4972a85d04e39ebb7b4a5872f6632c45@walle.cc>
 <2260955b-354d-ceda-cadc-49453bfca3e4@quicinc.com>
 <00f0c9d480ef5a414f1c34492661bd9e@walle.cc>
 <63cedfce-34bb-ed63-3871-75a6c3dd5d73@quicinc.com>
 <6be710bb5c1bf0449e54a54b78f6f7a0@walle.cc>
 <47c01d768ea56edc9a2f9d317af7b495@walle.cc>
 <114fcde6-bdf7-68ee-d031-35a916027aee@quicinc.com>
In-Reply-To: <114fcde6-bdf7-68ee-d031-35a916027aee@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_131600_930173_5EF6BDD0 
X-CRM114-Status: GOOD (  17.12  )
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

SGkgTWljaGFlbCwKCk9uIDcvMTQvMjAyMiA3OjMwIEFNLCBKYWUgSHl1biBZb28gd3JvdGU6Cj4g
T24gNy8xNC8yMDIyIDc6MjEgQU0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4+IEFtIDIwMjItMDct
MTQgMTY6MTYsIHNjaHJpZWIgTWljaGFlbCBXYWxsZToKPj4+IEFtIDIwMjItMDctMTQgMTU6NDcs
IHNjaHJpZWIgSmFlIEh5dW4gWW9vOgo+Pj4+IE9uIDcvMTQvMjAyMiAxMjo0MSBBTSwgTWljaGFl
bCBXYWxsZSB3cm90ZToKPj4+Pj4gV2hhdCBkb2VzICJkb2Vzbid0IGJvb3QgYXQgYWxsIiBtZWFu
PyBBcmUgdGhlcmUgYW55IGtlcm5lbCBzdGFydHVwCj4+Pj4+IG1lc3NhZ2VzPwo+Pj4+Cj4+Pj4g
SSdtIHNoYXJpbmcgdGhlIGVycm9yIG1lc3NhZ2VzIGJlbG93Lgo+Pj4KPj4+IFRoYW5rcy4KPj4+
Cj4+Pj4gW8KgwqDCoCAwLjc0ODU5NF0gc3BpLW5vciBzcGkwLjA6IHcyNXE1MTJud3EgKDY1NTM2
IEtieXRlcykKPj4+PiBbwqDCoMKgIDAuODY1MjE2XSBzcGktYXNwZWVkLXNtYyAxZTYyMDAwMC5z
cGk6IENFMCByZWFkIGJ1c3dpZHRoOjQgCj4+Pj4gWzB4NDA2YzA3NDFdCj4+Pj4gW8KgwqDCoCAw
Ljg3MjgzM10gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4+Pj4gW8KgwqDC
oCAwLjg3Nzk4NF0gV0FSTklORzogQ1BVOiAxIFBJRDogMSBhdCBkcml2ZXJzL210ZC9tdGRjb3Jl
LmM6NTgzCj4+Pj4gYWRkX210ZF9kZXZpY2UrMHgyOGMvMHg1M2MKPj4+PiBbwqDCoMKgIDAuODg3
MjM3XSBDUFU6IDEgUElEOiAxIENvbW06IHN3YXBwZXIvMCBOb3QgdGFpbnRlZAo+Pj4+IDUuMTUu
NDMtQVVUT0lOQy1kaXJ0eS0yMzgwMWE2ICMxCj4+Pgo+Pj4gQ291bGQgeW91IHBsZWFzZSB0cnkg
aXQgb24gdGhlIGxhdGVzdCAodmFuaWxsYSkgbGludXgtbmV4dD8KPj4KPj4gb3Igc3BpLW5vci9u
ZXh0IFsxXSBhcyB0aGVyZSBhcmUgcXVpdGUgYSBsb3Qgb2YgY2hhbmdlcy4gVGhlCj4+IHBhdGNo
ZXMgc2hhbGwgYmUgYmFzZWQgb24gdGhhdC4KPiAKPiBPa2F5LiBMZXQgbWUgdHJ5IHRoYXQuIEkg
dGVzdGVkIGl0IHVzaW5nIDUuMTUuNDMgd2l0aCBiYWNrLXBvcnRlZAo+IHNwaS1ub3IgcGF0Y2hl
cyBmcm9tIHRoZSBsYXRlc3QuIEknbGwgYmFjay1wb3J0IG1vcmUgY2hhbmdlcyBmcm9tCj4gdGhl
IHNwaS1ub3IvbmV4dCBhbmQgd2lsbCB0ZXN0IHRoZSBJTkZPKDB4ZWY2MDIwLCAwLCAwLCAwKSBz
ZXR0aW5nCj4gYWdhaW4uCgpJIHRlc3RlZCB0aGUgc2V0dGluZyBhZ2FpbiBhZnRlciBjaGVycnkg
cGlja2luZyBhbGwgU1BJIHJlbGF0aW5nIGNoYW5nZXMKZnJvbSB0aGUgJ2Zvci1uZXh0JyBicmFu
Y2ggb2YKZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Jyb29u
aWUvc3BpIHJlcG9zaXRvcnkuCgpObyBsdWNrISBJdCdzIHN0aWxsIG1ha2luZyB0aGUgc2FtZSB3
YXJuaW5nIGR1bXAgYXQgJ2FkZF9tdGRfZGV2aWNlJwpzaW5jZSAnbXRkLT5lcmFzZXNpemUnIGlz
IGNoZWNrZWQgYXMgMC4KCkkgdHJhY2VkIGl0IGZ1cnRoZXIgdG8gY2hlY2sgaWYgdGhlIGVyYXNl
c2l6ZSBpcyBwcm9wZXJseSBwYXJzZWQgZnJvbQp0aGUgc2ZkcCBhbmQgY2hlY2tlZCB0aGF0IGVy
YXNlIG1hcCBzZWVtcyBwYXJzZWQgYW5kIGluaXRpYWxpemVkCmNvcnJlY3RseSBpbiAnc3BpX25v
cl9wYXJzZV9iZnB0JyBidXQgcHJvYmxlbSBpcywgYSB0YXJnZXQKbXRkLT5lcmFzZXNpemUgaXMg
bm90IHByb3Blcmx5IHNlbGVjdGVkIGluICdzcGlfbm9yX3NlbGVjdF9lcmFzZScgc2luY2UKdGhl
ICd3YW50ZWRfc2l6ZScgdmFyaWFibGUgaXMgaW5pdGlhbGl6ZWQgYXMgc2VjdG9yIHNpemUgb2Yg
aW5mbyB0YWJsZQpzbyBhIHNlbGVjdGVkIHRhcmdldCBtdGQtPmVyYXNlc2l6ZSBpcyBhbHNvIDAg
c28gbG9va3MgbGlrZSBpdCdzIHRoZQpyZWFzb24gd2h5IGl0IGNhbid0IGluaXRpYWxpemUgbXRk
IGRldmljZSBpZiB3ZSB1c2UKSU5GTygweGVmNjAyMCwgMCwgMCwgMCkuCgpBbHNvLCBjaGVja2Vk
IHRoYXQgdGhlIG10ZC0+ZXJhc2VzaXplIGlzIHNldCB0byA0MDk2IGlmIEkgZW5hYmxlCkNPTkZJ
R19NVERfU1BJX05PUl9VU0VfNEtfU0VDVE9SUyBzbyB0aGUgU1BJIGZsYXNoIGNhbiBiZSBpbml0
aWFsaXplZCAKd2l0aCB0aGUgSU5GTygweGVmNjAyMCwgMCwgMCwgMCkgc2V0dGluZyBidXQsIGl0
IHNob3VsZCBjb3ZlciBldmVuIHdoZW4KdGhlIGNvbmZpZ3VyYXRpb24gaXMgbm90IGVuYWJsZWQu
IEkgdGhpbmssIHRoaXMgcGF0Y2ggc2hvdWxkIGdvIGFzIGl0CmlzLiBUaGUgZXJhc2VzaXplIHNl
bGVjdGluZyBpc3N1ZSBjb3VsZCBiZSBmaXhlZCB1c2luZyBhIHNlcGFyYXRlCnBhdGNoLgoKQXJl
IHlvdSBzdGlsbCBzdXJlIHRoYXQgdGhlIElORk8oMHhlZjYwMjAsIDAsIDAsIDApIHdvcmtzIGlu
IHRoZQpsYXRlc3Qgc3BpLW5leHQ/CgpUaGFua3MsCgpKYWUKCj4gLUphZQo+IAo+PiAtbWljaGFl
bAo+Pgo+PiBbMV0gCj4+IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9tdGQvbGludXguZ2l0I3NwaS1ub3IvbmV4dAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
