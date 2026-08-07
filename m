Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEBFC2A09B
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 13:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NuonI8z9Qs3TfB5gPZoY/n8w+x2tZMLV6ftZ+dIB6Yk=; b=4TsHsin/NPKywy
	0K7eZDygngVPinY55nq2fPNZOvsOxCNzT5DWeXvoT8s1VCCpaX42onnuvBjkfWjoN8i1kUMgr9D2K
	FB1y1TBam8aD48PhkyceFOhSFu1ZejuLahVAEjtYmXmvQ5DiatojPi675Whyfl0fwehe05QSqdJqY
	b0yJLLGfdyKMhUAaONeUrwvrv+3q4YjkipbglQCHkbDFVtbqTlSpDzawEwFButTW9Tx9+o0lzviK0
	ObS23DI58c0nYICN6JEq+YM53dkXIeRwVp9lyG/nmzYmQ+ONFgi3PQaJ9kLfladOQJmekWBKEjECE
	UxHbl1nDcXEH6x7aRaKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL4C-00000008CW5-3HLS;
	Fri, 07 Aug 2026 13:56:56 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL48-00000008CTw-3w37
	for linux-mtd@lists.infradead.org;
	Fri, 07 Aug 2026 13:56:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3CE304E4113A;
	Fri,  7 Aug 2026 13:56:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 10E1C603F0;
	Fri,  7 Aug 2026 13:56:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A8BB511C37957;
	Fri,  7 Aug 2026 15:56:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786111010; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=U20/yY8yeUPz0vFOmPve6+pxju/thQDS8zZ9i8plDZI=;
	b=m4ld7mcJ/8EvQhONDlGD3pR38SbYmnCTvxubioEBqPAUzm7bhBULx9dbfKH4lL2azlkpou
	oG8OxnurCtS0pdyRJYK2yw1yUU0Z6gFVe82+ZaKQkF5VfoKtNQ3jNRpNH7PTZcAWowhun1
	Qddkl9fFmIuhmAaYFEOtMBOPxAddmV65ZOtMZkuYKagr4vtnNf7qkpK5+K8Su9p76WpiMp
	/Cz8hdkWoTSpxBhfavWt1Y7+J6TLrdXfiPfDk6XTbwPhU6C5tg/1oe6saZzyPqBSMEY+l4
	xtPM2vU5RZ5cX81gsTD5BmeZFQRcaddA/BPhMX6WNulAZF75ktOkA8SgTlsPBw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org,  linux-sunxi@lists.linux.dev,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Chen-Yu Tsai <wens@kernel.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
  Richard Genoud <richard.genoud@bootlin.com>,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: sunxi: add H616 MBUS DMA support
In-Reply-To: <87tsp6avc2.fsf@bootlin.com> (Miquel Raynal's message of "Fri, 07
	Aug 2026 15:55:41 +0200")
References: <20260717164202.3099982-1-james.hilliard1@gmail.com>
	<87tsp6avc2.fsf@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 07 Aug 2026 15:56:47 +0200
Message-ID: <87o6feava8.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_065653_112330_F76C3EE1 
X-CRM114-Status: UNSURE (   4.27  )
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

Cj4gVGhpcyBwYXRjaCBkb2VzIG5vdCBhcHBseSAobGludXgtbXRkIHJlcG9zaXRvcnksIG5hbmQv
bmV4dCBicmFuY2gpLiBZb3UKPiBuZWVkIHRvIHJlYmFzZSBhbmQgc2VuZCBhIG5ldyBpdGVyYXRp
b24uCgpOZXZlcm1pbmQsIEkgZ290IGl0IGFwcGxpZWQgdHdpY2UgYW5kIHRoZSBlcnJvciB3YXMg
b2YgY291cnNlIGR1ZSB0byB0aGUKc2Vjb25kIHRyeSwgbXkgYmFkLCBubyBuZWVkIHRvIHJlc2Vu
ZC4KCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
