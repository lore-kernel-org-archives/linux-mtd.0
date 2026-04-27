Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125E1FF8868
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2026 15:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7IIQsS7UaO1UexbeRp63atfU+/zafBQYH+Q0Ba6jZP8=; b=RrE/qaC2kI1hlH
	006yJneqN6Two7X6h4Ls7ggZO5qyTpTaCCf7CKnksU36esPmLogZikIw+Xq+9+eWqyFzjfBISVclY
	KL5ajoZ4fHAhZYXzie+dTd1Yb9NwhQc/2lu7IiFG6991P9FuoEJfKygT2dpOFbCUwBiVzvtHd+NxC
	1c5LKSELoJDvQ9vpEtRODD/x/vwdy0dJ8wq59gzWZ/e3uuGk8w4ASWV4ueqxpTZMt8tMhU3wq65ev
	WXGUJYuEM7187dZvcfA0I18M2yvFxqNCwvgr3MJpDiD81CQ2VexvS3kWPv4slHr1HjB3E59DV0Jez
	AZTmpDWCkWvxpFesWTyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHO2k-0000000HDpl-0dlc;
	Mon, 27 Apr 2026 15:38:42 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHO2f-0000000HDpQ-3rAL
	for linux-mtd@lists.infradead.org;
	Mon, 27 Apr 2026 15:38:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5DE63C5CD4A;
	Mon, 27 Apr 2026 15:39:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 079D0600D1;
	Mon, 27 Apr 2026 15:38:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9EE710728068;
	Mon, 27 Apr 2026 17:38:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777304314; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=h4EAmgSRIF0VbCoFpzON8QNgX3RE3NgJm+NruHt7Das=;
	b=Q1EJCOu0FMQP1X4wvVFZHxOXP8OKLGxy9qs38SL/7FhKV+FYApEaxNJq9hvY4xUbZRrrlJ
	WxXbwNeuOlPLkJb3lmd4D6Nvy+o18yEynHh8QpsX1srdiWabjePSSNCzdHGwzsNIc3yzpq
	IwvP2TbOvdSAetCJ/oxU4mcMugZz47ERxhrMMD0+YR2fP6vxttXSdbfPZy42zlpocT35ww
	A64Hi2mgpNpxAnMV3KYs3fKDYkvy7rvyb+A0q+VUmyjmLOdb4oA0IQhKlBFw0QKRhHYD98
	sBdf+rWcLSNXLGxUXVXmAWDl/ag+hrulZXy95MMpIm7vsOeJV8lChRA0/siurQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David Laight <david.laight.linux@gmail.com>,  Lukas Wunner
 <lukas@wunner.de>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Andrew Morton
 <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 1/1] mtd: cfi_cmdset_0001: Factor out
 do_write_buffer_locked() to reduce stack frame
In-Reply-To: <ad41TpzL4onrcKzn@ashevche-desk.local> (Andy Shevchenko's message
	of "Tue, 14 Apr 2026 15:38:38 +0300")
References: <20260408211407.2295175-1-andriy.shevchenko@linux.intel.com>
	<20260409082611.73fac9ab@pumpkin> <addcJP2erqYh8pD2@wunner.de>
	<20260409122846.7d08d2b4@pumpkin>
	<ad41TpzL4onrcKzn@ashevche-desk.local>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 27 Apr 2026 17:38:31 +0200
Message-ID: <87ik9cfm6g.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_083838_450479_D25031DB 
X-CRM114-Status: GOOD (  19.82  )
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

