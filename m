Return-Path: <SRS0=ONRD=TU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD973C04AAC
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 17:32:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E5AB208C3
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 17:32:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tYaP7jfg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uCo/hGgL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E5AB208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6cPx1VLh361y6n718WpNcAfgyVtrIHmW7New40VysJw=; b=tYaP7jfgJ8TIjc
	0A6X/gh1gAgsTN89tsSiA/p3oz77+U7BpgGLcGmIim7lx0QT0hamwG/GRjWnuQactv+uGQpsrRtxH
	XJJ9InkxEe8uKS8IfSH952hm4mnC8T1idDENEQduEyRL/OQpDdvMB/r+AFW2H0qypPT7d7wTN6Ooo
	EeMY/sSbhRYsbWvac1YzvGOROhOnVEx1+94ZV4/6fhwMADQQYHhk6DMBjcueExVaxv8uqwPvowl1q
	F8USTiYO//EsJGLIUCaXBfIgEP4LS7prQrs/+EbkRu9XRaN1zG8pyKmqZ5tdQ3/cMDPDUS3Xq+eaX
	0lQJOJxz0tnc1WKvsmnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSm8w-0005Z3-R0; Mon, 20 May 2019 17:32:10 +0000
Received: from mail-it1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSm8q-0005Ye-PM
 for linux-mtd@lists.infradead.org; Mon, 20 May 2019 17:32:09 +0000
Received: by mail-it1-x143.google.com with SMTP id e184so312713ite.1
 for <linux-mtd@lists.infradead.org>; Mon, 20 May 2019 10:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xcLMbjckTZ6l/D4OPRbALZW9nrjKg92nkD4l8fduoc8=;
 b=uCo/hGgLQmhpZOrTu1shzmnvLf9unrWslOUc0OcezlzbX99EGVTuRJzR/Iw7BhYNTU
 ZyPo93KCrwffiZW2yUgcZ+axPm2p9kG+ZUIq/D+l7fEUodflNoSPliJsuaruEQABP2Jf
 zPrV6Ay+NjfwTljpnHMlgWSIdTgnlxA3U+/bsxgmEtaoMwp7t3031e3uJvm5pOBrA+TL
 kvvWYqUrNPjj0ERFdUpLVmv0l27hV0RRb+Z6fn6i2DrgUOApSvLm4GR37IV6AecBIcT2
 ThT6lWOIVV3NlUOHCWzjD0OWyeQGr1OpWaDJlyvPFsLulOdIj9YgEvIAYJBGTDAkep53
 YZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xcLMbjckTZ6l/D4OPRbALZW9nrjKg92nkD4l8fduoc8=;
 b=P9XlpMIFR/uxXlkpvTUrsqvx0PbmnDkNPtSdnBBJEn/hqZ1lQIkRZT493y9tmU1JAW
 Q5ISMbWo3/iUz+FGLGVmHdM/9Aw+XkVD4r6S8Xd1pndJ+3xaQGQsuzvg/60EyWnwmcHZ
 nBNIZRnpi7+040vxQ5lC3i9aRnLAbiWmjx2i6bHyJ0a8rHxZGuc1xmsX5eTjvZxm6yP5
 TH8hN4ngh8qoAMU0UlWJRpAQkPjTZJ2DVg9YmL+DtSslqbtoBX9Rxgd1v8GXEnYxxYpj
 9vQxugYYzXIqMWaG0sAE8qYT/J2lX59X3AfhlgHgkKAoYPPc+2YvfanL3vmP1/5As49Z
 30NQ==
X-Gm-Message-State: APjAAAWcy2kx4+JqCQGw7Nj5grRUkSh5FEUGjpvOpCe8uSPe/hZ11qLK
 Q5Fv/kMyd5CsLafwdO5OrtGhsLb4MTkSMv5EEAE=
