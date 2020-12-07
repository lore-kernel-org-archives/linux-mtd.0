Return-Path: <SRS0=dr6A=FL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D753DC433FE
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 07:57:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60B6D2220B
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 07:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60B6D2220B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SZhVSNfYTd0r3+yGrIh4CqDRj0m8omxuP6rjuQCP/q8=; b=f5eJOC1n3rYRovyi2emfLiFi3
	QSNmjJjBiHUbTyOQv+vieSNzczu6YeYPKInIfUFXI+wR1POhJeM5/ypmd0PRah0xiybmSoli2iHbF
	prHvBU058G1iZyUAEkxopL1vJZdTJFpUbRB9yRYnfVt74mE1Vdipo06l71t/NDmGu2HPdxTeo5P4e
	aal1z0FCOlgWtYZ84Y9NbC1riiyNxAa68vxZAfG7nWmrZKqX22T3a4IV6V1ovotmRUrWtRIAnH7Ba
	+XwBXano5j44TnNd9OuLHfje+soYFPxSkYmp2ASGESXHl1xfQGDi1kXQDmdFQ80opkRuHQbnRPqW1
	7ToQALNEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmBNX-0007bt-21; Mon, 07 Dec 2020 07:56:15 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmBNU-0007bN-2Z
 for linux-mtd@lists.infradead.org; Mon, 07 Dec 2020 07:56:13 +0000
