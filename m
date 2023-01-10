Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12B2C46467
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Jan 2023 08:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zwUZSKqvbrR8GgXis4MntlzrzrzmjpSvVVzzegtvaEU=; b=wDDu+xXKCDkHguH9ua+lxshB+Q
	uKHHxfUWe5piTFQ+lZDLiA7vQR6ZtQ54e4UIcE3Kfp8xdFFJ1gZWaN+5axXFA8Qjq2XTgNW0pjQ8k
	HcOv9LhnHo+wZaAF4Yqv7vcdckRsTcUtI3hAbiAaZ0Z899RTm0MWnK8Xk1TSLbvYdY+hoKoKi/NMy
	qBLRmUmrNaa2J7sunCaT1wGkqEO6mJYtkKWNrAGgES+TRQ3tzUz9CZ1XOW1NdzA2NaUskSoMfkiEH
	pYuaDStRrC3h//bSodZxFY7Cink4+f5zjMFF4mdzSaF/qbDYE3uxhAcC+RCPNOdgNeSocRdU0g3sO
	x1krQnng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF9bf-005gpo-Fi; Tue, 10 Jan 2023 08:03:39 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF9ba-005gmt-Sv
	for linux-mtd@lists.infradead.org; Tue, 10 Jan 2023 08:03:36 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id BAF5C60719A6;
	Tue, 10 Jan 2023 09:03:21 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id ZH3MRa_nO2Mu; Tue, 10 Jan 2023 09:03:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 7E4A2609D2C4;
	Tue, 10 Jan 2023 09:03:21 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id SOKTC41ONl-h; Tue, 10 Jan 2023 09:03:21 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5F907607401A;
	Tue, 10 Jan 2023 09:03:21 +0100 (CET)
Date: Tue, 10 Jan 2023 09:03:21 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Sascha Hauer <sha@pengutronix.de>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1093159744.18217.1673337801329.JavaMail.zimbra@nod.at>
In-Reply-To: <20230106121815.GA20604@pengutronix.de>
References: <20180704140230.5606-1-richard@nod.at> <20230106121815.GA20604@pengutronix.de>
Subject: Re: [PATCH] ubifs: Handle LPT corruption better in
 ubifs_garbage_collect_leb()
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Handle LPT corruption better in ubifs_garbage_collect_leb()
Thread-Index: b7na40JorsG4+CUCL+f2TJDtyvMYEg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_000335_123170_0E9054BA 
X-CRM114-Status: UNSURE (   5.02  )
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

U2FzY2hhLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFdoYXQgaGFwcGVuZWQg
dG8gdGhpcyBwYXRjaD8gSXQgbmV2ZXIgbWFkZSBpdCBhbnl3aGVyZS4gSSBqdXN0IHN0dW1ibGVk
Cj4gb3ZlciB0aGlzIGlzc3VlIGFuZCBmb3VuZCB0aGlzIHBhdGNoIGFmdGVyd2FyZHMuCgpJIGhh
dmUgd2l0aGRyYXduIHRoaXMgcGF0Y2ggYmVjYXVzZSBpdCBjdXJlcyBvbmx5IGEgc3ltcHRvbSBh
bmQgbm90CnRoZSByb290IGNhdXNlLiBUaGUgcm9vdCBjYXVzZSBpcyBhIExQVCBjb3JydXB0aW9u
LgpJSVJDIEkgc2F3IHRoZSBwcm9ibGVtIHdoaWxlIGludmVzdGlnYXRpbmcgaW50byBhbm90aGVy
IHByb2JsZW0gd2hpY2gKY2F1c2VkIFVCSUZTIGNvcnJ1cHRpb25zLgoKVGhhbmtzLAovL3JpY2hh
cmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
