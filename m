Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AEEC4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Nov 2023 20:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=sNHR1IGxiVFiAYVd08BcOVkLaAeqqFlDE56ee4jbi14=; b=a03v2r3egmnXJH7lu3airF/K8p
	5nLn3YoizcBd5khhrgkpuwOPkBhDGHDziEICbVyJwiiGfHllZzcb9oKJsevgXchWlSaOZiudz9zaC
	rxqa/jQ1aABwPf5TtGqA9MSiSow8/aZmnIq/n1n1am0yj5SbSovzTdrJ7ms1cwnQz04Z84OT86TwM
	TPZxasw0on64gRavxKIF/V5p+pW3zIJaEBRPSj6s7QDEbw8g5U8zuAUO1i88Wh0xxYtBNouP6b+PH
	JRdciFW6m4j6ktMDbbeRusC1UYTZ+I+P1hZBEhLXoGO6/5RcL6QRSitMQWT4bmISo6JyOfRw+DK3O
	PZ4JNTYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7iBF-003RJI-28;
	Mon, 27 Nov 2023 20:26:09 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7iBA-003RHV-2o
	for linux-mtd@lists.infradead.org;
	Mon, 27 Nov 2023 20:26:06 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 016D96413F60;
	Mon, 27 Nov 2023 21:26:00 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id uLRVYHk-f5Lg; Mon, 27 Nov 2023 21:25:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 3013E6340E00;
	Mon, 27 Nov 2023 21:25:59 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id K3yrBMph3TqV; Mon, 27 Nov 2023 21:25:59 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0CF816413F60;
	Mon, 27 Nov 2023 21:25:59 +0100 (CET)