Received: from xps13 (lfbn-tou-1-1617-103.w109-220.abo.wanadoo.fr
 [109.220.208.103]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id B2731240006;
 Mon,  7 Dec 2020 07:56:05 +0000 (UTC)
Date: Mon, 7 Dec 2020 08:56:04 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Guohua Zhong <zhongguohua1@huawei.com>
Subject: Re: [PATCH v2] phram: Allow the user to set the erase page size.
Message-ID: <20201207085604.57a37f69@xps13>
In-Reply-To: <20201207070715.15016-1-zhongguohua1@huawei.com>
References: <CAFLxGvxSycd=6WE4=XnrXxuF2Bc6A6ULA8GfkT8QvgcX=2Gk8g@mail.gmail.com>
 <20201207070715.15016-1-zhongguohua1@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_025612_215320_750BAB08 
X-CRM114-Status: GOOD (  22.36  )
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
Cc: wangle6@huawei.com, young.liuyang@huawei.com, vigneshr@ti.com,
 richard.weinberger@gmail.com, nixiaoming@huawei.com, joern@lazybastard.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, richard@nod.at,
 patrick@baymotion.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgR3VvaHVhLAoKR3VvaHVhIFpob25nIDx6aG9uZ2d1b2h1YTFAaHVhd2VpLmNvbT4gd3JvdGUg
b24gTW9uLCA3IERlYyAyMDIwCjE1OjA3OjE1ICswODAwOgoKPiBPbiBNb24sIERlYyA3LCAyMDIw
IGF0IDE0OjU2IEFNIEd1b2h1YSBaaG9uZyA8emhvbmdndW9odWExQGh1YXdlaS5jb20+IHdyb3Rl
Ogo+ID4gIAo+ID4+IFBlcm1pdCB0aGUgdXNlciB0byBzcGVjaWZ5IHRoZSBlcmFzZSBwYWdlIHNp
emUgYXMgYSBwYXJhbWV0ZXIuCj4gPj4gVGhpcyBzb2x2ZXMgdHdvIHByb2JsZW1zOiAgCj4gPiAg
Cj4gPj4gLSBwaHJhbSBjYW4gYWNjZXNzIGltYWdlcyBtYWRlIGJ5IG1rZnMuamZmczIuICBta2Zz
LmpmZnMyIHdvbid0Cj4gPj4gY3JlYXRlIGltYWdlcyB3aXRoIGVyYXNlIHNpemVzIGxlc3MgdGhh
biA4S2lCOyBtYW55IGFyY2hpdGVjdHVyZXMKPiA+PiBkZWZpbmUgUEFHRV9TSVpFIGFzIDRLaUIu
ICAKPiA+ICAKPiA+PiAtIEFsbG93cyBtb3JlIGVmZmVjdGl2ZSB1c2Ugb2Ygc21hbGwgY2FwYWNp
dHkgZGV2aWNlcy4gIEpGRlMyCj4gPj4gbmVlZHMgc29tZXdoZXJlIGJldHdlZW4gMiBhbmQgNSBl
bXB0eSBwYWdlcyBmb3IgZ2FyYmFnZSBjb2xsZWN0aW9uOwo+ID4+IGFuZCBmb3IgYW4gTlZSQU0g
cGFydCB3aXRoIG9ubHkgMzJLaUIgb2Ygc3BhY2UsIGEgc21hbGxlciBlcmFzZSBwYWdlCj4gPj4g
YWxsb3dzIG11Y2ggYmV0dGVyIHV0aWxpemF0aW9uIGluIGFwcGxpY2F0aW9ucyB3aGVyZSBnYXJi
YWdlIGNvbGxlY3Rpb24KPiA+PiBpcyBpbXBvcnRhbnQuICAKPiA+ICAKPiA+PiBTaWduZWQtb2Zm
LWJ5OiBQYXRyaWNrIE8nR3JhZHkgPHBhdHJpY2tAYmF5bW90aW9uLmNvbT4KPiA+PiBSZXZpZXdl
ZC1ieTogSm9lcm4gRW5nZWwgPGpvZXJuQGxvZ2ZzLm9yZz4KPiA+PiBMaW5rOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9sa21sL0NBSjdtNU9xWXZfPUpCOU5oSHNxQnNhOFlVMERGUm9QN0MrVzEw
UFkyMndvbkFHSks9QUBtYWlsLmdtYWlsLmNvbS8KPiA+PiBbR3VvaHVhIFpob25nOiBmaXggdG9r
ZW4gYXJyYXkgaW5kZXggb3V0IG9mIGJvdW5kcyBhbmQgdXBkYXRlIHBhdGNoIGZvciBrZXJuZWwg
bWFzdGVyIGJyYW5jaF0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBHdW9odWEgWmhvbmcgPHpob25nZ3Vv
aHVhMUBodWF3ZWkuY29tPgo+ID4+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtw
QGludGVsLmNvbT4gIAo+ID4KPiA+IExvb2tzIGdvb2QgdG8gbWUsIGV4Y2VwdCB0aGUgYXV0aG9y
c2hpcC4KPiA+IElmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIHlvdSB0b29rIHRoaXMgb2xkIHBh
dGNoIGFuZCByZXNlbmQgaXQuCj4gPiBQbGVhc2UgbWFrZSBzdXJlIHRoYXQgdGhlICJGcm9tOiIt
TGluZSBjb250YWlucyB0aGUgb3JpZ2luYWwgYXV0aG9yLgo+ID4gWW91IGNhbiBmaXggdGhpcyB1
cCB1c2luZyBnaXQgY29tbWl0IC0tYW1lbmQgLS1hdXRob3I9Lgo+ID4gVGhlIGdpdCBmb3JtYXQt
cGF0Y2ggd2lsbCBjcmVhdGUgYSBjb3JyZWN0IHBhdGNoLiAgCj4gCj4gU29ycnksIEkgYW0gbm90
IGNsZWFyIHRoaXMgcnVsZSBiZWZvcmUuIEJ1dCBJIGZvdW5kIHRoZSBzYW1lIGlzc3VlIGluZGVw
ZW5kZW50bHkuIEl0IGxvb2tzIGdvb2QgCj4gYWZ0ZXIgY2hhbmdnaW5nIHRoZSBlcmFzZSBzaXpl
IGZvciBwaHJhbSBkcml2ZXIuIFRoZW4gd2hlbiBJIHRyeSB0byBzZW5kIHRoZSBwYXRjaCwgSSBm
b3VuZCB0aGF0IAo+IFBhdHJpY2sgTydHcmFkeSBoYXMgYWxyZWFkeSBzZW5kIGEgcGF0Y2ggd2hp
Y2ggaGFzIG5vdCBiZWVuIG1lcmdlZCBhcyB0aGUgbGluayBiZWxvdwo+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xrbWwvQ0FKN201T3FZdl89SkI5TmhIc3FCc2E4WVUwREZSb1A3QytXMTBQWTIy
d29uQUdKSz1BQG1haWwuZ21haWwuY29tLwo+IAo+IFNvIEkgcmVzZW5kIGEgcGF0Y2ggd2l0aCBz
b21lIGNoYW5nZSBhbmQgZml4IGZvciBtYWlubGluZSBrZXJuZWwgd2l0aCB0aGUgb2xkIHBhdGNo
IGxpbmsgb2YgUGF0cmljayBPJ0dyYWR5Lgo+IAo+IElmIEkgbmVlZCB0byBjaGFuZ2UgdGhlIGF1
dGhvcnNoaXAsIEkgd2lsbCByZXNlbmQgdGhpcyBwYXRjaCBmb3IgVjMgd2l0aCBhdXRob3JzaGlw
IG9mIFBhdHJpY2sgTydHcmFkeS4KClllcyBwbGVhc2UuIEFsc28gcGxlYXNlIGRyb3AgdGhlIHJl
ZmVyZW5jZSB0byBrZXJuZWwgdGVzdCByb2JvdCBhcyB5b3UKYXJlIG5vdCBmaXhpbmcgYW4gaXNz
dWUgaW4gdGhlIGtlcm5lbCB0aGF0IHRoZSByb2JvdCByZXBvcnRlZCAocGVyaGFwcwp5b3UgaGFk
IGEgd2FybmluZyBmcm9tIHRoZSByb2JvdCBhYm91dCB0aGUgcGF0Y2ggaXRzZWxmLCB0aGlzIGlz
CmNhbGxlZCBhIHJldmlldyBhbmQgd2UgdXN1YWxseSBkb24ndCBnZXQgY3JlZGl0ZWQgZm9yIHRo
YXQsIGF0IGxlYXN0Cm5vdCB3aXRoIGEgbWlzbGVhZGluZyByZXBvcnRlZC1ieSB0YWcpLgoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
