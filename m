Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508B3C77B70
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Apr 2023 18:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=D4uXHNnQgbDcsrZSWlcHL7Hrc8f8swbaX3Si4xB+ytY=; b=Y2ecn9zkK6YRWt0FOLlLblYWJB
	bWWZcOYNDiI68YQlvNe4YynTeBLigBr0wvVyAueLQVhyCxw/1kWsQxffXuSSjQUMtJN7r9YGdKQyC
	J8oiEPISB49G3g8BXXZdNhKfBx6tVPmUb4+cyAoCqXWXhN7BSzCG7BYo7WhUKOpU2FQFjXefztlJK
	tbdYqULz/pJ2lPOGKESykui7XQl4O6ngzPFPIujT4nLr9UuCUeN+gDRTCQuCb+ghvSanGpdAzhujB
	Rjk0TheoL8Osus/nC/iSIesfl5o59GLF4tq5m7NNkqvfzbIVXq2xeeSSPIhb9WnlQ2FnISTlNh276
	CS3M3Paw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnkbO-00CbAX-1r;
	Sat, 15 Apr 2023 18:26:22 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnkbL-00Cb9R-2g
	for linux-mtd@lists.infradead.org;
	Sat, 15 Apr 2023 18:26:21 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8535161989EA;
	Sat, 15 Apr 2023 20:26:18 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id q3nyYnnlJoWP; Sat, 15 Apr 2023 20:26:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E8363622623A;
	Sat, 15 Apr 2023 20:26:17 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id h6de7diMJ8hx; Sat, 15 Apr 2023 20:26:17 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id C803161989EA;
	Sat, 15 Apr 2023 20:26:17 +0200 (CEST)
Date: Sat, 15 Apr 2023 20:26:17 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Daniel Golle <daniel@makrotopia.org>
Cc: stable <stable@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>, 
	Hauke Mehrtens <hauke@hauke-m.de>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	Nicolas Schichan <nschichan@freebox.fr>, 
	George Kennedy <george.kennedy@oracle.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	yi zhang <yi.zhang@huawei.com>
Message-ID: <288240559.69421.1681583177740.JavaMail.zimbra@nod.at>
In-Reply-To: <ZDrmsnX5BHxtBNwf@makrotopia.org>
References: <ZDrmsnX5BHxtBNwf@makrotopia.org>
Subject: Re: Request to pick "ubi: Fix failure attaching when vid_hdr offset
 equals to (sub)page size"
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Request to pick "ubi: Fix failure attaching when vid_hdr offset equals to (sub)page size"
Thread-Index: /+luI1lt6eV/ynqKJ8vb6eB8RV7kaA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230415_112620_025303_D84ED21A 
X-CRM114-Status: UNSURE (   4.81  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkRhbmllbCBHb2xsZSIgPGRh
bmllbEBtYWtyb3RvcGlhLm9yZz4KPiBBbjogInN0YWJsZSIgPHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmc+LCAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+Cj4gQ0M6ICJI
YXVrZSBNZWhydGVucyIgPGhhdWtlQGhhdWtlLW0uZGU+LCAicmljaGFyZCIgPHJpY2hhcmRAbm9k
LmF0PiwgIk1pcXVlbCBSYXluYWwiIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiwKPiAiY2hl
bmd6aGloYW8xIiA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+LCAiTmljb2xhcyBTY2hpY2hhbiIg
PG5zY2hpY2hhbkBmcmVlYm94LmZyPiwgIkdlb3JnZSBLZW5uZWR5Igo+IDxnZW9yZ2Uua2VubmVk
eUBvcmFjbGUuY29tPiwgIlNhc2NoYSBIYXVlciIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+LCAi
eWkgemhhbmciIDx5aS56aGFuZ0BodWF3ZWkuY29tPgo+IEdlc2VuZGV0OiBTYW1zdGFnLCAxNS4g
QXByaWwgMjAyMyAyMDowMjoyNgo+IEJldHJlZmY6IFJlcXVlc3QgdG8gcGljayAidWJpOiBGaXgg
ZmFpbHVyZSBhdHRhY2hpbmcgd2hlbiB2aWRfaGRyIG9mZnNldCBlcXVhbHMgdG8gKHN1YilwYWdl
IHNpemUiCgo+IEhpLAo+IAo+IHBsZWFzZSBwaWNrCj4gCj4gMWUwMjBlMWI5NmFmZCAoInViaTog
Rml4IGZhaWx1cmUgYXR0YWNoaW5nIHdoZW4gdmlkX2hkciBvZmZzZXQgZXF1YWxzIHRvCj4gKHN1
YilwYWdlIHNpemUiKQo+IAo+IGZyb20gbGludXgtbmV4dCB0byBzdGFibGUgdHJlZXMuCgpGWUks
IHRoZSBmaXggaXMgbm90IHlldCBpbiBMaW51cycgbWFzdGVyLiBCdXQgSSBndWVzcyBpdCB3aWxs
IGJlIHZlcnkgc29vbi4KVGhlIHB1bGwgcmVxdWVzdCBpcyBvbiB0aGUgbWFpbGluZ2xpc3QuCgpU
aGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
