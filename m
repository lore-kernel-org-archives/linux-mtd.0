Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E44CAC598
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Sep 2025 09:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MHQZBGWQaZq52w+dOgYtbGP5J4R4oRMq6faI3khzetM=; b=HVod8q5b1Q7kPb
	9GMbkYZt0mhMcs2CB1n/rX0E2RLuwfMXKJM/Bc0kBnnHfWkunIr2MORwxQWc0cPWj5oLha0fTIYgw
	1UvPOKubfILu0vPK9rgYvPUpMiUxRLGeIieDz+7hxGtLvicVkgjb+OSu/M9dvoNbxC5rgLkfuPg7n
	/IYGE+Z7Gr3TR+01shKBPO1TuIhA+e5IraUDX62CWW3rDcrPLvIR60575uSn+WYZMxZepE8MSExty
	OKso8O0xBanSRZd3th8pB4ZbTvLTz6+W6V8Ya1c3Gh03Hmt0XGOanWpVXGSx1NTrQprbxhWJyZO1H
	EL1sjjThwqPPHrttbbhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyS3k-00000007OJQ-1Tcw;
	Tue, 16 Sep 2025 09:33:12 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyS3g-00000007OHi-47sx
	for linux-mtd@lists.infradead.org;
	Tue, 16 Sep 2025 09:33:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 128E4C8F1F3;
	Tue, 16 Sep 2025 09:32:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6F0B66061E;
	Tue, 16 Sep 2025 09:33:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ADF02102F16A1;
	Tue, 16 Sep 2025 11:33:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758015184; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jUHDhIk4lXzFELL7ItP2OHbvC4jAgKomX4rA9TKCWxc=;
	b=Wjtdg6QGcZp1veOwxQX82+vGUdpU/1KCTsisYBKEYahBvIcy+2lD/5CbvKyBP+2FWjS/u/
	NGdRkW9bcfT+PcyWQGJYZ2zpER5JXS+PjWsaeRgqbGsBXHCnk/Z3BlgAwBtjnZe1I4aW/J
	teMh0qOpbCGzv6Z+/Rd3srwcW57Uev7zIV/Q6xNTzXqbOtBgOhgtPDOILbUqDyr589Gg11
	/WZ2dhCLQVmKIvkZLUcYDE6dnQXbQMJUrK7/4D6WXrHfQkK9U9Rx/JFKBvFZgVxatQP8wq
	cp8PhKQukIHpWEY6OtT54uBJ59vtUS4DKtXpy17zMiM2W2fOBfDDEqC+gOTTwQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,  stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: fsmc: Default to autodetect buswidth
In-Reply-To: <20250914-fsmc-v1-1-6d86d8b48552@linaro.org> (Linus Walleij's
	message of "Sun, 14 Sep 2025 00:35:37 +0200")
