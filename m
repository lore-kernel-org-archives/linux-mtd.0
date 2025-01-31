Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7B6C02193
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jan 2025 08:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y2kDzPoK4WIplBBHmVBr0U0rgBf7ofjFkCC/GqXbB7A=; b=RAhFKZgCo6yb0M
	dY0LhYy1zeq4LvbmctL58yrvT4mLWNDEsL5eShMuft70QZPh0VNTkQWH7SlGd2GPXpURfdulLIzHH
	PMHRuWPCGlzCTzc9ZvlOsdc72XnOfXeNQvfmjHgbUqoEL9m1do92TluKGPJhi7UYkTPloA+AIYapF
	zKi6aZaD5xrRQ4mQkrZCF/rVDj4mDOhQjY+2m7dtD6paZNohxt6cjrvxl0MFjLBul6ekn1Dihed2a
	LWGd9hTrB/e1joqyId21pchNAKjVoIiGZZ0d8JbTcbf4VZWzrIj+ZCCP1AX7S+ea7ACXHsvvTFaxW
	PPtFgrZQcNrFTegLHYWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdmRs-0000000ACpG-2zEJ;
	Fri, 31 Jan 2025 08:32:24 +0000
Received: from mail.cybercitadel.pl ([57.128.173.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdmQt-0000000ACec-0WoM
	for linux-mtd@lists.infradead.org;
	Fri, 31 Jan 2025 08:31:24 +0000
Received: by mail.CyberCitadel.pl (Postfix, from userid 1002)
	id 63A684E3B5; Fri, 31 Jan 2025 09:30:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=CyberCitadel.pl;
	s=mail; t=1738312280;
	bh=vUvp0ttX3lOxjdOrvZsKvJKNpHHNusfF6naBdS8j1E8=;
	h=Date:From:To:Subject:From;
	b=iSrPVg6Lii2bHaq/rXxeyfOarwdyUpd5XXwtTL2kVry/lFxg53enLOHkzNpcH6GL4
	 8fbIXaP3Cp6T8HGixeHFgDeUI7LYI22mGjR/CDsI2YEq4NGxAJHJb6aJEeKBksQW+j
	 ii/PkcezbGJWHDMn2X1DHeUF687m0NYXpdPT1ZPucp/A+s/o402egHj6wMb1EHrUVP
	 JJ+gjeReXWHrW2wZPkTISft0lKyJw/Oqba3LG9x7AMkDwtrU9aOFGwrxarD+acqGqM
	 a04Fb2tXNIXEO44SU/hMUFD7/C9sgkZ5aJlhUjEx/JdZgwHLFRBgWnMmQzRfT1Ydx7
	 Ccx/L0sX/egdw==
Received: by mail.CyberCitadel.pl for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2025 08:30:32 GMT
Message-ID: <20250131084500-0.1.d9.2drga.0.furr40ji8h@CyberCitadel.pl>
Date: Fri, 31 Jan 2025 08:30:32 GMT
From: "Marek Kucharski" <marek.kucharski@cybercitadel.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.CyberCitadel.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_003123_300092_92351FD2 
X-CRM114-Status: UNSURE (   1.65  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpNYXJlayBLdWNoYXJza2kKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
