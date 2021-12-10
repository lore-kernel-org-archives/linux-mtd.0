Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119F7C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Dec 2021 21:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:From:
	Date:Subject:To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6BytQsjvln09xwxDQ7I7WVJaWgqYAvpK/CJ1wVHKpEM=; b=c+5+DKAYYaOjP6
	PGX6348EOP5JYLoglseozGWnx1SlzHY5KmVIzLTg70Xp6lZ3PMidlfVTKANjbQm/GMoBQEb8buUd/
	Xfn2KaDIc8DXbjqMqygqcPIMQ4tchdYnoNmH3gsjpoccMzRT5YRZ6ArdTuZHE73MskpHb+Kawyczm
	QNFEG3yLD7CAw8jr/v+iHBm81wp+pscesS23QeTtSkHT/G/ieX89jumeNke7tIFjxxv4C1JKyLXEp
	+uXVe8n/ZSmxkx9aZb61fDgyO+0PTA0TqMFlbMSEaGJv6+yxs/E2ujZvFqVAQ/W4Kw5Th7xsWxr+T
	6zuElxLi+eZJqt8qGzmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvnUC-003sIK-Pr; Fri, 10 Dec 2021 21:31:24 +0000
Received: from thelittlegym.com.pe ([64.111.120.204]
 helo=ps494070.dreamhostps.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvnU8-003sGP-GO
 for linux-mtd@lists.infradead.org; Fri, 10 Dec 2021 21:31:23 +0000
Received: by ps494070.dreamhostps.com (Postfix, from userid 4971446)
 id 396D434005F923; Fri, 10 Dec 2021 13:20:17 -0800 (PST)
To: linux-mtd@lists.infradead.org
Subject: =?UTF-8?Q?TLG_Latam,
 _confirmaci=C3=B3n_de_env=C3=ADo_de_dato?=  =?UTF-8?Q?s?=
X-PHP-Originating-Script: 4971446:PHPMailer.php
Date: Fri, 10 Dec 2021 21:20:17 +0000
From: WordPress <sami@thelittlegym.com.co>
Message-ID: <eho79l5lnov6E7OON7ecKA33SPlay7U3pj4WTeUp7Y@thelittlegymfranquicias.com>
X-Mailer: PHPMailer 6.5.0 (https://github.com/PHPMailer/PHPMailer)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_133120_641796_2281B675 
X-CRM114-Status: UNSURE (  -0.29  )
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
Reply-To: juan@thelittlegym.com.co
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

TXVjaGFzIGdyYWNpYXMgcG9yIGNvbnRhY3Rhcm5vcyDinaTvuI8gRGlhbmUgd2FudCB0byBtZWV0
IHlvdSEgQ2xpY2sgSGVyZTogaHR0cHM6Ly9iaXQubHkvM3k5amhvbD96d3Yg4p2k77iPCgpUZSBl
bnZpYXJlbW9zIGxhIGluZm9ybWFjacOzbiBkZSBmcmFucXVpY2lhLCBqdW50byBhIHVuIGZvcm1h
dG8gZGUgYW7DoWxpc2lzLCBwYXJhIHF1ZSBjb21wbGV0ZXMgeSBub3MgbG8gZW52w61lcyBkZSB2
dWVsdGEuCgpNdWNoYXMgZ3JhY2lhcwoKRXF1aXBvIGRlIFRMRyBMYXRhbQpBYnJhem9zCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
