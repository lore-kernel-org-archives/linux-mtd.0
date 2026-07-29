Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27069C53219
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jul 2026 07:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Op5fNfnkAIv9c/SM3deT8Sre+saKf+BP4eySEIdeyv4=; b=0LjeREb3CLzJ8w
	xPqxvM0bpJjdt9YsFA8cK4aqeThAyxmCxPTChwC+TsjzfNEN6cOM/zN9I/wScgNMJm7eIdv6+sTwQ
	RDpfkEcpYTlLklumEEtSMB/FEYKIqd+P+KCL6Y5i82JJ5IJxHlnKvsvtF/VKYmuyoG0GvDOsr9BUM
	GVb3XoL5Wia67//3ERJdbrhOnTz9WguBBg1Oplzn9QeCMasf/fyrPhtNfu/U22AqDrupP5rBJg7dI
	EaORVOE4+4Oxs1YCaVnnBshPteT/UkXYUulVuumbN/kih3kHmDvsb3bv3YmySNxthyepxmFRgklrC
	sSFejnRLnuduiy7Ctgjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyuC-0000000794B-3TRT;
	Wed, 29 Jul 2026 07:40:44 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyu9-0000000793e-22IN
	for linux-mtd@lists.infradead.org;
	Wed, 29 Jul 2026 07:40:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6E6A51A12EC;
	Wed, 29 Jul 2026 07:40:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3D2426039A;
	Wed, 29 Jul 2026 07:40:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4835F11C14A49;
	Wed, 29 Jul 2026 09:40:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785310831; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hE2Ha2ZiGQjrOGDovN/QBZqFu9ljpsNoifwSJ88Vyfk=;
	b=gj0T2ZqihuRHkM04gRYJjNy1Juv7BSmKFzqgepYpYKvn/+8dT2rVpWCF8x0R13/+RjFu+X
	SKdw1C/L0O8qa6ZlWTDJuzsuFNEbihbHP0IydOzJatJiMHRSn95I6f1m5LNQjiR17n4UDL
	xIPmnTRWBRIZRkLEfOW0JZlLaVY/m7fAcFxA2XUHF5aPKTpx/WMWHEZJm1de7j0Xvkcax7
	bFcJd20pVhOLoe+LBltdHIGFLpo2eXpYUeSREn3MsX86VBNUZKHQgiimPQjBnDRvp+zPNR
	Zu0NleDpYPdXR3m3m/825zM3ykro4jX41JiVXhVNw4iN4vZ7H2G/TEw4wEP0bw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  praneeth@ti.com,  u-kumar1@ti.com,  p-mantena@ti.com,  a-dutta@ti.com,
  s-k6@ti.com,  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH RFC 1/4] spi: spi-mem: Flag DQS capability
In-Reply-To: <9aaeca54-292a-42f7-90d6-a533ff1f5022@sirena.org.uk> (Mark
	Brown's message of "Thu, 5 Feb 2026 19:11:45 +0000")
References: <20260205-winbond-nand-next-phy-tuning-v1-0-5e7d3976f0f1@bootlin.com>
	<20260205-winbond-nand-next-phy-tuning-v1-1-5e7d3976f0f1@bootlin.com>
	<9aaeca54-292a-42f7-90d6-a533ff1f5022@sirena.org.uk>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 29 Jul 2026 09:40:27 +0200
Message-ID: <87ik5yp7kk.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_004041_662358_4A1104DE 
X-CRM114-Status: GOOD (  12.35  )
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

SGVsbG8gTWFyaywKCk9uIDA1LzAyLzIwMjYgYXQgMTk6MTE6NDUgR01ULCBNYXJrIEJyb3duIDxi
cm9vbmllQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBUaHUsIEZlYiAwNSwgMjAyNiBhdCAwODow
Njo1OFBNICswMTAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBEUVMgaXMgYSB0eXBpY2FsIFNQ
SSBtZW1vcnkgc2lnbmFsIHVzZWQgdG8gaGVscCB3aXRoIHJlYWRpbmcgdGhlIGRhdGEgb24KPj4g
dGhlIGJ1cyBhdCBoaWdoIHNwZWVkcyAoZXNwZWNpYWxseSBpbiBEVFIgbW9kZSkgYnkgYXZvaWRp
bmcgY2xvY2sKPj4gc2tld3MuIFRoZSBjaGlwIGdlbmVyYXRlcyBhIGNsb2NrIHNpZ25hbCBzeW5j
aHJvbml6ZWQgd2l0aCBpdHMgZGF0YQo+PiBvdXRwdXQgZnJvbnRzLCBhbHNvIGNhbGxlZCBkYXRh
IHN0cm9iZS4KPgo+IEFja2VkLWJ5OiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+Cj4K
PiBUaGlzIHNlZW1zIGZpbmUgaWYgdGhlIHJlc3Qgb2YgdGhlIHNlcmllcyBpcyBmaW5lOyBpZiBw
ZW9wbGUgbGlrZSB0aGlzCj4gYXBwcm9hY2ggdGhlbiBpdCdzIHByb2JhYmx5IHNlbnNpYmxlIHRv
IG1lcmdlIGFsb25nIHdpdGggdGhlIE1URCBwYXRjaGVzCj4gdXNpbmcgaXQgYW5kIHRoZW4gc2Vu
ZCBtZSBhIHRhZyB3aXRoIHRoZSBTUEkgYml0IGZvciBtZSB0byBhcHBseSB0aGUKPiBTUEkgZHJp
dmVyIGNoYW5nZXMuCgpBZnRlciByZXZpZXdpbmcgYWdhaW4gdGhlIHNlcmllcyBmcm9tIFNhbnRo
b3NoLCBJIGZlZWwgbGlrZSB0aGlzIHdpbGwgaW4KdGhlIGVuZCBiZSBuZWVkZWQuIFNpbmNlIHRo
ZXJlIGhhcyBiZWVuIG5vIG5lZ2F0aXZlIGZlZWRiYWNrIG9uIGl0LAp3b3VsZCB5b3UgbWluZCB0
YWtpbmcganVzdCBwYXRjaCAxIG9mIHRoaXMgc2VyaWVzICh0aGUgc3BpLW1lbSBwYXRjaCk/IEkK
d2lsbCBub3QgYXBwbHkgdGhlIHJlc3Qgb2YgdGhlIHNlcmllcyBmb3IgdGhpcyBjeWNsZSwgSSB3
aWxsIHdhaXQgZm9yCnRoZSBuZXh0IG9uZSAoYW5kIHdlIHN0aWxsIG5lZWQgdG8gZmluZCBhbiBh
Z3JlZW1lbnQgb24gcGF0Y2ggNC80KS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
