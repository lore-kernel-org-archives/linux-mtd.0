Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D482CC18E5A
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 10:28:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB7F5208E4
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 10:28:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JADaVZdP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB7F5208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RCGXFjSIkx3TDrJcbheVwk8KjJl1JLLpgbjiDKANng8=; b=JADaVZdPeRiWk3
	KbTJXQK5AvUHHDDEwANCoXfCxCe74eNAenVhRtXRroZng37OevZ4tELzpW5s8VY5FkBxIHxy7z3yv
	sI29kXr3GFLzDOgXAN64tc6nPgjY+PWBuTTqmozUFK55CBbPLftTL+vEP2cTDs6oFq1hieLLYG26j
	gtV1jgvRBz3hoY5MWyrXistP0Z/tQWojsizFmTtZqrV1O0pitTNZXYHIreokzzfd7Ah2B9DLBb8Wy
	0UtR5Sf+5XJQit9OOztx8yK4diz6ebvig4uM7oWusOKw5Xdni8s/xyofb02MOh0TebIEHn5praLY9
	wE9N0QVhDiSiVr3sCmnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBybL-0006eV-RX; Wed, 11 Mar 2020 10:28:35 +0000
Received: from mslow2.mail.gandi.net ([217.70.178.242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBybI-0006e1-2n
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2020 10:28:33 +0000
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 226F53AFF63
 for <linux-mtd@lists.infradead.org>; Wed, 11 Mar 2020 10:13:26 +0000 (UTC)
X-Originating-IP: 90.89.41.158
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id D912D40010;
 Wed, 11 Mar 2020 10:13:13 +0000 (UTC)
Date: Wed, 11 Mar 2020 11:13:12 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@oktetlabs.ru>
Subject: Re: [PATCH 1/2] mtd: spinand: wait for erase completion before
 writing bad block maker
Message-ID: <20200311111312.5c175916@xps13>
In-Reply-To: <20200310203224.410198-1-mikhail.kshevetskiy@oktetlabs.ru>
References: <20200310203224.410198-1-mikhail.kshevetskiy@oktetlabs.ru>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_032832_256316_EAC33420 
X-CRM114-Status: GOOD (  17.79  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlraGFpbCwKCk1pa2hhaWwgS3NoZXZldHNraXkgPG1pa2hhaWwua3NoZXZldHNraXlAb2t0
ZXRsYWJzLnJ1PiB3cm90ZSBvbiBUdWUsIDEwCk1hciAyMDIwIDIzOjMyOjIzICswMzAwOgoKPiBT
UEkgZmxhc2ggd2lsbCBkaXNjYXJkIGFueSB3cml0ZSBvcGVyYXRpb24gd2hpbGUgaXQgaXMgYnVz
eSB3aXRoIGJsb2NrCj4gZXJhc2luZy4gQXMgcmVzdWx0IGJhZCBibG9jayBtYXJrZXIgd2lsbCBu
b3QgYmUgd3JpdGVkIHRvIGEgZmxhc2guCj4gVG8gZml4IGl0IGp1c3Qgd2FpdCBmb3IgY29tcGxl
dGlvbiBvZiBlcmFzZSBvcGVyYXRpb24uCj4gCj4gVGhlIGVyYXNpbmcgY29kZSBpcyBhbG1vc3Qg
dGhlIHNhbWUgYXMgaW4gc3BpbmFuZF9lcmFzZSgpLiBUaGUgb25seQo+IGRpZmZlcmVuY2UgaXM6
IHdlIGlnbm9yZSBFUkFTRV9GQUlMRUQgc3RhdHVzLgo+IAo+IFRoaXMgcGF0Y2ggYWxzbyBpbXBy
b3ZlIGVycm9yIGhhbmRsaW5nIGEgYml0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1pa2hhaWwgS3No
ZXZldHNraXkgPG1pa2hhaWwua3NoZXZldHNraXlAb2t0ZXRsYWJzLnJ1PgoKVGhhbmtzIGEgbG90
IGZvciBzaGFyaW5nIHRoaXMhCgpBY3R1YWxseSBGcmllZGVyIHNlbnQgYSBmaXggZm9yIHRoYXQg
SSBhbHJlYWR5IGFkZGVkIHRvIG5hbmQvbmV4dCwKcGxlYXNlIGhhdmUgYSBsb29rIGF0OgpodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvMjAyMDAyMTgxMDA0MzIuMzI0MzMtMS1mcmll
ZGVyLnNjaHJlbXBmQGtvbnRyb24uZGUvCgpJZiB5b3UgdGhpbmsgSSdtIG1pc3Npbmcgc29tZXRo
aW5nIGVsc2UsIHBsZWFzZSB0ZWxsIG1lIQoKPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9zcGkv
Y29yZS5jIHwgMTAgKysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2Nv
cmUuYyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+IGluZGV4IDg5ZjZiZWVmYjAxYy4u
YmI0ZWFjNDAwYjBmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+
ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+IEBAIC02MTAsNiArNjEwLDcgQEAg
c3RhdGljIGludCBzcGluYW5kX21hcmtiYWQoc3RydWN0IG5hbmRfZGV2aWNlICpuYW5kLCBjb25z
dCBzdHJ1Y3QgbmFuZF9wb3MgKnBvcykKPiAgCQkub29iYnVmLm91dCA9IHNwaW5hbmQtPm9vYmJ1
ZiwKPiAgCX07Cj4gIAlpbnQgcmV0Owo+ICsJdTggc3RhdHVzOwo+ICAKPiAgCS8qIEVyYXNlIGJs
b2NrIGJlZm9yZSBtYXJraW5nIGl0IGJhZC4gKi8KPiAgCXJldCA9IHNwaW5hbmRfc2VsZWN0X3Rh
cmdldChzcGluYW5kLCBwb3MtPnRhcmdldCk7Cj4gQEAgLTYyMCw3ICs2MjEsMTQgQEAgc3RhdGlj
IGludCBzcGluYW5kX21hcmtiYWQoc3RydWN0IG5hbmRfZGV2aWNlICpuYW5kLCBjb25zdCBzdHJ1
Y3QgbmFuZF9wb3MgKnBvcykKPiAgCWlmIChyZXQpCj4gIAkJcmV0dXJuIHJldDsKPiAgCj4gLQlz
cGluYW5kX2VyYXNlX29wKHNwaW5hbmQsIHBvcyk7Cj4gKwlyZXQgPSBzcGluYW5kX2VyYXNlX29w
KHNwaW5hbmQsIHBvcyk7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiByZXQ7Cj4gKwo+ICsJLyog
aWdub3JlIHN0YXR1cyBhcyBlcmFzZSBtYXkgZmFpbCBmb3IgYmFkIGJsb2NrcyAqLwo+ICsJc3Bp
bmFuZF93YWl0KHNwaW5hbmQsICZzdGF0dXMpOwo+ICsJaWYgKHJldCkKPiArCQlyZXR1cm4gcmV0
Owo+ICAKPiAgCW1lbXNldChzcGluYW5kLT5vb2JidWYsIDAsIDIpOwo+ICAJcmV0dXJuIHNwaW5h
bmRfd3JpdGVfcGFnZShzcGluYW5kLCAmcmVxKTsKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
