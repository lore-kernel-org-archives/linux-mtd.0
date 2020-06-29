Return-Path: <SRS0=cYNo=AK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79EC3C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 07:06:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46FF92313F
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 07:06:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="inE7hB32";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="A0yzspjY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46FF92313F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=br4cZj6SlpOV9erIoDdRoR4fv3SZmtBBLIE1OPfcGYs=; b=inE7hB32TYW6ynUHlTGIxBr89
	d+sWOuCUQNPCD+NHeVoEDQOosJv5kFV5Oix/S5CfVUWmBSCaLhhydyO74yeaf5ZBK0xfLUiSBpQZx
	WDAuUaqTR+DAhjM5dGQ+1Px85Ol4AtBsgKLTWeq8Y8FCx4ygQUmiOTE20jPewpH3fmuGLvv41RUxl
	/6WEWGJDOHc05ujPQHlOxy4B15l16HDI31AxAO5p8wFXUF+oTO8B5GafoYXGmySjYlHHWdSwuwfy5
	eYtQQPO8DbL8DeLb0yaZoLM/uweNZxkTfThKYV9NzWV4cj5SuwfdYVw4Sz7Zs+R5THdpIofOr/MrW
	NArXFderw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpnqu-0006p0-MT; Mon, 29 Jun 2020 07:05:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpnqt-0006op-8G
 for linux-mtd@merlin.infradead.org; Mon, 29 Jun 2020 07:05:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=UBHchwNyCQ2SCOkSMAhRMD1kQM3wAsIyG/XGL8kiKqg=; b=A0yzspjYUQG89aGI2ZLecKcnji
 8DyEcpYPEMA9jAyz4s/Mbm6rClCEhMymIps8HH91etGTwBCk0yJFdEWZNR8ce2IQmKI01tXewUkAl
 pRNZ1vjaGrFpi2IEaZQiMJ0424RaJbskKrLJ3At8TZCaHAOSyC4yNRK1n+NQTDwja1mh+r1JUrQuP
 ejhklipNq+Wfzk0/ge/dboNN5ewovJHe4TeGTLTpM+1AV1plxWG2bwOoZ9S82L+J4UQeHFZdgtiZ3
 kGmWaH5F82g0OyIoF1rhwSxDr34x6V2sH1pBFY2kaFYJg45maOEg9u1Sr5wgu2i3WSDhpuZmoYEJ1
 pbgU/hZg==;
Received: from lithops.sigma-star.at ([195.201.40.130])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpnqp-0004XW-KI
 for linux-mtd@lists.infradead.org; Mon, 29 Jun 2020 07:05:14 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id C8863607400F;
 Mon, 29 Jun 2020 09:04:50 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 0T0EK48wkkFx; Mon, 29 Jun 2020 09:04:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id D51A76074029;
 Mon, 29 Jun 2020 09:04:47 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id AFSflEHkQCn5; Mon, 29 Jun 2020 09:04:47 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id B4842607400F;
 Mon, 29 Jun 2020 09:04:47 +0200 (CEST)
Date: Mon, 29 Jun 2020 09:04:47 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Alexander Dahl <ada@thorsis.com>
Message-ID: <1067478399.71066.1593414287623.JavaMail.zimbra@nod.at>
In-Reply-To: <2117676.Cu8v49ySxQ@ada>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
 <1764637498.61502.1593158954662.JavaMail.zimbra@nod.at>
 <2117676.Cu8v49ySxQ@ada>
