Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E08C4451B
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2026 15:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ryxj0niEUer2NT49huUrb4rJ60agz7mN5Vn5sGe5kec=; b=3SPNe5yjzudUwC
	hEBmAHZbn/7XP9Yk51dZYRMQgmSK/7nDTWHkGrtc/7MS0hC9wLOB8F7FmAKnFr5gKVPpNeQATCjE3
	kvX9KxRNr6N9EuirBDxUbhKVot52/oFTifMLOvM8QPo+KIM93l9gaUTF3SzylkvEz+0/9GqKkyuui
	4d+JAsgg0eV6WtOxC0EEpBarFmNbByLu1JRkrJxOlpn//Vkj1Gd7JioHrwTaizWSjq5a8tf7ufBOL
	o40RYjJSFxV0Jp/AantkL0jU1mvhI2uOsmbUfSXctMd0TdxVVVFO17aJD7Vwehxe9uatk0/vGmXSu
	CFh6W1yJECzzYFs7dn9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkpz-00000002fKB-2RnS;
	Fri, 17 Jul 2026 15:50:55 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkpx-00000002fGM-19Ea
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jul 2026 15:50:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C5C024E40E1D;
	Fri, 17 Jul 2026 15:50:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 93F2760361;
	Fri, 17 Jul 2026 15:50:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8F9C811BD091E;
	Fri, 17 Jul 2026 17:50:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784303450; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=q60KPYb8O25OFkF2m5y/35EkddklN+ij3W+jCz9uRI8=;
	b=hfmgZJbowuHaI7V4El5QQ2+0+IOk/ISZfaWsHpgFyP+0tlX+TNNU4GCj/KJqJ2PxsBX35H
	UISjx0vZW+wmEsAQ0u34qN5dDR0XnISH+VwbOIRrxQqI4tM3dBkAZO33X55yEyTUQKqSgd
	xrAYzGWWjm5TTd+3hCf80JQ0/GxmV7jZkfMILeq/8dWCpyuP5uGW6rbIppYhoe+zw9lxSW
	6eVr7UyfSKuzcBq/QcSotvThJPLve+kRIriYvKGhmJrnz/LXgePoIsSi8KO61t4KXb/Ytb
	wNtJTN4hz40XEOP+04ujoBDUIE3jYc8X5NqgnibSNb3ID9dzfe9qD8mGHdn+0g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, Artem.Bityutskiy@nokia.com, 
 lumag@kernel.org, zhouminqiang <zhouminqiang2@huawei.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 chengzhihao1@huawei.com, yangerkun@huawei.com, yi.zhang@huawei.com
In-Reply-To: <20260716131432.2355777-1-zhouminqiang2@huawei.com>
References: <20260716131432.2355777-1-zhouminqiang2@huawei.com>
Subject: Re: [PATCH] mtd: part: reject MTDPART_OFS_RETAIN in
 mtd_add_partition()
Message-Id: <178430344750.4129650.15700102575949276950.b4-ty@bootlin.com>
Date: Fri, 17 Jul 2026 17:50:47 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_085053_464596_055E3BAC 
X-CRM114-Status: UNSURE (   6.17  )
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

T24gVGh1LCAxNiBKdWwgMjAyNiAyMToxNDozMiArMDgwMCwgemhvdW1pbnFpYW5nIHdyb3RlOgo+
IG10ZF9hZGRfcGFydGl0aW9uKCkgZG9lcyBub3QgcmVqZWN0IHRoZSBzcGVjaWFsIG9mZnNldCB2
YWx1ZQo+IE1URFBBUlRfT0ZTX1JFVEFJTiAoLTMpLCB3aGljaCBsZWFkcyB0byBhIFdBUk5fT04g
aW4KPiBhZGRfbXRkX2RldmljZSgpIHdoZW4gY2FsbGVkIHRocm91Z2ggdGhlIEJMS1BHIGlvY3Rs
IG9uIE5BTkQKPiBkZXZpY2VzLiBUaGUgUkVUQUlOIHZhbHVlIGRlcGVuZHMgb24gY3VyX29mZnNl
dCBiZWluZyB0aGUgZW5kIG9mCj4gdGhlIHByZXZpb3VzIHBhcnRpdGlvbiwgYnV0IGluIHRoZSBk
eW5hbWljIHBhcnRpdGlvbiBwYXRoCj4gY3VyX29mZnNldCBlcXVhbHMgdGhlIG9mZnNldCBhcmd1
bWVudCBpdHNlbGYsIGNhdXNpbmcgdW5kZWZpbmVkCj4gYmVoYXZpb3IuCj4gCj4gWy4uLl0KCkFw
cGxpZWQgdG8gbXRkL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogcGFydDogcmVqZWN0IE1URFBB
UlRfT0ZTX1JFVEFJTiBpbiBtdGRfYWRkX3BhcnRpdGlvbigpCiAgICAgIGNvbW1pdDogYjc1OWQ1
YmI2MjY1NDE5MzQ0ZWU5NzI5ZmQwZGMwN2FkODU3MTlkOAoKUGF0Y2hlKHMpIHNob3VsZCBiZSBh
dmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBS
IChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJk
cywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
