Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C405CC433FE
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Dec 2021 21:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=D9+K2dHmJvKEBjsJXhsPxxLBJ8hn3MLg+eAZ6OENdGc=; b=1CZ+Ous5NhDVMNbEAvYfMPb/G4
	zM5QMOL5UDHd+XDf75SDeRogI3yQAyKS0XQqMuofoz2fZOBZs/m+iDY/kNLc10eahwiZNy4/QmUA0
	ct8zTJK0Fz7wUMR3HAy0RZ7QOVGeInCHIq7caPgUcc7PysiEsDKRe1RvlpCht5r+qOSJPVQ2o1ebx
	UqruIIs0GhsKHGDR9H9DxKLA3Ept+VSzLOppQeIuPWPn+TC8XTdgLqF5dimtCSoX508rcgYoy+zqO
	0mreq6/TrYcjGg+HCyWn3ETQRMdbeZFSdb2JyHboI6P1XK7dL9l5/62PekzQmZ9yNTDnIcHmpOjFs
	zwzYxhPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1EIG-00F7FL-Ro; Sat, 25 Dec 2021 21:09:32 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1EID-00F7Ej-Sm
 for linux-mtd@lists.infradead.org; Sat, 25 Dec 2021 21:09:31 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 11A0662DA5FC;
 Sat, 25 Dec 2021 22:09:14 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Bg8XwaZeuqhX; Sat, 25 Dec 2021 22:09:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 6657B62DA5FE;
 Sat, 25 Dec 2021 22:09:13 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id mw8hxNWzmAu2; Sat, 25 Dec 2021 22:09:13 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 3CB8762DA5FC;
 Sat, 25 Dec 2021 22:09:13 +0100 (CET)
Date: Sat, 25 Dec 2021 22:09:13 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: s921975628@gmail.com
Cc: Vignesh Raghavendra <vigneshr@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <2117882647.202013.1640466553090.JavaMail.zimbra@nod.at>
In-Reply-To: <20211225100607.118932-1-s921975628@gmail.com>
References: <20211225100607.118932-1-s921975628@gmail.com>
Subject: Re: [PATCH 1/3] mtd: rawnand: nandsim: Replace overflow check with
 kzalloc to single kcalloc
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF95 (Linux)/8.8.12_GA_3809)
Thread-Topic: rawnand: nandsim: Replace overflow check with kzalloc to single
 kcalloc
Thread-Index: CqwQUojoaEMANy6nm1uPcdApakVc/w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211225_130930_123783_DF9A22DB 
X-CRM114-Status: UNSURE (   3.46  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogczkyMTk3NTYyOEBnbWFpbC5j
b20KPiBBbjogInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sICJWaWduZXNoIFJhZ2hhdmVuZHJh
IiA8dmlnbmVzaHJAdGkuY29tPiwgIk1pcXVlbCBSYXluYWwiIDxtaXF1ZWwucmF5bmFsQGJvb3Rs
aW4uY29tPgo+IENDOiAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+
LCAibGludXgta2VybmVsIiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4sICJSaW5IaXph
a3VyYSIKPiA8czkyMTk3NTYyOEBnbWFpbC5jb20+Cj4gR2VzZW5kZXQ6IFNhbXN0YWcsIDI1LiBE
ZXplbWJlciAyMDIxIDExOjA2OjA3Cj4gQmV0cmVmZjogW1BBVENIIDEvM10gbXRkOiByYXduYW5k
OiBuYW5kc2ltOiBSZXBsYWNlIG92ZXJmbG93IGNoZWNrIHdpdGgga3phbGxvYyB0byBzaW5nbGUg
a2NhbGxvYwoKPiBGcm9tOiBSaW5IaXpha3VyYSA8czkyMTk3NTYyOEBnbWFpbC5jb20+Cj4gCj4g
SW5zdGVhZCBvZiBzZWxmLWNoZWNraW5nIG92ZXJmbG93IGFuZCBhbGxvY2F0aW5nIGFuIGFycmF5
IG9mIHNwZWNpZmljIHNpemUKPiBieSBjb3VudGluZyB0aGUgdG90YWwgcmVxdWlyZWQgc3BhY2Ug
aGFuZHksIHdlIGFscmVhZHkgaGF2ZSBleGlzdGVkIGtlcm5lbAo+IEFQSSB3aGljaCByZXNwb25z
ZXMgZm9yIGFsbCB0aGVzZSB3b3Jrcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSaW5IaXpha3VyYSA8
czkyMTk3NTYyOEBnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogUmljaGFyZCBXZWluYmVyZ2VyIDxy
aWNoYXJkQG5vZC5hdD4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
