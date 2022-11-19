Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF99C4332F
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Nov 2022 21:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5kNKN1/InWWi7ov+jqnanP2mAuVdYzCsBcD9Wk+G7Io=; b=DAAfMXoZwKRKFyBcXMYh8umtjO
	TvX0BaZMm7l5VWRSO4ph6HHykIFrmt7vHVm/v9mB1I2C2wYAw+p2IQLAfWHvgw6pqYvOho8fQLriS
	vyoTy+qJfBAFI/rX9A4rifkHdPed1zAwLXuZtf2/Gz0Bmfw9s8Ou1fvMMMC3fyTvN73Z2sj1+uGKf
	Jl7S0uSmWPopplDVZB5I+PJsajHXRTEjCmrnql13AzZJP6GAyD9H4Bis4YdJ/LrNdrppsKA5rgKnY
	/eNU4ro7mErBi59WD27TGnjsIMMaHLB4VfTt8Q93VHw5J8IbFlD0vSCi1Iqv9nWJRYOI3xJyn2tB8
	fdgtOkbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owVDG-00H7SH-CB; Sat, 19 Nov 2022 21:17:22 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owVDB-00H7QF-NJ
	for linux-mtd@lists.infradead.org; Sat, 19 Nov 2022 21:17:19 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5A59D63E515F;
	Sat, 19 Nov 2022 22:17:08 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id IO2Ydp7Ofn7w; Sat, 19 Nov 2022 22:17:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E79A863E516F;
	Sat, 19 Nov 2022 22:17:07 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id YWV5Vh889S7e; Sat, 19 Nov 2022 22:17:07 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id C6E6363E515F;
	Sat, 19 Nov 2022 22:17:07 +0100 (CET)
Date: Sat, 19 Nov 2022 22:17:07 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: George Kennedy <george.kennedy@oracle.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	eorge kennedy <eorge.kennedy@oracle.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	syzkaller@googlegroups.com, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	harshit m mogalapalli <harshit.m.mogalapalli@oracle.com>
Message-ID: <1124560008.256167.1668892627774.JavaMail.zimbra@nod.at>
In-Reply-To: <ae901608-0580-010a-26e3-99d0b704b88b@oracle.com>
References: <ae901608-0580-010a-26e3-99d0b704b88b@oracle.com>
Subject: Re: [PATCH] ubi: ensure that VID header offset + VID header size <=
 alloc, size
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ensure that VID header offset + VID header size <= alloc, size
Thread-Index: 6xZXY6I9/ykjqNmmj3iJooHYp5bcjg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221119_131717_943454_AA2810D0 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IEZpeGVzOiA4MDFjMTM1Y2U3M2QgKCJV
Qkk6IFVuc29ydGVkIEJsb2NrIEltYWdlcyIpCj4gUmVwb3J0ZWQtYnk6IHN5emthbGxlciA8c3l6
a2FsbGVyQGdvb2dsZWdyb3Vwcy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogR2VvcmdlIEtlbm5lZHkg
PGdlb3JnZS5rZW5uZWR5QG9yYWNsZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL3ViaS9idWls
ZC5jIHwgNiArKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC91YmkvYnVpbGQuYyBiL2RyaXZlcnMvbXRkL3ViaS9idWls
ZC5jCj4gaW5kZXggYTMyMDUwZmVjYWJmLi41M2FhNGRlNmI5NjMgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9tdGQvdWJpL2J1aWxkLmMKPiArKysgYi9kcml2ZXJzL210ZC91YmkvYnVpbGQuYwo+IEBA
IC02NjMsNiArNjYzLDEyIEBAIHN0YXRpYyBpbnQgaW9faW5pdChzdHJ1Y3QgdWJpX2RldmljZSAq
dWJpLCBpbnQKPiBtYXhfYmViX3BlcjEwMjQpCj4gIAl1YmktPmVjX2hkcl9hbHNpemUgPSBBTElH
TihVQklfRUNfSERSX1NJWkUsIHViaS0+aGRyc19taW5faW9fc2l6ZSk7Cj4gIAl1YmktPnZpZF9o
ZHJfYWxzaXplID0gQUxJR04oVUJJX1ZJRF9IRFJfU0laRSwgdWJpLT5oZHJzX21pbl9pb19zaXpl
KTsKPiAgCj4gKwlpZiAodWJpLT52aWRfaGRyX29mZnNldCAmJiAoKHViaS0+dmlkX2hkcl9vZmZz
ZXQgKyBVQklfVklEX0hEUl9TSVpFKSA+Cj4gKwkgICAgdWJpLT52aWRfaGRyX2Fsc2l6ZSkpIHsK
PiArCQl1YmlfZXJyKHViaSwgIlZJRCBoZWFkZXIgb2Zmc2V0ICVkIHRvbyBsYXJnZS4iLCB1Ymkt
PnZpZF9oZHJfb2Zmc2V0KTsKPiArCQlyZXR1cm4gLUVJTlZBTDsKPiArCX0KPiArCgpUaGFua3Mg
Zm9yIGZpeGluZyB0aGlzLCBhcHBsaWVkIHRvIHRoZSBmaXhlcyBicmFuY2guClRoYXQgc2FpZCwg
c29tZXRoaW5nIGJyb2tlIHdoaXRlc3BhY2VzIGluIHlvdXIgcGF0Y2gsIEkgYXBwbGllZCBpdCBt
YW51YWxseS4KQ29udGV4dCBsaW5lcyBiZWZvcmUgYW5kIGFmdGVyIGNvbnRhaW4gYW4gZXh0cmEg
c3BhY2UgYW5kIGNhdXNlZCBib3RoCmdpdCBhbSBhbmQgcGF0Y2ggdG8gZ2l2ZSB1cC4KClRoYW5r
cywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