Date: Mon, 27 Nov 2023 21:25:58 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	John Crispin <john@phrozen.org>
Message-ID: <771902199.32600.1701116758852.JavaMail.zimbra@nod.at>
In-Reply-To: <9857609999c5b7196417474938a7a09892cd1612.1701104870.git.daniel@makrotopia.org>
References: <9857609999c5b7196417474938a7a09892cd1612.1701104870.git.daniel@makrotopia.org>
Subject: Re: [PATCH] ubi: don't decrease ubi->ref_count on detach error
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: don't decrease ubi->ref_count on detach error
Thread-Index: chpmDIpsyDGT4mmuCnlwjJ5qLzrYdQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_122605_230631_BDA927DB 
X-CRM114-Status: GOOD (  16.50  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkRhbmllbCBHb2xsZSIgPGRh
bmllbEBtYWtyb3RvcGlhLm9yZz4KPiBBbjogInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sICJN
aXF1ZWwgUmF5bmFsIiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4sICJWaWduZXNoIFJhZ2hh
dmVuZHJhIiA8dmlnbmVzaHJAdGkuY29tPiwKPiAiQXJ0ZW0gQml0eXV0c2tpeSIgPEFydGVtLkJp
dHl1dHNraXlAbm9raWEuY29tPiwgImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRl
YWQub3JnPiwgImxpbnV4LWtlcm5lbCIKPiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4K
PiBDQzogIkpvaG4gQ3Jpc3BpbiIgPGpvaG5AcGhyb3plbi5vcmc+Cj4gR2VzZW5kZXQ6IE1vbnRh
ZywgMjcuIE5vdmVtYmVyIDIwMjMgMTg6MDk6MTQKPiBCZXRyZWZmOiBbUEFUQ0hdIHViaTogZG9u
J3QgZGVjcmVhc2UgdWJpLT5yZWZfY291bnQgb24gZGV0YWNoIGVycm9yCgo+IElmIGF0dGVtcHRp
bmcgdG8gZGV0YWNoIGEgVUJJIGRldmljZSB3aGlsZSBpdCBpcyBzdGlsbCBidXN5LCBkZXRhY2hp
bmcKPiBpcyByZWZ1c2VkLiBIb3dldmVyLCB0aGUgcmVmZXJlbmNlIGNvdW50ZXIgaXMgc3RpbGwg
YmVpbmcgZGVjcmVhc2VkCj4gZGVzcGl0ZSB0aGUgZXJyb3IuIFJld29yayBkZXRhY2ggZnVuY3Rp
b24gdG8gb25seSBkZWNyZWFzZSB0aGUgcmVmY250Cj4gb25jZSBhbGwgY29uZGl0aW9ucyBmb3Ig
ZGV0YWNobWVudCBhcmUgbWV0Lgo+IAo+IEZpeGVzOiBjZGZhNzg4YWNkMTMgKCJVQkk6IHByZXBh
cmUgYXR0YWNoIGFuZCBkZXRhY2ggZnVuY3Rpb25zIikKPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
R29sbGUgPGRhbmllbEBtYWtyb3RvcGlhLm9yZz4KCkdvb2QgY2F0Y2ghIERpZCB5b3UgZmluZCB0
aGlzIGJ5IHJldmlldyBvciB3aGlsZSB0ZXN0aW5nPwoKPiAtLS0KPiBkcml2ZXJzL210ZC91Ymkv
YnVpbGQuYyB8IDYgKysrLS0tCj4gMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMgYi9k
cml2ZXJzL210ZC91YmkvYnVpbGQuYwo+IGluZGV4IDdkNGZmMTE5M2RiNmYuLmY0Nzk4N2VlOWEz
MWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMKPiArKysgYi9kcml2ZXJz
L210ZC91YmkvYnVpbGQuYwo+IEBAIC0xMDk5LDE2ICsxMDk5LDE2IEBAIGludCB1YmlfZGV0YWNo
X210ZF9kZXYoaW50IHViaV9udW0sIGludCBhbnl3YXkpCj4gCj4gCXNwaW5fbG9jaygmdWJpX2Rl
dmljZXNfbG9jayk7Cj4gCXB1dF9kZXZpY2UoJnViaS0+ZGV2KTsKPiAtCXViaS0+cmVmX2NvdW50
IC09IDE7Cj4gLQlpZiAodWJpLT5yZWZfY291bnQpIHsKPiArCWlmICh1YmktPnJlZl9jb3VudCA+
IDEpIHsKCklzIHRoZXJlIGEgc3BlY2lmaWMgcmVhc29uIHdoeSB5b3UgaGF2ZSBtb2RpZmllZCB0
aGUgY2hlY2sgdG8gdGVzdCBvbmx5CmZvciByZWZfY291bnQgYmVpbmcgcG9zaXRpdmU/CklmIHJl
Y19jb3VudHMgdHVybnMgbmVnYXRpdmUsIGR1ZSB0byBhIGJ1Zywgd2UgY291bGQgc3RpbGwgc3Rv
cCBpdCBoZXJlLgoKPiAJCWlmICghYW55d2F5KSB7Cj4gCQkJc3Bpbl91bmxvY2soJnViaV9kZXZp
Y2VzX2xvY2spOwo+IAkJCXJldHVybiAtRUJVU1k7Cj4gCQl9Cj4gCQkvKiBUaGlzIG1heSBvbmx5
IGhhcHBlbiBpZiB0aGVyZSBpcyBhIGJ1ZyAqLwo+IAkJdWJpX2Vycih1YmksICIlcyByZWZlcmVu
Y2UgY291bnQgJWQsIGRlc3Ryb3kgYW55d2F5IiwKPiAtCQkJdWJpLT51YmlfbmFtZSwgdWJpLT5y
ZWZfY291bnQpOwo+ICsJCQl1YmktPnViaV9uYW1lLCB1YmktPnJlZl9jb3VudCAtIDEpOwo+IAl9
Cj4gKwl1YmktPnJlZl9jb3VudCAtPSAxOwoKUGxlYXNlIGFkZCB0aGVyZSBhbiB1YmlfYXNlcnQo
KSB3aGljaCB0ZXN0cyB3aGV0aGVyIHJlZl9jb3VudCBpcyByZWFsbHkgemVyby4KLi4uanVzdCB0
byBiZSBtb3JlIGJ1bGxldCBwcm9vZi4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