References: <20250914-fsmc-v1-1-6d86d8b48552@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 16 Sep 2025 11:32:58 +0200
Message-ID: <87h5x27ned.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_023309_418672_6895718B 
X-CRM114-Status: GOOD (  20.46  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTGludXMsCgpPbiAxNC8wOS8yMDI1IGF0IDAwOjM1OjM3ICswMiwgTGludXMgV2FsbGVpaiA8
bGludXMud2FsbGVpakBsaW5hcm8ub3JnPiB3cm90ZToKCj4gSWYgeW91IGRvbid0IHNwZWNpZnkg
YnVzd2lkdGggMiAoMTYgYml0cykgaW4gdGhlIGRldmljZQo+IHRyZWUsIEZTTUMgZG9lc24ndCBl
dmVuIHByb2JlIGFueW1vcmU6Cj4KPiBmc21jLW5hbmQgMTAxMDAwMDAuZmxhc2g6IEZTTUMgZGV2
aWNlIHBhcnRubyAwOTAsCj4gICBtYW51ZmFjdHVyZXIgODAsIHJldmlzaW9uIDAwLCBjb25maWcg
MDAKPiBuYW5kOiBkZXZpY2UgZm91bmQsIE1hbnVmYWN0dXJlciBJRDogMHgyMCwgQ2hpcCBJRDog
MHhiMQo+IG5hbmQ6IFNUIE1pY3JvIDEwMTAwMDAwLmZsYXNoCj4gbmFuZDogYnVzIHdpZHRoIDgg
aW5zdGVhZCBvZiAxNiBiaXRzCj4gbmFuZDogTm8gTkFORCBkZXZpY2UgZm91bmQKPiBmc21jLW5h
bmQgMTAxMDAwMDAuZmxhc2g6IHByb2JlIHdpdGggZHJpdmVyIGZzbWMtbmFuZCBmYWlsZWQKPiAg
IHdpdGggZXJyb3IgLTIyCj4KPiBXaXRoIHRoaXMgcGF0Y2ggdG8gdXNlIGF1dG9kZXRlY3Rpb24g
dW5sZXNzIGJ1c3dpZHRoIGlzCj4gc3BlY2lmaWVkLCB0aGUgZGV2aWNlIGlzIHByb3Blcmx5IGRl
dGVjdGVkIGFnYWluOgo+Cj4gZnNtYy1uYW5kIDEwMTAwMDAwLmZsYXNoOiBGU01DIGRldmljZSBw
YXJ0bm8gMDkwLAo+ICAgbWFudWZhY3R1cmVyIDgwLCByZXZpc2lvbiAwMCwgY29uZmlnIDAwCj4g
bmFuZDogZGV2aWNlIGZvdW5kLCBNYW51ZmFjdHVyZXIgSUQ6IDB4MjAsIENoaXAgSUQ6IDB4YjEK
PiBuYW5kOiBTVCBNaWNybyBOQU5EIDEyOE1pQiAxLDhWIDE2LWJpdAo+IG5hbmQ6IDEyOCBNaUIs
IFNMQywgZXJhc2Ugc2l6ZTogMTI4IEtpQiwgcGFnZSBzaXplOiAyMDQ4LCBPT0Igc2l6ZTogNjQK
PiBmc21jLW5hbmQgMTAxMDAwMDAuZmxhc2g6IFVzaW5nIDEtYml0IEhXIEVDQyBzY2hlbWUKPiBT
Y2FubmluZyBkZXZpY2UgZm9yIGJhZCBibG9ja3MKPgo+IEkgZG9uJ3Qga25vdyB3aGVyZSBvciBo
b3cgdGhpcyBoYXBwZW5lZCwgSSB0aGluayBzb21lIGNoYW5nZQo+IGluIHRoZSBuYW5kIGNvcmUu
CgpJIGhhZCBhIGxvb2sgYW5kIGhvbm5lc3RseSBjb3VsZCBub3QgZmluZCB3aGVyZSB3ZSBicm9r
ZSB0aGlzLiBDb3VsZCBpdApiZSBwb3NzaWJsZSB0aGF0IGl0IG5ldmVyIHdvcmtlZCB3aXRoIERU
IHByb2JpbmcgYW5kIG9ubHkgd2l0aCBwbGF0Zm9ybQpkYXRhPyBBbnkgaWRlYSBvZiB3aGF0IHdh
cyB0aGUgcHJldmlvdXNseSB3b3JraW5nIGJhc2U/CgpBbnlob3csIHRoaXMgaXMganVzdCBjdXJp
b3NpdHksIHBhdGNoIGlzIHJlbGV2YW50IChqdXN0IGEgbGl0dGxlIG5pdApiZWxvdz8pLgoKPiBD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWog
PGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcv
ZnNtY19uYW5kLmMgfCA0ICsrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2ZzbWNf
bmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZnNtY19uYW5kLmMKPiBpbmRleCBkZjYxZGI4
Y2U0NjY1OTNkNTMzZTYxN2MxNDFhOGQyNDk4YjNhMTgwLi4xNTRmZDliZWEzMDE2YjJmYTdmYTcy
MGE0MWVmOWVlZWQ2MDYzZmQ1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2Zz
bWNfbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZnNtY19uYW5kLmMKPiBAQCAt
ODc5LDcgKzg3OSw5IEBAIHN0YXRpYyBpbnQgZnNtY19uYW5kX3Byb2JlX2NvbmZpZ19kdChzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAo+ICAJCX0gZWxzZSBpZiAodmFsICE9IDEpIHsKPiAg
CQkJZGV2X2VycigmcGRldi0+ZGV2LCAiaW52YWxpZCBiYW5rLXdpZHRoICV1XG4iLCB2YWwpOwo+
ICAJCQlyZXR1cm4gLUVJTlZBTDsKPiAtCQl9Cj4gKwkJfTsKCiAgICAgICAgICAgICAgICAgXgpU
aGVyZSBpcyBhIHNwdXJpb3VzICc7JyBoZXJlLCBubz8KCj4gKwl9IGVsc2Ugewo+ICsJCW5hbmQt
Pm9wdGlvbnMgfD0gTkFORF9CVVNXSURUSF9BVVRPOwo+ICAJfQoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
