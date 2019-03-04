Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BAA6C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 11:55:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 136AB2070B
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 11:55:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZlWn3TRL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PYy3NWiW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 136AB2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xAaCpnuoiBJ+Bv54pbVMNNrt3LMb6nyYkxiTQAcQeLA=; b=ZlWn3TRLeymIx1
	TYG6jlV7P9uV0EscO4Z8tmfo78HyEh8zweLE03zLWfm1N9/bkee6K31LzprCAbHiAv+9uWW9fLKEo
	odLMIbiwBpO+1UZ8mnO+1RMjXoAFiFWDWyJMCZEjRb3SalRXJOJEsgmY42zCSffzgGrZNqc+riryf
	viP4qxDtMZtkwjEa3MB32WL27FGXDihvuoPI4k7hzQX/3zFpUlm9+wDclx2X8bY8ZgV9ixkm5cocr
	zpR2RN0V584EkAYlE0cXQLX9tEWAjh2diiIaBgJV76eaw1BaFpAFv0xs/vCcr9P1iXr+XXuLGCXwm
	WIj6zcd4aVSatzYM3jVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0mBs-0003JF-Km; Mon, 04 Mar 2019 11:55:28 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0mBr-0003J8-5G
 for linux-mtd@bombadil.infradead.org; Mon, 04 Mar 2019 11:55:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PINY0eytTN0PbDrokVhkAndD7h2lNP3PJCicqvPKvfM=; b=PYy3NWiWCqYmACV4WqQB/FpmEJ
 ETeamMb1ZZhY6Bs6BDvMDguFwYXEoW4HTVYaMWc4m2DNp0rMHlnjVCzreCXNvCnHachtdqHCyE3mq
 WCTdMDRFt8QwX4YGsk2wqlI2wAOtA5FVTw5lWZMmIoXs2FRx1MLgWtrid4sx5g7xkfbw8ebYb6IPN
 XbHDzVe4Tsm8ftVFFvH8keIBCycuGAbFBC+Alv2yktPOGVYY+JZM2TQXJHoM+/bGRTtzk004/7616
 0CAsUXHhzBHAJB1ppjNsZZ/XN+oTc5uUAjOz1HFIb6Zgbka9VQM4S6ps3CCreklE+xL7Ka8XiVjEZ
 vKu/qItA==;
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0mBk-00045W-T4
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2019 11:55:25 +0000
X-Originating-IP: 90.88.147.150
Received: from xps13 (aaubervilliers-681-1-27-150.w90-88.abo.wanadoo.fr
 [90.88.147.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 7F9364000D;
 Mon,  4 Mar 2019 11:54:36 +0000 (UTC)
Date: Mon, 4 Mar 2019 12:54:35 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wolfgang Grandegger <wg@grandegger.com>
Subject: Re: i.MX28 nand driver broken in Linux 4.18
Message-ID: <20190304125435.0e33d362@xps13>
In-Reply-To: <8ec3f0b1-b288-d208-c0e4-431b49719d08@grandegger.com>
References: <8ec3f0b1-b288-d208-c0e4-431b49719d08@grandegger.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_065521_057930_CBF6D40E 
X-CRM114-Status: UNSURE (   8.66  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgV29sZmdhbmcsCgpXb2xmZ2FuZyBHcmFuZGVnZ2VyIDx3Z0BncmFuZGVnZ2VyLmNvbT4gd3Jv
dGUgb24gRnJpLCA4IEZlYiAyMDE5CjEwOjI3OjE5ICswMTAwOgoKPiBIZWxsbywKPiAKPiBJJ20g
dXBncmFkaW5nIHRoZSBCU1Agb2YgbXkgaS5NWDI4IGJvYXJkIHRvIExpbnV4IDQuMTguIFVuZm9y
dHVuYXRlbHksCj4gdGhlIE5BTkQgZHJpdmVyIGRvZXMgbm90IHdvcmtpbmcgYW55IGxvbmdlci4g
SGVyZSBpcyB0aGUgb3V0cHV0IG9mCj4gIm5hbmR0ZXN0IiBpbmNsdWRpbmcgdGhlIGtlcm5lbCBt
ZXNzYWdlczoKPiAKCkNvdWxkIHlvdSBmaW5kIGEgc29sdXRpb24gb3IgYXQgbGVhc3QgYmlzZWN0
ZWQgYW5kIGZvdW5kIHRoZSBjdWxwcml0PwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
