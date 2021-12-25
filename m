Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F1AC433F5
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Dec 2021 21:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6SOpgOK+cQzSCZwg/Lj0XgHg2swGIpj4Xi744HGGNa0=; b=JwAmEMVGmLqQ9Hj3cVpGrxFxa+
	+cYLMCRorNQfTK3uND4GgFkwuZE6sSBHhwo+7KhYYJSv2Lirbor6dxZ6fWcIqr+005gdbI0w+eC6r
	tKrLTU0xBK67oaiB/+F1nEQDrui0QKETCmlfpu+2Pdt9QJXbkVFbmnkEUf8KmnyUfuSdwOENRIUbm
	uAixg1LYMtfTIRXk/gya+c/FMFEiy8P8DIuQ3G04TQSBbKzlK603tvDj+sYBBEwdkJLanDeRqhpBZ
	AFS679Oz5K6ntPS5zx6DN3AuAQ84kfI1a0smXPmoV00rRmEHfPbaAxVPaaPNJLWZ1UAthXTItaTqi
	l4rgmmQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1EJi-00F7Pu-0f; Sat, 25 Dec 2021 21:11:02 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1EJe-00F7P1-6i
 for linux-mtd@lists.infradead.org; Sat, 25 Dec 2021 21:10:59 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id DDCEC62DA5F2;
 Sat, 25 Dec 2021 22:10:56 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 2nHCJFw-JoPn; Sat, 25 Dec 2021 22:10:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 79A5962DA600;
 Sat, 25 Dec 2021 22:10:56 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id IUBUKu06XHCJ; Sat, 25 Dec 2021 22:10:56 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 5427962DA5F2;
 Sat, 25 Dec 2021 22:10:56 +0100 (CET)
Date: Sat, 25 Dec 2021 22:10:56 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: s921975628@gmail.com
Cc: Vignesh Raghavendra <vigneshr@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1212908852.202017.1640466656269.JavaMail.zimbra@nod.at>
In-Reply-To: <20211225100648.119011-1-s921975628@gmail.com>
References: <20211225100648.119011-1-s921975628@gmail.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: nandsim: Merge repeat codes in
 ns_switch_state
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF95 (Linux)/8.8.12_GA_3809)
Thread-Topic: rawnand: nandsim: Merge repeat codes in ns_switch_state
Thread-Index: fv0rjzqWWQR1xTfN26WhgafFcDHqNw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211225_131058_414886_EF6F3F39 
X-CRM114-Status: UNSURE (   5.53  )
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
ZXplbWJlciAyMDIxIDExOjA2OjQ4Cj4gQmV0cmVmZjogW1BBVENIIDIvM10gbXRkOiByYXduYW5k
OiBuYW5kc2ltOiBNZXJnZSByZXBlYXQgY29kZXMgaW4gbnNfc3dpdGNoX3N0YXRlCgo+IEZyb206
IFJpbkhpemFrdXJhIDxzOTIxOTc1NjI4QGdtYWlsLmNvbT4KPiAKPiBUaGUgbW92aW5nIGJsb2Nr
IG9mIGNvZGVzIGlzIHNoYXJlZCBiZXR3ZWVuIGJvdGggJ2lmJyBhbmQgJ2Vsc2UnIGNvbmRpdGlv
biwKPiB3ZSBjYW4gbW92ZSBpdCBvdXQgdG8gcmVkdWNlIHRoZSBkdXBsaWNhdGlvbi4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBSaW5IaXpha3VyYSA8czkyMTk3NTYyOEBnbWFpbC5jb20+Cj4gLS0tCj4g
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZHNpbS5jIHwgMTkgKysrKysrLS0tLS0tLS0tLS0tLQo+
IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKUmV2aWV3
ZWQtYnk6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+CgpUaGFua3MsCi8vcmlj
aGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
