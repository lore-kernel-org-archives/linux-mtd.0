Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D121AF3381B
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 08:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=arwRvqgrLL+VQaXLl0vOMBZpgiVDesYbyAsUPK+2WPI=; b=H2O3OPh9jO4dAt
	v9EbNZbfKZHNoycFlbIXCnBQ64qAoarbzDnnnVpV9ak7A/g7AOplq98z3WPNYMTbg7Cw24i4aDihv
	Wf4z/ITrEXbgmKPiUBqd25KQiW50ev9aW/Y8i2esDHsc80YlHJvaMnLZrbWTxKj6mRAxXXMWPxTpq
	OLItTdtlMtiZy3uBxPp9dknLZZLdMiDPPi/l0+usCwabE6PMCZlKefzln8cTX8UjqjPjxv08X3E/p
	nSRMeZe0Gd5ZTaU98eijlxBS3CgV6Z+bR8MoQFPF2X0sFeX6OP/wiQjko/Cylf4ffVgpsCUF+JeXd
	4bIkxOwASL6Y7qy7kETw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QFL-00000005mFe-2PAM;
	Tue, 17 Mar 2026 08:57:51 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QFI-00000005mEa-1kkz
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 08:57:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F30CE4E426C2;
	Tue, 17 Mar 2026 08:57:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C894F5FC9A;
	Tue, 17 Mar 2026 08:57:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 129B61045042D;
	Tue, 17 Mar 2026 09:57:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773737864; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nBiDzArVDcCoeD815fZ/roaTVPKtASulKgA6m6/q+Xw=;
	b=BTAAkQV9D7XYSdPN/XEa01rePeqL0W3i7lsg75ZoHjkP4EzKv+6L0IL5WbRbxYY0PhNlY0
	fCKWBs9CvgpGchyvNp9NZbQtqOqlUZDtfSD0FGLn4yFHTWyUN8+3a4ZgNRp1EjC2sOFm3M
	Oc0LdJrLzgY3gYX4wNNh4hjBrNlD8b6uKQ6dWwA01gjVfQev1gy87jhXSnnIcRKCAyBgDH
	Scw0R/6/6tKDSDkI2m/dV7iwoHuVew/M1wIu7Cj1terSsOFm7B3iMqHOIRqdtObytBJM3t
	u7B5yqBxU2N7H0MlJGW2/oZBmNYLWkxV7+Xx4uRrzrL8FR8dlU7Qg0wEPxLfGQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Olivier Sobrie <olivier@sobrie.be>
Cc: Michal Simek <michal.simek@amd.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,  Andrea
 Scian <andrea.scian@dave.eu>
Subject: Re: [PATCH] mtd: rawnand: pl353: make sure optimal timings are applied
In-Reply-To: <abj9JLf9bvIZuqNq@padoso> (Olivier Sobrie's message of "Tue, 17
	Mar 2026 08:05:08 +0100")
References: <20260304211823.569972-1-olivier@sobrie.be>
	<87bjgogo0g.fsf@bootlin.com> <abj9JLf9bvIZuqNq@padoso>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 17 Mar 2026 09:57:40 +0100
Message-ID: <874imeg7ej.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_015748_588213_F7F13F0E 
X-CRM114-Status: UNSURE (   7.34  )
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

Cj4+ID4gV2l0aCB0aGlzIHBhdGNoLCB3ZSBwcm9ncmFtIGRpcmVjdGx5IHRoZSBuZXcgdGltaW5n
cyB3aGVuCj4+ID4gcGwzNXhfbmZjX3NldHVwX2ludGVyZmFjZSgpIGlzIGNhbGxlZC4KPj4gPgo+
PiA+IFNpZ25lZC1vZmYtYnk6IE9saXZpZXIgU29icmllIDxvbGl2aWVyQHNvYnJpZS5iZT4KPj4g
Cj4+IE5pY2UsIHRoaXMgcHJvYmFibHkgd2lsbCBkZXNlcnZlIGEgRml4ZXMgdGFnIGFuZCBDYzog
c3RhYmxlLgo+Cj4gRG8geW91IGltcGxpY2l0ZWx5IHN1Z2dlc3QgdGhhdCBJIHNob3VsZCBzZW5k
IGEgdjIgb2YgdGhpcyBwYXRjaAo+IHdpdGggRml4ZXMgdGFnIGFuZCBzdGFibGUgaW4gQ0M/IE9y
IGRvIHlvdSB0YWtlIGNhcmUgb2YgdGhhdD8KClBsZWFzZSBzZW5kIGEgdjIsIGluZGVlZCEKClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
