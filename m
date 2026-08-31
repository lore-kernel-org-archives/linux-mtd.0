Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054D7C61DE2
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2026 12:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PG0QsW69pHEjSy0UZxRgSIuOVyurIpDzqxHRxk2wweU=; b=NTcqaE1au4VpF9
	akrZV7A6NmTWF13ex3jdNUbB09S6B0QJbZaarvVH+DFL2jYQBlIqn2UhCtQtlf8EHo4QB0fwGqmc/
	ZeS1Jbn8e0fgyRxrSRV4xWFVu9QMOxwLsuTu1tHsBSQqcj6afG9KPdlF1i84udKxE/op2OGJuGT7s
	YSSu7NA7LFUPQJY8DPV00SC+IMZupQ3xnbWpYJ7KUrruqyjhX8Sc11yichtCMm6rz06Y17/BtoKat
	H6QzUqi0WjwRC8lUDDpMnrq49cbp/hYxlqNNcNMvet958k06/qeWFA7cv4D8ADthNyEecNiwYlSny
	GXSuKavWHQCvriNMMv2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x112h-00000009HwC-34R2;
	Mon, 31 Aug 2026 12:23:15 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x112f-00000009Hva-2l4Y
	for linux-mtd@lists.infradead.org;
	Mon, 31 Aug 2026 12:23:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BB6421A18F3;
	Mon, 31 Aug 2026 12:23:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8E41B60231;
	Mon, 31 Aug 2026 12:23:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B04C311C78B90;
	Mon, 31 Aug 2026 14:23:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788178990; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=O+MtEEzTjD1QAcLsUMrTVaxleDH6h75xowjVsW4s9yo=;
	b=fgyGWfXnZkPulfXWiljh1y8wEdoJIJnTlBH1wwJd8BmN8FqlD5mOHaYCLtsEgod2wuwby/
	OzXTJeAagZiNJCZ2yBw7IYu2SqTxophFoewB1IEhDrZCixFbacTTktsyXY3LS3ac+jzh/k
	+nE05GP6CkKtiVEjVDDIvj78HOltsZRisr3ySSfAG8CmafCBC6WC2ODHEV0PikB8sv1RIO
	HMAlB8050cACOykrLeMeoYSlvKqOsAypqJJHv9pmlVo7lYZ8bS9x9mKg0zwdFM1UD8d7/c
	rLkayQ9W4Xcm4MZroCMPdceqEZPvRWhM/mP+ixPHdH+O3YYHC6w2ef99+IKXHw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Stefan Agner <stefan@agner.ch>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Boris Brezillon
 <bbrezillon@kernel.org>,  Frieder Schrempf <frieder.schrempf@kontron.de>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mtd: rawnand: vf610_nfc: fix false bitflips on
 reads of erased pages
In-Reply-To: <20260831114000.1844796-3-mehmet.fide@gmail.com> (Mehmet Fide's
	message of "Mon, 31 Aug 2026 13:40:00 +0200")
References: <20260828085337.3916199-3-mehmet.fide@gmail.com>
	<871pbed8mc.fsf@bootlin.com>
	<20260831114000.1844796-3-mehmet.fide@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 31 Aug 2026 14:23:07 +0200
Message-ID: <87y0dma384.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_052313_836335_C24A1FA0 
X-CRM114-Status: GOOD (  14.68  )
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

T24gMzEvMDgvMjAyNiBhdCAxMzo0MDowMCArMDIsIE1laG1ldCBGaWRlIDxtZWhtZXQuZmlkZUBn
bWFpbC5jb20+IHdyb3RlOgoKPiBIaSBNaXF1ZWwsCj4KPj4gY2hpcC5lY2Muc2l6ZSBpcyBub3Qg
Y292ZXJpbmcgdGhlIHdob2xlIGRhdGEgYnVmZmVyLiBZb3Ugc2hvdWxkIGJlCj4+IHJlYWRpbmcg
bXRkLT53cml0ZXNpemUgKyBtdGQtPm9vYnNpemUsIG5vPyBPdGhlcndpc2UgeW91IG9ubHkgb3Zl
cndyaXRlCj4+IHRoZSBmaXJzdCBFQ0Mgc3RlcCAob3V0IG9mIDIvNC84IGRlcGVuZGluZyBvbiB0
aGUgY29uZmlndXJhdGlvbiBvZgo+PiB0aGUgRUNDIGVuZ2luZSkuCj4KPiBPbiB0aGlzIGNvbnRy
b2xsZXIgdGhlcmUgaXMgb25seSBldmVyIG9uZSBzdGVwOiBhdHRhY2hfY2hpcCgpIHJlamVjdHMK
PiBhbnkgaHdlY2Mgc2V0dXAgd2hlcmUgZWNjLnNpemUgZGlmZmVycyBmcm9tIHRoZSBwYWdlIHNp
emUgKCJTdGVwIHNpemUKPiBuZWVkcyB0byBiZSBwYWdlIHNpemUiKSBhbmQgdGhlIGVuZ2luZSBw
cm90ZWN0cyB0aGUgd2hvbGUgcGFnZSBpbiBvbmUKPiBnbywgc28gZWNjLnNpemUgYWx3YXlzIGVx
dWFscyB0aGUgZnVsbCBkYXRhIGFyZWEgaGVyZS4gQnV0IHlvdSBhcmUKPiByaWdodCB0aGF0IG10
ZC0+d3JpdGVzaXplIHNheXMgdGhhdCBtdWNoIG1vcmUgY2xlYXJseSwgc28gSSB3aWxsIHVzZSBp
dAo+IGluIHYzLgoKQWggb2ssIHRoZW4geWVzIHRoYXQgd291bGQgYmUgbmljZS4KCj4+IFVucmVs
YXRlZCwgYnV0IHRoaXMgY29tbWVudCBpcyB3cm9uZywgd2UgYWNjZXB0IHVwIHRvIDxzdHJlbmd0
aD4KPj4gYml0ZmxpcHMuIE5vdCBhIGJpZyBkZWFsIHRob3VnaCwgdGhlIGltcGFjdCBpcyB2ZXJ5
IGxpbWl0ZWQuCj4KPiBJIHdpbGwgcmV3b3JkIHRoYXQgY29tbWVudCBpbiB2MyB0byBtYXRjaCB3
aGF0IHRoZSBjb2RlIGFjdHVhbGx5IHBhc3Nlcwo+ICh0aGUgZHJpdmVyJ3MgaGlzdG9yaWMgdGhy
ZXNob2xkIG9mIGhhbGYgdGhlIHN0cmVuZ3RoKS4gSWYgeW91IHdvdWxkCj4gcmF0aGVyIHNlZSB0
aGUgdGhyZXNob2xkIGl0c2VsZiBhbGlnbmVkIHRvIDxzdHJlbmd0aD4sIEkgY2FuIHNlbmQgdGhh
dAo+IGFzIGEgc2VwYXJhdGUgY2xlYW51cCBzbyBpdCBkb2VzIG5vdCBoaWRlIGluIGEgZml4LgoK
RG8gbm90IGhpZGUgaXQgaW5kZWVkLCBsZXQgdGhlIHRocmVzaG9sZCBhcyBpdCBpcyBmb3IgdGhp
cyBzZXJpZXMuIElmCnlvdSB3YW50LCB5b3UgbWF5IHNlbmQgYSBwYXRjaCB0byBpbmNyZWFzZSB0
aGF0IHRocmVzaG9sZC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
