Return-Path: <SRS0=0U+/=U6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB08C5B578
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2019 07:11:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 019F920B7C
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2019 07:11:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WpCD7uS6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 019F920B7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wDS10JFimh+C6UI9ltCUN+JWiXSQFPa/WUl3gooKoV8=; b=WpCD7uS6JXw7Zh
	OrB8MGqDdY01//mdf7z3IsDTST6YALFI/3E/OW7DsndsScUQOnBXgzTlLptLoUCsxTdRanRHAM6AH
	zXr1VLPaZybtp+bx5wvkI1a0NkV8TgCmphEVSGU+pVj7re43W7AKZQuYBYvvxDgedtD4zU5Ge8Uy8
	BHaIBIT6YNCtocmrqoHtp3A5JM1NfMZrv5/GH5kK9RRNNB/mwg4Fcb8QeXp32DLEbBsD58DKPG3yh
	Og6qXFGm7WcRJahkVYGMBtmoAY5XxwjeTUNy3B6JyIicKs/X9l8trOA/OSkMOBnV7t8Hx0d7e0yDt
	3WsFZfZB1EMShfvnfl9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhqTY-0000Zf-CQ; Mon, 01 Jul 2019 07:11:44 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhqTU-0000Yb-Tw
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2019 07:11:42 +0000
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 8BDFD240009;
 Mon,  1 Jul 2019 07:11:29 +0000 (UTC)
Date: Mon, 1 Jul 2019 09:11:28 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>
Subject: Re: [PATCH] mtd: rawnand: stm32_fmc2: avoid warnings when building
 with W=1 option
Message-ID: <20190701091128.4e67f1de@xps13>
In-Reply-To: <1561128189-14411-1-git-send-email-christophe.kerello@st.com>
References: <1561128189-14411-1-git-send-email-christophe.kerello@st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190701_001141_114520_39142FFB 
X-CRM114-Status: UNSURE (   6.72  )
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
Cc: vigneshr@ti.com, bbrezillon@kernel.org, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQ2hyaXN0b3BoZSwKCkNocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0
LmNvbT4gd3JvdGUgb24gRnJpLCAyMSBKdW4KMjAxOSAxNjo0MzowOSArMDIwMDoKCj4gVGhpcyBw
YXRjaCBzb2x2ZXMgd2FybmluZ3MgZGV0ZWN0ZWQgYnkgc2V0dGluZyBXPTEgd2hlbiBidWlsZGlu
Zy4KPiAKPiBXYXJuaW5ncyB0eXBlIGRldGVjdGVkOgo+IGRyaXZlcnMvbXRkL25hbmQvcmF3L3N0
bTMyX2ZtYzJfbmFuZC5jOiBJbiBmdW5jdGlvbiDigJhzdG0zMl9mbWMyX2NhbGNfdGltaW5nc+KA
mToKPiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYzoxNDE3OjIzOiB3YXJu
aW5nOiBjb21wYXJpc29uIGlzCj4gYWx3YXlzIGZhbHNlIGR1ZSB0byBsaW1pdGVkIHJhbmdlIG9m
IGRhdGEgdHlwZSBbLVd0eXBlLWxpbWl0c10KPiAgIGVsc2UgaWYgKHRpbXMtPnR3YWl0ID4gRk1D
Ml9QTUVNX1BBVFRfVElNSU5HX01BU0spCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBL
ZXJlbGxvIDxjaHJpc3RvcGhlLmtlcmVsbG9Ac3QuY29tPgo+IC0tLQoKQXBwbGllZCB0byBuYW5k
L25leHQsIHRoYW5rcy4KCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
