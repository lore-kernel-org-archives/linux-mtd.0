Return-Path: <SRS0=fWin=YI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22AFCECE587
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2019 07:57:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6D5C2089C
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2019 07:57:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S8K4yoiP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6D5C2089C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DNcqo1ppH+UIp4bCvcSTIbd8WjCUYwkL/pTqR09ZeHY=; b=S8K4yoiPkJ9A3K
	85KRRS6U+zOcWPHKVsOfpbsN0u9NTd3wvWzfXkc2NvEWz3OD9EiNusQgdIcVjbP8dj9W93bLDCpoU
	Ygz9XF60cJO9bT8xWxrY2ZRtqdipWCbUMM2O1CONqroyDp9+XudMFGySu9goIq54Fzl/cyyuTnpAI
	HHkfQR75+n97Os+LDxhXilTBridKPbYKj324U4A7lfRBZePydyKSllSktkR20SgNzCgb2SSyt/iz6
	DAp4FLnYbHUk6fPfJbjsnINJZqQbFmo4Rm27xuxr+Uu0EToX4hoYFi8+yZzGaytj+mRivgTtocvMC
	3GmCvep/4sXPFIoQG3Ig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKHhS-0000Xe-Is; Tue, 15 Oct 2019 07:56:58 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKHhN-0000VZ-Op
 for linux-mtd@lists.infradead.org; Tue, 15 Oct 2019 07:56:56 +0000
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 3654324000D;
 Tue, 15 Oct 2019 07:56:37 +0000 (UTC)
Date: Tue, 15 Oct 2019 09:56:37 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH RFC 3/3] mtd: rawnand: Add support Macronix power down mode
Message-ID: <20191015095637.142e6db7@xps13>
In-Reply-To: <OF6D5429CF.876DE422-ON48258494.000D641F-48258494.000E0D4C@mxic.com.tw>
References: <1568793387-25199-1-git-send-email-masonccyang@mxic.com.tw>
 <1568793387-25199-3-git-send-email-masonccyang@mxic.com.tw>
 <20191007104501.1b4ed8ed@xps13>
 <OF147D635A.8968CD6B-ON4825848D.00088AD5-4825848D.000B9D06@mxic.com.tw>
 <20191008092832.54492696@dhcp-172-31-174-146.wireless.concordia.ca>
 <OF6D5429CF.876DE422-ON48258494.000D641F-48258494.000E0D4C@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_005653_945185_B1FDB373 
X-CRM114-Status: GOOD (  16.64  )
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
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 frieder.schrempf@kontron.de, marcel.ziswiler@toradex.com,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 richard@nod.at, tglx@linutronix.de, computersforpeace@gmail.com,
 dwmw2@infradead.org, marek.vasut@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgptYXNvbmNjeWFuZ0BteGljLmNvbS50dyB3cm90ZSBvbiBUdWUsIDE1IE9jdCAy
MDE5IDEwOjMzOjI5ICswODAwOgoKPiBIaSBCb3JpcywKPiAKPiAgCj4gPiA+ID4gPiArICAgbmFu
ZF9zZWxlY3RfdGFyZ2V0KGNoaXAsIDApOyAgIAo+ID4gPiA+IAo+ID4gPiA+IE9uIHNldmVyYWwg
TkFORCBjb250cm9sbGVycyB0aGVyZSBpcyBubyB3YXkgdG8gYWN0IG9uIHRoZSBDUyBsaW5lCj4g
PiA+ID4gd2l0aG91dCBhY3R1YWxseSB3cml0aW5nIGJ5dGVzIHRvIHRoZSBOQU5EIGNoaXAuIFNv
IGJhc2ljYWxseSB0aGlzCj4gPiA+ID4gaXMgdmVyeSBsaWtlbHkgdG8gbm90IHdvcmsuICAgCj4g
PiA+IAo+ID4gPiBhbnkgb3RoZXIgd2F5IHRvIG1ha2UgaXQgd29yayA/IEdQSU8gPwo+ID4gPiBv
ciBqdXN0IGhhdmUgc29tZSBjb21tZW50cyBkZXNjcmlwdGlvbiBoZXJlLgo+ID4gPiBpLmUsLgo+
ID4gPiAKPiA+ID4gLyogVGhlIE5BTkQgY2hpcCB3aWxsIGV4aXQgdGhlIGRlZXAgcG93ZXIgZG93
biBtb2RlIHdpdGggI0NTIHRvZ2dsaW5nLCAgIAo+IAo+ID4gPiAgKiBwbGVhc2UgcmVmZXIgdG8g
ZGF0YXNoZWV0IGZvciB0aGUgdGltaW5nIHJlcXVpcmVtZW50IG9mIHRDUkRQIGFuZCAgIAo+IHRS
RFAuCj4gPiA+ICAqLwo+ID4gPiAgIAo+ID4gCj4gPiBHb29kIGx1Y2sgd2l0aCB0aGF0LiBBcyBN
aXF1ZWwgc2FpZCwgb24gbW9zdCBOQU5EIGNvbnRyb2xsZXJzCj4gPiBzZWxlY3RfdGFyZ2V0KCkg
aXMgYSBkdW1teSBvcGVyYXRpb24gdGhhdCBqdXN0IGFzc2lnbnMgbmFuZF9jaGlwLT50YXJnZXQK
PiA+IHRvIHRoZSBzcGVjaWZpZWQgdmFsdWUgYnV0IGRvZXNuJ3QgYXNzZXJ0IHRoZSBDUyBsaW5l
LiBZb3UgY291bGQgc2VuZCBhCj4gPiBkdW1teSBjb21tYW5kIGhlcmUsIGxpa2UgYSBSRUFEX0lE
LCBidXQgSSBndWVzcyB5b3UgbmVlZCBDUyB0byBiZQo+ID4gYXNzZXJ0ZWQgZm9yIGF0IGxlYXN0
IDIwbnMgYmVmb3JlIGFzc2VydGluZyBhbnkgb3RoZXIgc2lnbmFscyAoQ0xFL0FMRSkKPiA+IHdo
aWNoIG1pZ2h0IGJlIGFuIGlzc3VlLiAgCj4gCj4gb2theSwgZ290IGl0Lgo+IEJ1dCBpZiBwb3Nz
aWJsZSwgSSB0aGluayBhZGRpbmcgQ1MgbGluZSBjb250cm9sIGluIG5hbmRfc2VsZWN0X3Rhcmdl
dCgpCj4gaXMgYSBzaW1wbGUgYW5kIGdlbmVyaWMgd2F5IGZvciBNVEQgYW5kIGFsbCByYXcgTkFO
RCBjb250cm9sbGVycy4KClRoZSBwcm9ibGVtIGlzIG5vdCB0aGF0IHdlIGRvIG5vdCB3YW50IHRv
OyB0aGUgcHJvYmxlbSBpcyB0aGF0CmNvbnRyb2xsZXJzIGFyZSBub3QgY2FwYWJsZSBvZiBkb2lu
ZyBpdCByZWxpYWJseSBpZiBubyBieXRlIGlzIHNlbnQKb3ZlciB0aGUgTkFORCBidXMuCgoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
