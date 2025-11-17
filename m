Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D3BCEACEF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Nov 2025 10:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6e+zXqOk3focBmweGMUUbh5V+O6Nkffx2h4284W6lZc=; b=DRSmBnHJ3MvLP3
	zMvn19HXimyOsBwltRUCTR8xeiwMLrH7NqtfEt/oIo4QTHd5i7tZsCxLoCJ4w6uJOTeKYlcNIKEj6
	a4Sq0Jxeu5nezR7DCGF/UvveIfAKa5vI5YuSZn/geuAt5rr1zLy1XwFCxpBJzgRTbfVMQjbwP8/qA
	KWvF+I6/MQfJs0GKumI8zUbrN6a5VU61NODRes6NzPwll/hrMLqdHxtLG1HPSwtRYKapydKD1yGff
	k2owWXmY5exR//gYUY4dZUZLYwdirYSXajeAVtyraGlQDyUiVam0jTjsimh14NrcCW27E3EdIzSd9
	1lJrv8lT4S6MyhOIoNrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwsl-0000000Fv1N-1LMV;
	Mon, 17 Nov 2025 10:54:51 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwsi-0000000Fv0c-01OL
	for linux-mtd@lists.infradead.org;
	Mon, 17 Nov 2025 10:54:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ABF634E41739;
	Mon, 17 Nov 2025 10:54:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8292A606B9;
	Mon, 17 Nov 2025 10:54:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8995110371CD4;
	Mon, 17 Nov 2025 11:54:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763376885; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TFNCAa6/GtAslg9jjZ0hXK/HFmA8lXwOULl3WgwvV4Q=;
	b=i1/Ef2t6K4rM2uif7B07KHsm/rjzuayjS5wE6YM2iIGRWohy3vwiORmjZiMyaEDHaWQK4R
	WJd+PvFPgW2OiEBBqnpsUbdSc2onZRpI8CxjfBHhkBq298H1tevvWX6A3voWrOYqc3i94U
	8flT5RwQ+GCc0jH1h3OisxZWT7ndiL8KcjjD6AZbl2qU87wnDJKUZPltBOBsThW+PzFlEZ
	PuvzKXaLZmO/ZIQtPLHJHeaGD6m80LtyJkq/dqmUzPbgtRmSctEsyxllUeqPQk7U0WUQVe
	OAInjevE2FOc97jPL938ZjONiwvFlgeWDlia/z+P0nRXlXmClCvWzW5lGBy+Fw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Abdun Nihaal <nihaal@cse.iitm.ac.in>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: maps: pcmciamtd: fix potential memory leak in pcmciamtd_detach()
Date: Mon, 17 Nov 2025 11:54:34 +0100
Message-ID: <176337662461.1740091.1186460346188701637.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103152141.57160-1-nihaal@cse.iitm.ac.in>
References: <20251103152141.57160-1-nihaal@cse.iitm.ac.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_025448_185706_30DA43E2 
X-CRM114-Status: UNSURE (   8.33  )
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

T24gTW9uLCAwMyBOb3YgMjAyNSAyMDo1MTozOSArMDUzMCwgQWJkdW4gTmloYWFsIHdyb3RlOgo+
IFRoZSBtZW1vcnkgYWxsb2NhdGVkIGZvciBzdHJ1Y3QgcGNtY2lhbXRkX2RldiBpbiBwY21jaWFt
dGRfcHJvYmUoKSBpcwo+IG5vdCBmcmVlZCBpbiB0aGUgY29ycmVzcG9uZGluZyByZW1vdmUgZnVu
Y3Rpb24gcGNtY2lhbXRkX2RldGFjaCgpLgo+IEZpeCB0aGF0IGJ5IGZyZWVpbmcgaXQgaW4gdGhl
IHJlbW92ZSBmdW5jdGlvbi4KPiAKPiAKCkFwcGxpZWQgdG8gbXRkL25leHQsIHRoYW5rcyEKClsx
LzFdIG10ZDogbWFwczogcGNtY2lhbXRkOiBmaXggcG90ZW50aWFsIG1lbW9yeSBsZWFrIGluIHBj
bWNpYW10ZF9kZXRhY2goKQogICAgICBjb21taXQ6IGE2OTdjNjcxY2MzMTdhYWMzNzE0YWM3MzVh
MzM2MzQ2YWYxNWQwMjUKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51
eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyBy
b2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