SGVsbG8sCgpPbiAxNC8wNC8yMDI2IGF0IDE1OjM4OjM4ICswMywgQW5keSBTaGV2Y2hlbmtvIDxh
bmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgoKPiBPbiBUaHUsIEFwciAw
OSwgMjAyNiBhdCAxMjoyODo0NlBNICswMTAwLCBEYXZpZCBMYWlnaHQgd3JvdGU6Cj4+IE9uIFRo
dSwgOSBBcHIgMjAyNiAwOTo1ODoyOCArMDIwMAo+PiBMdWthcyBXdW5uZXIgPGx1a2FzQHd1bm5l
ci5kZT4gd3JvdGU6Cj4+ID4gT24gVGh1LCBBcHIgMDksIDIwMjYgYXQgMDg6MjY6MTFBTSArMDEw
MCwgRGF2aWQgTGFpZ2h0IHdyb3RlOgo+PiA+ID4gT24gV2VkLCAgOCBBcHIgMjAyNiAyMzoxMTo0
OCArMDIwMCBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNv
bT4gd3JvdGU6ICAKPj4gPiA+ID4gQ29tcGlsZXIgaXMgbm90IGhhcHB5IGFib3V0IHVzZWQgc3Rh
Y2sgZnJhbWU6Cj4+ID4gPiA+IAo+PiA+ID4gPiBkcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0
XzAwMDEuYzogSW4gZnVuY3Rpb24gJ2RvX3dyaXRlX2J1ZmZlcic6Cj4+ID4gPiA+IGRyaXZlcnMv
bXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMS5jOjE4ODc6MTogZXJyb3I6IHRoZSBmcmFtZSBzaXpl
IG9mIDEyOTYgYnl0ZXMgaXMgbGFyZ2VyIHRoYW4gMTI4MCBieXRlcyBbLVdlcnJvcj1mcmFtZS1s
YXJnZXItdGhhbj1dCj4+ID4gPiA+IAo+PiA+ID4gPiBGaXggdGhpcyBieSBmYWN0b3Jpbmcgb3V0
IGRvX3dyaXRlX2J1ZmZlcl9sb2NrZWQoKS4gIAo+PiA+ID4gCj4+ID4gPiBEb2VzIHRoaXMganVz
dCBzcGxpdCB0aGUgbGFyZ2Ugc3RhY2sgZnJhbWUgYmV0d2VlbiB0d28gbmVzdGVkIGZ1bmN0aW9u
cz8KPj4gPiA+IEknZCBhbHNvIGV4cGVjdCB0aGUgY29tcGlsZXIgdG8gaW5saW5lIGRvX3dyaXRl
X2J1ZmZlcl9sb2NrZWQoKSBzbyBpdAo+PiA+ID4gbWFrZXMgbGl0dGxlIGRpZmZlcmVuY2UuCj4+
ID4gPiBPVE9IIEkgY2FuJ3QgaW1tZWRpYXRlbHkgc2VlIHdoZXJlIHRoZSBsYXJnZSBzdGFjayBm
cmFtZSBjb21lcyBmcm9tLiAgCj4+ID4gCj4+ID4gVGhlIGVycm9yIG9jY3VycyBmb3IgYW4gYWxs
bW9kY29uZmlnIGJ1aWxkIG9uIGFybSwgd2hpY2ggaW1wbGllcwo+PiA+IENPTkZJR19LQVNBTl9T
VEFDSz15IGFuZCB0aHVzIGluY3JlYXNlcyBzdGFjayB1c2FnZSB2aXMtw6AtdmlzIGEKPj4gPiAi
cmVndWxhciIgYnVpbGQuCj4+ID4gCj4+ID4gU3RhY2sgdXNhZ2UgaXMgaGlnaCBoZXJlIGJlY2F1
c2Ugb2YgdGhlIHRocmVlICJtYXBfd29yZCIgdHlwZXMsCj4+ID4gd2hpY2ggY2FuIGVhY2ggYmUg
dXAgdG8gMjU2IHVuc2lnbmVkIGxvbmdzICgzMiAqIDgpLCBzZWUgdGhlCj4+ID4gZGVmaW5pdGlv
bnMgb2YgTUFYX01BUF9MT05HUywgTUFYX01BUF9CQU5LV0lEVEgsIG1hcF93b3JkIGluCj4+ID4g
aW5jbHVkZS9saW51eC9tdGQvbWFwLmguCj4+IAo+PiBVZ2cgLSB0aGF0IGNvZGUgaXMgaG9ycmlk
Lgo+PiBSZXR1cm5pbmcgc3RydWN0dXJlcyBieSB2YWx1ZSBpc24ndCByZWFsbHkgYSBnb29kIGlk
ZWEuCgpMb29rcyBsaWtlIHRoZSBwcmltYXJ5IHJlYXNvbiBmb3IgdGhlIHN0YWNrIG92ZXIgdXNh
Z2UsIG5vPyBJc24ndApwbGF5aW5nIHdpdGggaW5saW5lIGFuZCByZWZhY3RvcmluZyBqdXN0IGEg
dGlueSBmaXggdGhhdCBwcmV2ZW50cwpwcm9ibGVtIGJ5IGp1c3QgYSBjb3VwbGUgb2YgYnl0ZXM/
CgpJIGhhdmVuJ3QgbG9va2VkIHRvbyBjYXJlZnVsbHksIGJ1dCBjb3VsZCB3ZSAoQW5keT8pIGhh
dmUgYSBmaXggdGhhdApyZWR1Y2VzIHRoZSBudW1iZXIgb2YgbWFwX3dvcmQgKGFzIHN1Z2dlc3Rl
ZCwgSUlVQykgYW5kL29yIGF2b2lkIHBhc3NpbmcKdGhlbSBieSB2YWx1ZT8gSSBjYW4gYWxzbyB0
YWtlIHRoaXMgY2xlYW51cCBpZiBlbmNsb3NlZCBpbiBhIGJpZ2dlcgpzZXJpZXMsIEkgZG9uJ3Qg
bWluZCBiZWNhdXNlIGl0IG1heSBtYWtlIHRoZSBjb2RlIGVhc2llciB0byByZWFkIGFzCndlbGws
IGJ1dCBJIGZlZWwgbGlrZSB0aGlzIGlzIG5vdCBhIHByb3BlciBmaXguIElmIGl0IGlzLCBwbGVh
c2UgZXhwbGFpbgp0byBtZSBhZ2FpbiA6LSkKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
