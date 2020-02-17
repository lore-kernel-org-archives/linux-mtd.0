Return-Path: <SRS0=B4Yk=4F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12698C7619F
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 09:02:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D73FA20718
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 09:02:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HjIa8YtH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hNx9JkNR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D73FA20718
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zueb4Lu3WOPxE7Yv5EFgJhuidRVxPvgeCMCoWmWGiP4=; b=HjIa8YtHgkm0Y6
	sUJz7XBkSGhUMnukvet6Wnylx6/MqN1zrJFkayI0Y2rHtnJLaZFJFNI3DP1M5HyFRnyBgw8pwuZ2Q
	Xk2B2gTHnAIKl8Y4QlGuKseycRrwscJxQIZAVBj7iqnNCHJkxBbyMw31urV9uC+pLc4OBkYPBTqdp
	iWD6u209UrMIeEyt4ucqYJyLnveXxbCweFiF+GKuPlv037r47hWw0fOFjmDZ2cemY1nvY4TyUTj0Z
	K0SPDbDe9ySHINQoaaVfXZ7ZLk9inIL7Ad+sMjsGdwYYbfTTMti9OGE1rpN5m6xk0QooZWYgA3JqJ
	yKoVEbO0O20pP1/j1U8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3cIH-0001gw-Sd; Mon, 17 Feb 2020 09:02:21 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3cIG-0001gU-P1
 for linux-mtd@bombadil.infradead.org; Mon, 17 Feb 2020 09:02:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=3UgUKiPTRd4V9H9AvixtCymlbh8+BNYosqy5uDXWIAM=; b=hNx9JkNRwNyPzOal4K0XB3xfNz
 tavH3A2isZ3UiP1md9dJRBuVFMqa3LOQ14TYC4oQa9nVJzB2qc+QcsWtfIfkejEiLZBpoIMev+cem
 exUD/MNX59ij71WHmrz87Fc3+wtAo3mriwXrg7PnXEpKSsnwWMTAG6YG2KVDPTwuLbqe1qjE5ikST
 Lgcdps1zht6MrwLGVnWFBOvuC48ni9N4WtZQNramOoq5w181nNHTPROZvv4vouByMxVCLihAuLROF
 JTsVpBlO6nx5UmyByC9kURm0LuqsFQsLNey8E8objJXFGO8aRuQdaX1UcfNEtUTCyMlg8al/neo08
 iWgiFEJw==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3cIC-0007On-Tc
 for linux-mtd@lists.infradead.org; Mon, 17 Feb 2020 09:02:18 +0000
