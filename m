Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292A2C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Jan 2022 20:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8opD8oU+eOFKiO1PslHkYYZq/nSV8mK/dQOI7e34ddE=; b=HvhJnuDDcTBzfB8TvHULEv9iHS
	X6P7tJyFbwCe9W8k7fO+8YW2tGxQOLawKXlCDrINV8B4obCr96SF5//mAzPADqAAL8EucaMb4tH4O
	Jc7Fftp1BtIC7+1cjJymZOKXU4zq3kYI9I2oKAm9gBD743y5IeI8ACsetWjiaLVl8ujStn8TGpV3t
	5dLB1MMK4lc0pPxo1XA7XZBl+EmQ7XdLCrmujT/HzkdRXtzdghFL4PBawCRwLnYB/ZgVrfesaZGI7
	RWESMQqJ2dPstEGPAIKfQIPWqmPHjDJ9HlE/ONQqBxwMutDlLYtlJ5QwR5irm5+jC2J6U+tqccV//
	1lc1yOWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n71kA-00DJvy-81; Mon, 10 Jan 2022 20:58:18 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n71k7-00DJuG-7a
 for linux-mtd@lists.infradead.org; Mon, 10 Jan 2022 20:58:16 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 5C65062DA5FB;
 Mon, 10 Jan 2022 21:58:10 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id RAHJdIL0P3bg; Mon, 10 Jan 2022 21:58:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id E388762DA5E9;
 Mon, 10 Jan 2022 21:58:09 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id jyuw6j3iyUF7; Mon, 10 Jan 2022 21:58:09 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 7B3FA60CEF32;
 Mon, 10 Jan 2022 21:58:09 +0100 (CET)
Date: Mon, 10 Jan 2022 21:58:09 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 mcoquelin stm32 <mcoquelin.stm32@gmail.com>, 
 kirill shutemov <kirill.shutemov@linux.intel.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1600520564.248110.1641848289201.JavaMail.zimbra@nod.at>
In-Reply-To: <1422943582.246718.1641809643674.JavaMail.zimbra@nod.at>
References: <20211227032246.2886878-1-chengzhihao1@huawei.com>
 <20211227032246.2886878-6-chengzhihao1@huawei.com>
 <1985807262.244880.1641762859448.JavaMail.zimbra@nod.at>
 <0477fadd-dfb5-c581-ee6a-ed6df9a966a3@huawei.com>
 <1422943582.246718.1641809643674.JavaMail.zimbra@nod.at>
Subject: Re: [PATCH v6 05/15] ubifs: Rename whiteout atomically
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF95 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Rename whiteout atomically
Thread-Index: Of79WMESjxJ46JfpBVi92+tw9bYfxnfO/hPX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_125815_449895_A8382169 
X-CRM114-Status: UNSURE (   5.80  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBUaGUgd2hpdGVvdXQgaW5vZGUgaXMg
Y2xlYW4gYWZ0ZXIgY3JlYXRpb24gZnJvbSBjcmVhdGVfd2hpdGVvdXQoKSwgYW5kCj4+IGl0IGNh
bid0IGJlIG1hcmtlZCBkaXJ0eSB1bnRpbCB1Ymlmc19qbmxfcmVuYW1lKCkgZmluaXNoZWQuIFNv
LCBJIHRoaW5rCj4+IHRoZXJlIGlzIG5vIGNoYW5jZSBmb3Igd2hpdGVvdXQgYmVpbmcgd3JpdHRl
biBvbiBkaXNrLiBUaGVuLAo+PiAndWJpZnNfYXNzZXJ0KGMsICF3aGl0ZW91dF91aS0+ZGlydHkp
JyBuZXZlciBmYWlscyBpbiB1Ymlmc19qbmxfcmVuYW1lKCkKPj4gZHVyaW5nIG15IGxvY2FsIHN0
cmVzcyB0ZXN0cy4gWW91IG1heSBhZGQgc29tZSBkZWxheSBleGVjdXRpb25zIGFmdGVyCj4+IHdo
aXRlb3V0IGNyZWF0aW9uIHRvIG1ha2Ugc3VyZSB0aGF0IHdoaXRlb3V0IHdvbid0IGJlIHdyaXR0
ZW4gYmFjawo+PiBiZWZvcmUgdWJpZnNfam5sX3JlbmFtZSgpLgo+IAo+IEZyb20gVUJJRlMgcG9p
bnQgb2YgdmlldyBJIGZ1bGx5IGFncmVlIHdpdGggeW91LiBJJ20ganVzdCBhIGxpdHRsZSBwdXp6
bGVkIHdoeQo+IG90aGVyIGZpbGVzeXN0ZW1zIHVzZSB0aGUgdG1wZmlsZSBhcHByb2FjaC4gTXkg
ZmVhciBpcyB0aGF0IFZGUyBjYW4gZG8gdGhpbmdzCj4gdG8gdGhlIGlub2RlIHdlIGRvbid0IGhh
dmUgaW4gbWluZCByaWdodCBub3cuCgpBZnRlciBkaWdnaW5nIGEgYml0IGludG8gWEZTIEknbSBz
dXJlIHlvdXIgYXBwcm9hY2ggaXMgb2theS4KU28sIFVCSUZTIGNhbiBkbyBhIHdoaXRlb3V0IHdp
dGhvdXQgaGVscCBvZiB0bXBmaWxlcy4gOi0pCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