X-Google-Smtp-Source: APXvYqxMSSP1oqTIxbcg+oz1+JAy+IJiK1E3y1OXF4FdCTX/NR9OwpR5L0j8G7kuvH+21np1Zkbotqy/mL1jlYbEixw=
X-Received: by 2002:a24:6294:: with SMTP id d142mr184616itc.102.1558373523378; 
 Mon, 20 May 2019 10:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <1558117914-35807-1-git-send-email-kdasu.kdev@gmail.com>
 <1558117914-35807-2-git-send-email-kdasu.kdev@gmail.com>
 <20190520144436.67e42f00@xps13>
In-Reply-To: <20190520144436.67e42f00@xps13>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Mon, 20 May 2019 13:31:52 -0400
Message-ID: <CAC=U0a0bZHgM2yQzz5SupRNWcBg7rpqpGh_o9cvSQNNKsSp9Cg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: nand: raw: brcmnand: fallback to detected
 ecc-strength, ecc-step-size
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_103204_938308_B8EEE39F 
X-CRM114-Status: GOOD (  23.49  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

V2lsbCBtYWtlIHRoZSBjaGFuZ2VzIGFuZCBzZW5kIGEgVjIgcGF0Y2guCgpPbiBNb24sIE1heSAy
MCwgMjAxOSBhdCA4OjQ0IEFNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+IHdyb3RlOgo+Cj4gSGkgS2FtYWwsCj4KPiBLYW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdtYWls
LmNvbT4gd3JvdGUgb24gRnJpLCAxNyBNYXkgMjAxOSAxNDoyOTo1NQo+IC0wNDAwOgo+Cj4gPiBU
aGlzIGNoYW5nZSBzdXBwb3J0cyBuYW5kLWVjYy1zdGVwLXNpemUgYW5kIG5hbmQtZWNjLXN0cmVu
Z2h0IGZpZWxkcyBpbgo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cmVuZ3RoCj4KPiA+IGJyY21uYW5kIGR0IG5vZGUgdG8gYmUgIG9w
dGlvbmFsLgo+Cj4gICAgICAgICAgICBEVCAgICAgICAgICAgIF4gZXh0cmEgc3BhY2UKPgo+ID4g
c2VlOiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2JyY20sYnJjbW5hbmQu
dHh0Cj4gPgo+ID4gSWYgYm90aCBuYW5kLWVjYy1zdHJlbmd0aCBhbmQgbmFuZC1lY2Mtc3RlcC1z
aXplIGFyZSBub3Qgc3BlY2lmaWVkIGluCj4gPiBkZXZpY2UgdHJlZSBub2RlIGZvciBOQU5ELCBu
YW5kX2Jhc2UgZHJpdmVyIGRvZXMgZGV0ZWN0IG9uZmkgZXh0IGVjYwo+Cj4gcy9uYW5kX2Jhc2Ug
ZHJpdmVyL3RoZSByYXcgTkFORCBsYXllci8KPiBzL29uZmkvT05GSS8KPiBzL2VjYy9FQ0MvCj4K
PiBXaGF0IGlzICJleHQiPyBQbGVhc2UgdXNlIHBsYWluIEVuZ2xpc2ggaGVyZS4KPgo+ID4gaW5m
byBmcm9tIE9ORkkgZXh0ZW5kZWQgcGFyYW1ldGVyIHBhZ2UgZm9yIHBhcnRzIHVzaW5nIE9ORkkg
Pj0gMi4xLiBJbgo+Cj4gcy9pbmZvL2luZm9ybWF0aW9uLwo+Cj4gPiBjYXNlIG9mIG5vbi1vbmZp
IE5BTkQgdGhlcmUgY291bGQgYmUgYSBuYW5kX2lkIHRhYmxlIGVudHJ5IHdpdGggdGhlIGVjYwo+
Cj4gcy9lY2MvRUNDLwo+Cj4gPiBpbmZvLiBJZiB0aGVyZSBpcyBhIHZhbGlkICBkZXZpY2UgdHJl
ZSBlbnRyeSBmb3IgbmFuZC1lY2Mtc3RyZW5ndGggYW5kCj4gPiBuYW5kLWVjYy1zdGVwLXNpemUg
ZmllbGRzIGl0IHN0aWxsIHNoYWxsIG92ZXJyaWRlIHRoZSBkZXRlY3RlZCB2YWx1ZXMuCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogS2FtYWwgRGFzdSA8a2Rhc3Uua2RldkBnbWFpbC5jb20+Cj4gPiAt
LS0KPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIHwgMTAgKysr
KysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gPiBpbmRleCBjZTBiOGZmLi5l
OTY3YjMwIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJj
bW5hbmQuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQu
Ywo+ID4gQEAgLTIxNDQsNiArMjE0NCwxNiBAQCBzdGF0aWMgaW50IGJyY21uYW5kX3NldHVwX2Rl
dihzdHJ1Y3QgYnJjbW5hbmRfaG9zdCAqaG9zdCkKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7Cj4gPiAgICAgICB9Cj4gPgo+ID4gKyAgICAgaWYgKCEoY2hpcC0+ZWNjLnNpemUgPiAw
ICYmIGNoaXAtPmVjYy5zdHJlbmd0aCA+IDApICYmCj4KPiBJcyB0aGUgY2FzZSB3aGVyZSBvbmx5
IHNpemUgT1Igc3RyZW5ndGggaXMgdmFsaWQgaGFuZGxlZD8KCkJvdGggc3RyZW5ndGggYW5kIG5l
ZWQgdG8gYmUgdmFsaWQsIGVsc2UgdGhlIGRyaXZlciB3aWxsIGJlaGF2ZSBsaWtlCmJlZm9yZSBh
bmQgd2lsbCBmYWlsIHRoZSBwcm9iZS4KCj4KPiA+ICsgICAgICAgICAoY2hpcC0+YmFzZS5lY2Ny
ZXEuc3RyZW5ndGggPiAwICYmCj4gPiArICAgICAgICAgIGNoaXAtPmJhc2UuZWNjcmVxLnN0ZXBf
c2l6ZSA+IDApKSB7Cj4gPiArICAgICAgICAgICAgIC8qIHVzZSBkZXRlY3RlZCBlY2MgcGFyYW1l
dGVycyAqLwo+Cj4gICAgICAgICAgICAgICAgICAgIFVzZSAgICAgICAgICBFQ0MKPgo+ID4gKyAg
ICAgICAgICAgICBjaGlwLT5lY2Muc2l6ZSA9IGNoaXAtPmJhc2UuZWNjcmVxLnN0ZXBfc2l6ZTsK
PiA+ICsgICAgICAgICAgICAgY2hpcC0+ZWNjLnN0cmVuZ3RoID0gY2hpcC0+YmFzZS5lY2NyZXEu
c3RyZW5ndGg7Cj4gPiArICAgICAgICAgICAgIHByX2luZm8oIlVzaW5nIGRldGVjdGVkIG5hbmQt
ZWNjLXN0ZXAtc2l6ZSAlZCwgbmFuZC1lY2Mtc3RyZW5ndGggJWRcbiIsCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgY2hpcC0+ZWNjLnNpemUsIGNoaXAtPmVjYy5zdHJlbmd0aCk7Cj4gPiArICAg
ICB9Cj4gPiArCj4gPiAgICAgICBzd2l0Y2ggKGNoaXAtPmVjYy5zaXplKSB7Cj4gPiAgICAgICBj
YXNlIDUxMjoKPiA+ICAgICAgICAgICAgICAgaWYgKGNoaXAtPmVjYy5hbGdvID09IE5BTkRfRUND
X0hBTU1JTkcpCj4KPgo+IFRoYW5rcywKPiBNaXF1w6hsCgpLYW1hbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
