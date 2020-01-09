Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 856A1C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 18:43:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B8BD20678
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 18:43:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aWG0LArN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B8BD20678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O3FegbE663dYQurQaFwMIa9EM/VkVAtTtPscFcOKtpk=; b=aWG0LArNez4ozN
	Fz5MVoe3TAIC7fX5c9thQotv9p5ErfqBoY8mpc6IFyRHhDQtaiiO7rMr0JnE5viFYLnKVmCS00ywm
	b5VaJgMYD19Ktk99KoKthOPNbNeBsPm+KT0VT8+eR7NqfDF4HpugIZPfkU+1g5o+F2+mjNNX3YXLc
	XT7eEQToe0P2g9r9+RGtDZ4m5IIvc0cVHkFc+eiQBY8YT5f+IkBRpmSaGDgrzRBGNpGnqo9PGxRYG
	NDH7714+RSR3o9VeCJ8oi9YBlmqH+NQDqqhwNJ/vlDFJ4HRc8+OUkaI3pmWfqtawmr1gr/voQCCZW
	BWe1vUU1AlxGAhBbVOrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipclx-0000MG-Qm; Thu, 09 Jan 2020 18:43:09 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipclu-0000Lz-JN
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 18:43:07 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 60B8B607BD9A;
 Thu,  9 Jan 2020 19:43:05 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id nmIIs98Jad-u; Thu,  9 Jan 2020 19:43:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 09D87607BDA1;
 Thu,  9 Jan 2020 19:43:05 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id QknWKc_qJtTA; Thu,  9 Jan 2020 19:43:04 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id D3BBB607BD9A;
 Thu,  9 Jan 2020 19:43:04 +0100 (CET)
Date: Thu, 9 Jan 2020 19:43:04 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-ID: <1737779363.17836.1578595384783.JavaMail.zimbra@nod.at>
In-Reply-To: <20200109191304.636c82e7@xps13>
References: <20191230111948.27005-1-miquel.raynal@bootlin.com>
 <1651325521.16954.1578526458487.JavaMail.zimbra@nod.at>
 <20200109191304.636c82e7@xps13>
Subject: Re: [PATCH v2] mtd: implement proper partition handling
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: implement proper partition handling
Thread-Index: 2SSdKQICb2k4mjS8uT/t3ysnHQiQog==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_104306_784839_31EE6FB8 
X-CRM114-Status: UNSURE (   7.59  )
X-CRM114-Notice: Please train this message.
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

TWlxdWVsLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBXaGF0IHByb2JsZW0g
ZG9lcyB0aGlzIHNvbHZlPwo+PiAuLi5iZXNpZGUgb2YgYSBuaWNlIGRpZmZzdGF0IHdoaWNoIHJl
bW92ZXMgbW9yZSB0aGFuIGl0IGFkZHMuIDotKQo+IAo+IEl0IGlzIG11Y2ggZWFzaWVyIHRvIGVz
Y2FsYWRlIHRvIHRoZSB0b3AgbW9zdCAibWFzdGVyIiBkZXZpY2Ugd2hlbgo+IHRoZXJlIGFyZSBt
dWx0aXBsZSBsZXZlbHMgb2YgcGFydGl0aW9uaW5nLCB3aGljaCB3YXMgbm90IGNsZWFubHkKPiBk
ZXNjcmliZWQgSU1ITy4gQWxzbyBpdCBpcyBhbHJlYWR5IHVzZWQgaW4gdGhlIE1MQy1pbi1wc2V1
ZG8tU0xDLW1vZGUKPiBzZXJpZXMgOikKCk9rLiBJbiBmYWN0IEkgImZvdW5kIiB0aGlzIHBhdGNo
IG15IGxvb2tpbmcgYXQgdGhlIFNMQyBlbXVsYXRpb24gcGF0Y2hlcy4KCj4+ID4gK3N0YXRpYyBp
bmxpbmUgc3RydWN0IG10ZF9pbmZvICptdGRfZ2V0X21hc3RlcihzdHJ1Y3QgbXRkX2luZm8gKm10
ZCkKPj4gPiArewo+PiA+ICsJd2hpbGUgKG10ZC0+cGFyZW50KQo+PiA+ICsJCW10ZCA9IG10ZC0+
cGFyZW50Owo+PiA+ICsKPj4gPiArCXJldHVybiBtdGQ7Cj4+ID4gK30KPj4gCj4+IFNvLCBwYXJl
bnQgPT0gbWFzdGVyPwo+IAo+IHRvcCBtb3N0IHBhcmVudCAodGhlIG9uZSB3aXRob3V0IHBhcmVu
dCkgPT0gbWFzdGVyICEKPiAKPj4gCj4+IFdoZW4gSSBjcmVhdGUgYSBNVEQgb250b3Agb2YgVUJJ
IHVzaW5nIGdsdWViaSwgd2hvIHdpbGwgYmUgcGFyZW50L21hc3Rlcj8KPiAKPiBJIGRvbid0IHJl
YWxseSB1bmRlcnN0YW5kIHRoZSBpc3N1ZSBoZXJlPwoKTGV0J3Mgc2F5IEkgaGF2ZSBtdGQwIHdp
dGggYW4gdWJpIGFuZCBhIHZvbHVtZSAieHh4Ii4gQWZ0ZXIgZW5hYmxpbmcKZ2x1ZWJpIGEgbmV3
IG10ZDEgd2lsbCBhcnJpdmUgb24gdGhlIHN5c3RlbS4KVGhlIHN0YWNraW5nIGlzIG10ZDAgLT4g
dWJpICh2b2x1bWUgeHh4KSAtPiBtdGQxLgpJcyBub3cgYSByZWxhdGlvbnNoaXAgYmV0d2VlbiBt
dGQxIGFuZCBtdGQwPwoKSSdkIGV4cGVjdCBtdGQxJ3MgcGFyZW50IGJlaW5nIG10ZDAuCgpUaGFu
a3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
