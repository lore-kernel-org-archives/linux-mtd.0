Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59233C4167B
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Dec 2023 07:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1G9SFVtui5cWdwH8x8c+j/vT23QWPHaGBi2S9xEmwi8=; b=ItD1HJ/z0RDn1b
	IDi7o138U9Tu+BBFN7r+RVolq5F2hQold7nGym4vQDir9rkfZlvaDk6KlQzXlBYWqBZ2sxqzrglQt
	giJjEQ83JAG7bDnEoBlbW0nar9AxtVWu7Rg4zdejUPfAebxLbWrJ/Z3WRJU/3J9wRSmNA7/QWYRpH
	HwfdDiMrYuopmirzU+KuOXJlwKWFjjn9Zft8Iyyo/E7SOWebKxM+MwrJM76acXkjajvvzMTQEjSFy
	HHGLIrNhQKtJGLkY9lInYPeGruWtSDQyUOiahKWhdr7vcso20fK5Vozk9H+41DpFLlWBRAwrYOYa4
	kvzkwHmRZXi7/tgNvayQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA3Yb-003AVJ-2P;
	Mon, 04 Dec 2023 07:39:57 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA3YY-003AUB-0Y
	for linux-mtd@lists.infradead.org;
	Mon, 04 Dec 2023 07:39:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4AD80FF80D;
	Mon,  4 Dec 2023 07:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701675588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cRUKEOLaBNW54hC/SjZRZq9kvMNZbNawFCdC45IWWRs=;
	b=cu9dftXhymvoiaDBauOgIu/E3amisoupSkHWRIOpGs+5BBbSsbJko/wSSTq1Jr4GaQ7QKs
	qoRt+tvo+CAB3GkS+gJKKbNeMxlrtPAaDSVZuueadMiAvKrhBv95gktNzL8k3R8ghwpQFq
	8vNy9m/sewGgTDB9PvLxE8zv1nhjAnbRuyRD2ozH9c3v6zmRoaYTenVhOhHCbIvOT/Ek72
	K26oGwif3UOsi3FBHO/0jcPGlISS/62f+DR26+qbH3zo2fSpxZ0fR5Vih2l7mFoGKUkC7M
	JNG1Eln2WAlj6HHdWkUPwU6jx7VDbynjOJcHYuCK6rwnTwTvJoC6yAiaQgYtCg==
Date: Mon, 4 Dec 2023 08:39:46 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: dregan <dregan@broadcom.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Boris Brezillon
 <boris.brezillon@collabora.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] mtd: rawnand: Add deassert_wp comment
Message-ID: <20231204083939.34f989a9@xps-13>
In-Reply-To: <20231201212446.189491-1-dregan@broadcom.com>
References: <20231201212446.189491-1-dregan@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231203_233954_517838_4B040985 
X-CRM114-Status: UNSURE (   7.45  )
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

SGkgRGF2aWQsCgpkcmVnYW5AYnJvYWRjb20uY29tIHdyb3RlIG9uIEZyaSwgIDEgRGVjIDIwMjMg
MTM6MjQ6NDYgLTA4MDA6Cgo+IEZyb206IERhdmlkIFJlZ2FuIDxkcmVnYW5AYnJvYWRjb20uY29t
Pgo+IAo+IEFkZCBkZWFzc2VydF93cCBkZXNjcmlwdGlvbiBjb21tZW50Cj4gCj4gU2lnbmVkLW9m
Zi1ieTogRGF2aWQgUmVnYW4gPGRyZWdhbkBicm9hZGNvbS5jb20+CgpUaGFua3MsIEkgd2lsbCBw
cm9iYWJseSBzcXVhc2ggaXQgd2l0aCB0aGUgb3JpZ2luYWwgY29tbWl0LgoKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
