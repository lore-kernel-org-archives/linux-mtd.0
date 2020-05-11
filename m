Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1A5C38A2A
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 02:47:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1BE52137B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 02:47:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T7e5G27N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="DFnmiToq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1BE52137B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DmXzsMcnaZ78sD7rEQCL1ydVaCFl7af2q7JA47yuc+E=; b=T7e5G27NWBObfW
	4+uM5CeEXp8YH2PMyaNzWAQSvtpqCDyHV+Rq85/0uKqXv5JscrlGzRWlMZm7QDiFKdEoP001M3MJJ
	7uTrM+shaY91nKlm/WUvymr1PZSizP/rV5KkFWhK4nyNvWI3puV2mCx3ooJv78xztNPbyOxtZZaoX
	ivDeQuuUI+HSrOpbROtdj9D3VUpmXk4Ws/U6ZdERygFU3MWwirqn/fpSseWCd0Ek05PtrX3Z5V3qK
	6xbDJLBTuAQqQ+aWrAghgLr9La6iS9q8NVEhyldYwcAiQ5A21TCYKHU6FWC8nuCT10a5pgkF/Jtks
	llOYqJoJMa2XZ0ZmAnvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXyTh-0002RJ-BH; Mon, 11 May 2020 02:47:37 +0000
Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXyTd-0002Ql-BM
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 02:47:35 +0000
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id 04B2lGH0017948
 for <linux-mtd@lists.infradead.org>; Mon, 11 May 2020 11:47:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 04B2lGH0017948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1589165237;
 bh=YoiK2aNPNYQEbcBI8uQBXpRtAITbuwjYiHJjs7pUM3w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DFnmiToqpSvuYbCD0+qTYowAF7h/FacOP+Do+QZAenR8kJRVkyIoD1puh0tt6+oLH
 oKRem6Q9chaHloWxC8qb6gabrGBYe7oH6AckKfcqWI/gxjeDpC4PZf1XweQJ9Ay7Ie
 fAWsg09LjnwjIJcg0zFESkF0tb6rQwxvAyHDjAxf/lmDe3I9D4UsF9zBGxXkne56qY
 rJB4Fb0zabA+vMLLEFKDVMI61VOSbOVhdBPHiRKneowv3L5EFrGXgewwnwZA9+e5YX
 ELvhVyMEnw/jjYuCAv+Tt5x06IVTUUcSjAwk8IqmpygnHUA6PiZCE/CsNC1/7xPY4z
 urF6j1z9TiMXA==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id s11so4668282vsm.3
 for <linux-mtd@lists.infradead.org>; Sun, 10 May 2020 19:47:17 -0700 (PDT)
X-Gm-Message-State: AGi0Pubb7OUlExoCxo6brl/UxfQuDU4SQo7lF7BL7us8DhE/xUWBfsxx
 qjCNch4I3RJkPSyHiaDexRAFv0zkYaS4qqSIp9I=
X-Google-Smtp-Source: APiQypLxMJRsg/V3PGGkyaI1+rL7PcJX4PjOdXo4PKjMj7P/zMiXzOJ8sjxR9+DWOthISoyEDTw3RCJsy3IW9ldYIJs=
X-Received: by 2002:a67:6e07:: with SMTP id j7mr9476282vsc.181.1589165235831; 
 Sun, 10 May 2020 19:47:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200510121220.18042-1-miquel.raynal@bootlin.com>
In-Reply-To: <20200510121220.18042-1-miquel.raynal@bootlin.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 11 May 2020 11:46:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQDxZrrGdO14kZbykjaoX-EwA3EUd+3Cp1Y_vYKZe4=Xw@mail.gmail.com>
Message-ID: <CAK7LNAQDxZrrGdO14kZbykjaoX-EwA3EUd+3Cp1Y_vYKZe4=Xw@mail.gmail.com>
Subject: Re: [PATCH 00/62] mtd: rawnand: Get rid of nand_release()
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_194733_729352_D69E4260 
X-CRM114-Status: GOOD (  16.25  )
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
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Stefan Agner <stefan@agner.ch>,
 Paul Cercueil <paul@crapouillou.net>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, Han Xu <han.xu@nxp.com>,
 Xiaolei Li <xiaolei.li@mediatek.com>,
 Brian Norris <computersforpeace@gmail.com>, Piotr Sroka <piotrs@cadence.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKCk9uIFN1biwgTWF5IDEwLCAyMDIwIGF0IDk6MTQgUE0gTWlxdWVsIFJheW5h
bCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbywKPgo+IFRoZSBt
YWluIGdvYWwgb2YgdGhpcyBiaWcgY2xlYW51cCBzZXJpZXMgaXMgdG8gZ2V0IHJpZCBvZgo+IG5h
bmRfcmVsZWFzZSgpLiBJIGFtIGFsd2F5cyBjb25mdXNlZCB3aGVuIGl0IGNvbWVzIHRvIHVzZSBl
aXRoZXIKPiBuYW5kX2NsZWFudXAoKSBvciBuYW5kX3JlbGVhc2UoKSBhbmQgSSBuZWVkIHRvIGNo
ZWNrIHRoZSBjb2RlIGluIHRoZQo+IGNvcmUsIHdoaWNoIGlzIGEgc2lnbiBvZiB0aGUgQVBJIGJl
aW5nIGJhZGx5IGRlc2lnbmVkLgo+Cj4gSGlzdG9yaWNhbGx5LCB0aGVyZSB3YXMgYSAibmFuZF9y
ZWxlYXNlKCkiIGhlbHBlciBvbmx5LCBkb2luZyB0aGUgTVRECj4gZGV2aWNlIHVucmVnaXN0cmF0
aW9uIGFuZCBjbGVhbmluZy9mcmVlaW5nIGFsbCBvYmplY3RzIGJlbG9uZ2luZyB0bwo+IHRoZSBO
QU5EIGNvcmUuIExhdGVyICh2NC45KSwgbmFuZF9jbGVhbnVwKCkgd2FzIGJlZW4gYWRkZWQgdG8g
dGFrZQo+IGNhcmUgb2YgYWxsIHRoZSBOQU5EIGNsZWFudXAsIGFuZCB3YXMgY2FsbGVkIGRpcmVj
dGx5IGJ5Cj4gbmFuZF9yZWxlYXNlKCkuIFRoaXMgbmV3IGhlbHBlciB3YXMgdmVyeSB1c2VmdWwg
dG8gY2xlYW51cCBhbGwgdGhlCj4gTkFORCBjb3JlIG9iamVjdHMgaW4gb25lIGdvIG9uIF9wcm9i
ZSgpIGVycm9yIChhZnRlciBhIHN1Y2Nlc3NmdWwKPiBuYW5kX3NjYW4oKSkuCj4KPiBVbmZvcnR1
bmF0ZWx5LCBiZWNhdXNlIG9mIHRoZSBsYWNrIG9mIHN5bW1ldHJ5IGluIHRoZSBBUEksIGEgbG90
IG9mCj4gcGVvcGxlIGFsc28gdXNlZCBuYW5kX3JlbGVhc2Ugd3JvbmdseSBpbiB0aGUgX3Byb2Jl
KCkgZXJyb3IgcGF0aC4KPgo+IFNvIG5vdywgaW5zdGVhZCBvZjoKPgo+ICAgICAgICAgbmFuZF9y
ZWxlYXNlKGNoaXApOwo+Cj4gSSB3b3VsZCBsaWtlIHBlb3BsZSB0byB1c2U6Cj4KPiAgICAgICAg
IHJldCA9IG10ZF9kZXZpY2VfdW5yZWdpc3RlcihtdGQpOwo+ICAgICAgICAgV0FSTl9PTihyZXQp
Owo+ICAgICAgICAgbmFuZF9jbGVhbnVwKGNoaXApOwo+Cj4gTm90ZTogYXMgaXQgaXMgY3VycmVu
dGx5IG5vdCBwb3NzaWJsZSB0byBoYW5kbGUgcHJvcGVybHkgYW4gZXJyb3Igb24KPiBtdGRfZGV2
aWNlX3VucmVnaXN0ZXIoKSwgV0FSTl9PTigpIHdpbGwgYXQgbGVhc3QgaW5mb3JtIHRoZSB1c2Vy
Lgo+Cj4gQWxsIG9mIHlvdSByZWNlaXZpbmcgdGhpcyBjb3ZlciBsZXR0ZXIgd2lsbCBhdCBsZWFz
dCByZWNlaXZlIG9uZSBwYXRjaAo+IGFwcGx5aW5nIHRoaXMgY2hhbmdlIHRvIHRoZSBkcml2ZXIg
eW91IGFyZSBtYWludGFpbmluZy4KPgo+IFRoYW5rcywKPiBNaXF1w6hsCgoKCkF0IGZpcnN0LCBJ
IGp1c3Qgd29uZGVyZWQKaWYgd2UgY291bGQgYWRkIG5hbmRfcmVnaXN0ZXIoKQp0aGF0IHdyYXBz
IHRoZSBjb21ibyBvZgpuYW5kX3NjYW4oKSBhbmQgbXRkX2RldmljZV9yZWdpc3RlcigpCnNvIHRo
YXQgbmFuZF9yZWdpc3RlcigpIHZzIG5hbmRfcmVsZWFzZSgpCmxvb2tzIHN5bW1ldHJpY2FsLgoK
CkJ1dCwgbm90IGFsbCBkcml2ZXJzIGNhbGwKbmFuZF9zY2FuKCkgYW5kIG10ZF9kZXZpY2VfcmVn
aXN0ZXIoKQppbiBhIHJvdy4KClNvLCBJIGFncmVlIHdlIHNob3VsZCBzaW1wbHkgZHJvcApuYW5k
X3JlbGVhc2UoKS4KCgpUaGFua3MuCgotLSAKQmVzdCBSZWdhcmRzCk1hc2FoaXJvIFlhbWFkYQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