X-Originating-IP: 90.76.211.102
Received: from xps13 (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr
 [90.76.211.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id E71E8FF80E;
 Mon, 17 Feb 2020 09:01:24 +0000 (UTC)
Date: Mon, 17 Feb 2020 10:01:24 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH v2 1/4] mtd: rawnand: Add support manufacturer specific
 lock/unlock operatoin
Message-ID: <20200217100124.6ff71191@xps13>
In-Reply-To: <OF505D0437.0130F15A-ON48258511.002C7F75-48258511.002D4341@mxic.com.tw>
References: <1572256527-5074-1-git-send-email-masonccyang@mxic.com.tw>
 <1572256527-5074-2-git-send-email-masonccyang@mxic.com.tw>
 <20200109203055.2370a358@collabora.com>
 <OF505D0437.0130F15A-ON48258511.002C7F75-48258511.002D4341@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: vigneshr@ti.com, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 richard@nod.at, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgptYXNvbmNjeWFuZ0BteGljLmNvbS50dyB3cm90ZSBvbiBNb24sIDE3IEZlYiAy
MDIwIDE2OjE0OjIzICswODAwOgoKPiBIaSBCb3JpcywKPiAKPiA+ICAgCj4gPiA+ICAvKiBTZXQg
ZGVmYXVsdCBmdW5jdGlvbnMgKi8KPiA+ID4gIHN0YXRpYyB2b2lkIG5hbmRfc2V0X2RlZmF1bHRz
KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4gPiA+ICB7Cj4gPiA+IEBAIC01NzgyLDggKzU4MTAs
OCBAQCBzdGF0aWMgaW50IG5hbmRfc2Nhbl90YWlsKHN0cnVjdCBuYW5kX2NoaXAgICAKPiAqY2hp
cCkKPiA+ID4gICAgIG10ZC0+X3JlYWRfb29iID0gbmFuZF9yZWFkX29vYjsKPiA+ID4gICAgIG10
ZC0+X3dyaXRlX29vYiA9IG5hbmRfd3JpdGVfb29iOwo+ID4gPiAgICAgbXRkLT5fc3luYyA9IG5h
bmRfc3luYzsKPiA+ID4gLSAgIG10ZC0+X2xvY2sgPSBOVUxMOwo+ID4gPiAtICAgbXRkLT5fdW5s
b2NrID0gTlVMTDsKPiA+ID4gKyAgIG10ZC0+X2xvY2sgPSBuYW5kX2xvY2s7Cj4gPiA+ICsgICBt
dGQtPl91bmxvY2sgPSBuYW5kX3VubG9jazsKPiA+ID4gICAgIG10ZC0+X3N1c3BlbmQgPSBuYW5k
X3N1c3BlbmQ7Cj4gPiA+ICAgICBtdGQtPl9yZXN1bWUgPSBuYW5kX3Jlc3VtZTsKPiA+ID4gICAg
IG10ZC0+X3JlYm9vdCA9IG5hbmRfc2h1dGRvd247Cj4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L210ZC9yYXduYW5kLmggYi9pbmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmgKPiA+ID4g
aW5kZXggNGFiOWJjYy4uMjQzMGVjZCAxMDA2NDQKPiA+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9t
dGQvcmF3bmFuZC5oCj4gPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvbXRkL3Jhd25hbmQuaAo+ID4g
PiBAQCAtMTEzNiw2ICsxMTM2LDkgQEAgc3RydWN0IG5hbmRfY2hpcCB7Cj4gPiA+ICAgICAgICBj
b25zdCBzdHJ1Y3QgbmFuZF9tYW51ZmFjdHVyZXIgKmRlc2M7Cj4gPiA+ICAgICAgICB2b2lkICpw
cml2Owo+ID4gPiAgICAgfSBtYW51ZmFjdHVyZXI7Cj4gPiA+ICsKPiA+ID4gKyAgIGludCAoKl9s
b2NrKShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBsb2ZmX3Qgb2ZzLCB1aW50NjRfdCBsZW4pOwo+
ID4gPiArICAgaW50ICgqX3VubG9jaykoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgbG9mZl90IG9m
cywgdWludDY0X3QgbGVuKTsgIAo+ID4gCj4gPiBQbGVhc2UgZHJvcCB0aGlzIF8gcHJlZml4LiAg
Cj4gCj4gRHJvcCBfIHByZWZpeCBvZiBfbG9jayB3aWxsIGdldCBjb21waWxlIGVycm9yIGR1ZSB0
byB0aGVyZSBpcyBhbHJlYWR5IAo+IGRlZmluZWQgInN0cnVjdCBtdXRleCBsb2NrIiBpbiBzdHJ1
Y3QgbmFuZF9jaGlwLgoKUmlnaHQhCgo+IAo+IFdoYXQgYWJvdXQga2VlcCB0aGlzIF8gcHJlZml4
IG9yIHBhdGNoIGl0IHRvIGJsb2NrbG9jay9ibG9ja3VubG9jaywKPiBpLmUuLAo+IGludCAoKmJs
b2NrbG9jaykoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgbG9mZl90IG9mcywgdWludDY0X3QgbGVu
KTsKPiBpbnQgKCpibG9ja3VubG9jaykoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgbG9mZl90IG9m
cywgdWludDY0X3QgbGVuKTsKCldoYXQgYWJvdXQgbG9ja19hcmVhKCkgdW5sb2NrX2FyZWEoKSA/
IFNlZW1zIG1vcmUgYWNjdXJhdGUgdG8gbWUsIHRlbGwKbWUgaWYgSSdtIHdyb25nLgoKPiAgCj4g
Cj4gdGhhbmtzIGZvciB5b3VyIHRpbWUgJiBjb21tZW50cy4KPiBNYXNvbgoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