Subject: Re: [PATCH 0/1] ubifs: support authentication without hmac
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: support authentication without hmac
Thread-Index: AwFAjN00f5b1/bhl2Un0nqbaF1yTZQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200629_080511_957744_1416AD21 
X-CRM114-Status: GOOD (  10.79  )
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Torben Hohn <torben.hohn@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QWxleCwKCi0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiBWb246ICJBbGV4YW5kZXIg
RGFobCIgPGFkYUB0aG9yc2lzLmNvbT4KPiBBbjogImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0
cy5pbmZyYWRlYWQub3JnPiwgIlNhc2NoYSBIYXVlciIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+
Cj4gQ0M6ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAiVG9yYmVuIEhvaG4iIDx0b3JiZW4u
aG9obkBsaW51dHJvbml4LmRlPgo+IEdlc2VuZGV0OiBNb250YWcsIDI5LiBKdW5pIDIwMjAgMDg6
NDY6MTAKPiBCZXRyZWZmOiBSZTogW1BBVENIIDAvMV0gdWJpZnM6IHN1cHBvcnQgYXV0aGVudGlj
YXRpb24gd2l0aG91dCBobWFjCgo+IEhlbGxvIFJpY2hhcmQsCj4gCj4gQW0gRnJlaXRhZywgMjYu
IEp1bmkgMjAyMCwgMTA6MDk6MTQgQ0VTVCBzY2hyaWViIFJpY2hhcmQgV2VpbmJlcmdlcjoKPj4g
VGhhdCBzYWlkLCBJJ20gbm90IHJlYWxseSBhIGZhbiBvZiByZWFkaW5nIGZpbGVzIGZyb20gVUJJ
RlMgaW4gdS1ib290Lgo+PiBXZSBoYXZlIFVCSSBzdGF0aWMgdm9sdW1lcyBmb3IgdGhhdC4uLgo+
PiBNYXliZSB5b3UgY2FuIGdpdmUgdGhpcyBhIHRyeSBhbmQgdm9pZCBzb21lIGNvbXBsZXhpdHkg
aW4gdGhlIGJvb3Rsb2FkZXIuCj4gCj4gU3VycHJpc2VkIHRvIGhlYXIgdGhhdC4gSSBzYXcgc29t
ZSBib2FyZHMgbGF0ZWx5IGRvaW5nIGV4YWN0bHkgdGhhdC4gVGhpbmdzCj4gbGlrZSBrZXJuZWwg
aW1hZ2UgYXJlIGNvcGllZCBpbiBMaW51eCB0byBlLmcuIC9ib290IGFuZCBVLUJvb3QganVzdCBw
aWNrcyBpdAo+IHVwIGZyb20gdGhlcmUuCgpXZWxsLCBub3QgZXZlcnlvbmUgaXMgdXNpbmcgVS1C
b290LiA7LSkKIAo+IEkgdHJpZWQgdG8gZmluZCBvdXQgbW9yZSBhYm91dCB1c2luZyBVQkkgc3Rh
dGljIHZvbHVtZXMgaW4gZ2VuZXJhbCBhbmQgZm9yCj4gdGhhdCB1c2VjYXNlLCBidXQgbmVpdGhl
ciBodHRwOi8vbGludXgtbXRkLmluZnJhZGVhZC5vcmcvZG9jL3ViaS5odG1sIG5vcgo+IGh0dHA6
Ly9saW51eC1tdGQuaW5mcmFkZWFkLm9yZy9mYXEvdWJpLmh0bWwgcG9pbnQgbWUgaW4gYSBkaXJl
Y3Rpb24gd2hlcmUgdG8KPiBmaW5kIHJlYWwgd29ybGQgZXhhbXBsZXMgdG8gbG9vayBhdC4gQXJl
IHRoZXJlIGFueSBib2FyZHMgaW4gdGhlIHdpbGQgdXNpbmcKPiB0aGlzPyBNYXliZSB3aXRoIGRl
ZmNvbmZpZ3MgaW4gVS1Cb290IGFscmVhZHk/CgpVLUJvb3QgY2hvb3NlIHRoZSBVQklGUyB3YXkg
QUZBSUNULgoKQnV0IGlmIHlvdSBoYXZlIHlvdXIgb3duIG1pbmltYWwgbG9hZGVyIHlvdSBjYW4g
cmVhZCBmcm9tIGFuIFVCSSBzdGF0aWMgdm9sdW1lIHdpdGgKYSBmZXcgbGluZXMgb2YgQyAofjIw
MCBMb0MpLiBUaGlzIGlzIHdoYXQgSSBzZWUvdXNlIG1vc3Qgb2YgdGhlIHRpbWUuClVzaW5nIHN0
YXRpYyB2b2x1bWVzIGluIFUtQm9vdCBpcyBhbHNvIHBvc3NpYmxlLCBJSVJDIGp1c3QgdXNlICJ1
YmkgcmVhZCIuCgpGcm9tIGh0dHA6Ly93d3cubGludXgtbXRkLmluZnJhZGVhZC5vcmcvZG9jL3Vi
aS5odG1sI0xfb3ZlcnZpZXc6CiIiIgpUaGVyZSBhcmUgMiB0eXBlcyBvZiBVQkkgdm9sdW1lczog
ZHluYW1pYyB2b2x1bWVzIGFuZCBzdGF0aWMgdm9sdW1lcy4gU3RhdGljIHZvbHVtZXMgYXJlIHJl
YWQtb25seSBhbmQgdGhlaXIgY29udGVudHMgYXJlIHByb3RlY3RlZCBieSBDUkMtMzIgY2hlY2tz
dW1zLCB3aGlsZSBkeW5hbWljIHZvbHVtZXMgYXJlIHJlYWQtd3JpdGUgYW5kIHRoZSB1cHBlciBs
YXllcnMgKGUuZy4sIGEgZmlsZS1zeXN0ZW0pIGFyZSByZXNwb25zaWJsZSBmb3IgZW5zdXJpbmcg
ZGF0YSBpbnRlZ3JpdHkuCgpTdGF0aWMgdm9sdW1lcyBhcmUgdHlwaWNhbGx5IHVzZWQgZm9yIHRo
ZSBrZXJuZWwsIGluaXRyYW1mcywgYW5kIGR0Yi4gTGFyZ2VyIHN0YXRpYyB2b2x1bWVzIG1heSBp
bmN1ciBhIHNpZ25pZmljYW50IHBlbmFsdHkgd2hlbiBvcGVuaW5nLCBhcyB0aGUgQ1JDLTMyIG5l
ZWRzIHRvIGJlIGNhbGN1bGF0ZWQgYXQgdGhpcyB0aW1lLiBJZiB5b3UgYXJlIGxvb2tpbmcgdG8g
dXNlIHN0YXRpYyB2b2x1bWVzIGZvciBhbnl0aGluZyBiZXNpZGVzIHRoZSBrZXJuZWwsIGluaXRy
YW1mcywgb3IgZHRiIHlvdSBhcmUgbGlrZWx5IGRvaW5nIHNvbWV0aGluZyB3cm9uZyBhbmQgd291
bGQgYmUgYmV0dGVyIG9mZiB1c2luZyBhIGR5bmFtaWMgdm9sdW1lIGluc3RlYWQuCiIiIgoKVGhh
bmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
