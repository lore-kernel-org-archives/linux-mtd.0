Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE2AC282CB
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 22:06:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4647221908
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 22:06:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g35FAbbj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Q5zhsBNV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4647221908
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tg84rMeq1Qb0CjlJ6QcGPMqOCh3qfxcRI6XRh1Iz2VY=; b=g35FAbbjKzTn5H
	UYUxsijewmnypr/wsYGHQMYm3zGIqqnWU+w04sPCqOOWwE/dT9se7ANi3BvNKqIxBUSe2nYRG4Q5c
	0/iYeD28REyKUzpnJQ7BnXlDvE2QFMIlouBUhEAnXTrL7mWBa7K7EjZZOIjryrjt+PMihRWhI2s0N
	m6IM/KhatJQZJ2Rkdeud25MZpO/mrS704z9/fMAGJjs3QfUR5ho2cMY0MQWm+hipbgm8c2wIQPKH4
	zNfJwrbPfKoD5hxFGPzX2BUknOHRyeVdEeGePpmkgwWw1sAoB1tSp386uFRtsQ+zxv0KP/ORkUTy9
	ddG/hhVmEBzmAJN4xQ/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsEHW-0005Kt-6z; Fri, 08 Feb 2019 22:05:58 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsEHV-0005KP-BT
 for linux-mtd@bombadil.infradead.org; Fri, 08 Feb 2019 22:05:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C5Jc5IH3ifG2D7PtNHQEfcFtIlCcEXO2U65Fep9eOzU=; b=Q5zhsBNV8l5Yak5UCL42H6rBZB
 sAYa8BPlXzyesZU8As6OHCGsn/EYFz6HhZ1IzDAhYXofe29AsAqGP8PD+hSoopNkgzcOVa/DCRjcn
 8i2fyxWrLUB+Fh+0CKF7i/5BvIxQG7h9AATK9EfrGJbK/ESgBtmzWwij1zPJTqwYySsd1pMI6RzX6
 6xsXc5/34oFDwV3S8g/9h+uhL/8l061RpaXf/cwiHZEzpZe68Is0anWWtzXb/+S+6s0Bnr+XqJYvQ
 NOF3ejYwsgiMDlbbkCLBbuyZQV0e1dP3sgQdroY4ZOkHTs8B5BI+OEBynfdtBC9wCJzCuu3KTAoz/
 VbPzgsTg==;
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsEHR-0008Tf-UH
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 22:05:55 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 5561A20002;
 Fri,  8 Feb 2019 22:05:12 +0000 (UTC)
Date: Fri, 8 Feb 2019 23:05:11 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 06/11] mtd: rawnand: denali: use more precise timeout
 for NAND_OP_WAITRDT_INSTR
Message-ID: <20190208230511.5ee7c0f1@xps13>
In-Reply-To: <1549613335-30319-7-git-send-email-yamada.masahiro@socionext.com>
References: <1549613335-30319-1-git-send-email-yamada.masahiro@socionext.com>
 <1549613335-30319-7-git-send-email-yamada.masahiro@socionext.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_170554_089040_ABB0009C 
X-CRM114-Status: GOOD (  13.24  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQu
Y29tPiB3cm90ZSBvbiBGcmksICA4IEZlYgoyMDE5IDE3OjA4OjUwICswOTAwOgoKPiBDdXJyZW50
bHksIHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgpIGlzIGFsd2F5cyBwYXNzZWQgaW4gdGhl
Cj4gaGFyZC1jb2RlZCBtc2VjX3RvX2ppZmZpZXMoMTAwMCkuIFRoZXJlIGlzIG5vIHNwZWNpZmlj
IHJlYXNvbiBmb3IKPiAxMDAwIG1zZWMsIGJ1dCBJIGp1c3QgY2hvc2UgaXQgbG9uZyBlbm91Z2gu
Cj4gCj4gV2l0aCB0aGUgZXhlY19vcCgpIGNvbnZlcnNpb24sIE5BTkRfT1BfV0FJVFJEWV9JTlNU
UiBwcm92aWRlcyBtb3JlCj4gcHJlY2lzZSB0aW1lb3V0IHZhbHVlLCBkZXBlbmRpbmcgb24gdGhl
IHByZWNlZGluZyBjb21tYW5kLiBMZXQncyB1c2UKPiBpdCB0byBiYWlsIG91dCBlYXJsaWVyIGlu
IGVycm9yIGNhc2UuCgpJJ20gbm90IHN1cmUgdXNpbmcgMTBtcyBpbnN0ZWFkIG9mIDEwMDBtcyBp
cyByZWxldmFudCBpbiB0aGUgYmVsb3cKY2FzZXMsIDEwbXMgaXMgcmF0aGVyIHNob3J0IGZvciBh
biBJUlEsIGlmIHlvdXIgc3lzdGVtIGlzIHVuZGVyIGxvYWQKeW91IG1pZ2h0IGVuZCB1cCB3aXRo
IGEgdGltZW91dCwgbm90IGJlY2F1c2UgdGhlIHJpZ2h0IElSUSBkaWQgbm90CmZpcmUsIGJ1dCBi
ZWNhdXNlIHRoZSBoYW5kbGVyIHdhcyBub3QgZXhlY3V0ZWQgeWV0IChpdCBoYXBwZW5lZCB0byBt
ZQppbiB0aGUgbWFydmVsbF9uYW5kLmMgZHJpdmVyIHJlY2VudGx5KS4KCkFsc28sIHdvdWxkIHlv
dSBtaW5kIHVzaW5nIGEgZGVmaW5lIGluc3RlYWQgb2YgaGFyZGNvZGluZyAnMTAwMCc/CiAKPiAK
PiBJIGFtIHN0aWxsIGtlZXBpbmcgdGhlIGhhcmQtY29kZWQgdmFsdWVzIGZvciBvdGhlciBoaWdo
ZXIgbGV2ZWwgaG9va3MKPiBzdWNoIGFzIHBhZ2VfcmVhZCwgcGFnZV93cml0ZSwgZXRjLiBXZSBr
bm93IHRoZSB2YWx1ZSBvZiB0UiwgdFBST0csIGJ1dAo+IHdlIGhhdmUgdW5rbm93bGVkZ2UgYWJv
dXQgdGhlIGRhdGEgdHJhbnNmZXIgc3BlZWQgb2YgdGhlIERNQSBlbmdpbmUuCj4gCj4gU2lnbmVk
LW9mZi1ieTogTWFzYWhpcm8gWWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4K
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
