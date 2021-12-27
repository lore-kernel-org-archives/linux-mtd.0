Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862AAC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Dec 2021 13:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AlZ51xX+kfF9aKk6cC4VCsC8w01je32i9NrTJWhyjgA=; b=HEToBAj26aGjIw1LhmZ4Ccegjt
	OBL6iC8XRlsi9l+MnvTGfVAsZC7v8KWGTPQ2eCTtRcO2TWayPUd2TklK3tBorukyPZ+M2BsEZlqnB
	oa0F3M+6R9H2h513Jf4w388dHNXswe2cv7hZXELWlqffmg3ElYxwFnBys8aKpRssz1E32aCL5EcbY
	YmjHb4pGV62Lwfu9wDq5SF6dvUu1s2QyMySKudogVDnWaSlfskk7nvzyi08ZVSDHuf8FFEbLt5MiM
	CAacTctCBG7HQPWDSF5uIzdR4Q3nf+8RPKzDnuEyn9gLwfGvBczKaGy2udOHvxBGdAJbEEoHGNGgJ
	XgrjTdjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1pbk-00Gl0p-6B; Mon, 27 Dec 2021 13:00:08 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1pbh-00Gl0E-FW
 for linux-mtd@lists.infradead.org; Mon, 27 Dec 2021 13:00:07 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4F12C62DA5F3;
 Mon, 27 Dec 2021 14:00:02 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id HN3e-WWCzBZK; Mon, 27 Dec 2021 14:00:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id D7F0862DA5E9;
 Mon, 27 Dec 2021 14:00:00 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id F-fq7s-YxLAv; Mon, 27 Dec 2021 14:00:00 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id AE53A62DA5F3;
 Mon, 27 Dec 2021 14:00:00 +0100 (CET)
Date: Mon, 27 Dec 2021 14:00:00 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 mcoquelin stm32 <mcoquelin.stm32@gmail.com>, 
 kirill shutemov <kirill.shutemov@linux.intel.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <386802593.207123.1640610000622.JavaMail.zimbra@nod.at>
In-Reply-To: <adc72750-7aca-bb6e-6921-fcaad89485bd@huawei.com>
References: <20211227032246.2886878-1-chengzhihao1@huawei.com>
 <1020444725.206730.1640599987424.JavaMail.zimbra@nod.at>
 <adc72750-7aca-bb6e-6921-fcaad89485bd@huawei.com>
Subject: Re: [PATCH v6 00/15] Some bugfixs for ubi/ubifs
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF95 (Linux)/8.8.12_GA_3809)
Thread-Topic: Some bugfixs for ubi/ubifs
Thread-Index: /47XJNMuQTXoGeu4dNvT3yEbYre1rw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_050005_717622_B506BDF9 
X-CRM114-Status: UNSURE (   2.33  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+PiBUaGFua3MgYSBsb3QgZm9yIGFsbCB0aGlzIGZpeGVz
ISBJIHdpbGwgc3RhcnQgcmV2aWV3aW5nL3BpY2tpbmcgdGhlbSBhbgo+PiBhcyBzb29uIHRoZSBz
ZXJpZXMgaXMgc3RhYmxlLgo+PiBTbyBwbGVhc2UgZG9uJ3QgcmVzZW5kIGV2ZXJ5dGhpbmcgaWYg
eW91IG9ubHkgYWRkIGEgbmV3IHBhdGNoLgo+IE9LLiBOZXcgcGF0Y2hlcyhJZiBJIGZpbmQgbmV3
IGJ1Z3MpIHdpbGwgYmUgc2VudCBpbmRlcGVudGx5LiB2NiBzZXJpZXMKPiBpcyBjbG9zZWQuCgpU
aGFua3MhIFlvdXIgZml4ZXMgYXJlIG1vc3QgYXBwcmVjaWF0ZWQhCgpUaGFua3MsCi8vcmljaGFy
ZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
