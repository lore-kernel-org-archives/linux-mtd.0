Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB73C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 16 May 2022 07:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Message-ID:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FVqlUf1wt6b71nT6cqbihHhrWqAsC6Q4cun5HTIc43s=; b=D9BQ5rGRsK5AWL
	pHMPue+HrOG9hKZMV67+5lMl+eiHMiB/nNFUgEWGBgHtFJB++I8Laket2k/dDix+V5Fodpg2Is/XQ
	fbZD/xlvSjsoMOvfJ482VZfygepklJT1GGP+oudlyn7ZYCJIKu30q74ddGWVUZDwO3GNJK0iIkNHk
	1eV0dIlQssAe6tzuhrY4IRcd88ZSP2LTiTZEWEXrHg3a9YWXWlhonybZ8mIMU/AnkF5Hx+rEh9+D9
	K8uXPO8g7iDbc435TaheSC8kpnqjwcPS7Dw66ecVGOQ4PjRvOaGMV0CTw4EL9dnsrfIeIMZSX83YJ
	e/105y4H4X3ytQBYh2XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqUoG-006JdD-Ir; Mon, 16 May 2022 07:06:28 +0000
Received: from sender11-op-o11.zoho.eu ([31.186.226.225])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqUoA-006JZl-Ix
 for linux-mtd@lists.infradead.org; Mon, 16 May 2022 07:06:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1652684772; cv=none; d=zohomail.eu; s=zohoarc; 
 b=bLm0uBldu0r8i6aT3csYC9f8ddOBqdl7xdusBxGsn02gCo6DvXhWIuPKVnl79T36ybjsSH42UqLeCzp9ifpFqx96butoRPPi+OBy2ZQgts2zUYJpYd4Lm51V+sL4GwutoEzDeMExY/3lp79sAFw7Cp0+cgXKapTXpsYhzxv9h8c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu;
 s=zohoarc; t=1652684772;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=EU0N+NK2TGrYEQ59ert+9I0xYmY7UQqiUrHh4fhPx2Y=; 
 b=BLuYW7DHbM+A88pEdkNX0Hd52TdY8mDGka+sbcWXExC82kI+eq3CgUz+yQRoHAawD42cC5rzCFmspp5wWKhk2Yqf1V615krUqnywgPRI421zkWwRpZ9VEQmZgln5l11vO4vxtK8dsSGqJonc12Ws87i3daecjcRLvV9BcDe4kxc=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
 dkim=pass  header.i=kempniu.pl;
 spf=pass  smtp.mailfrom=kernel@kempniu.pl;
 dmarc=pass header.from=<kernel@kempniu.pl>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1652684772; 
 s=zmail; d=kempniu.pl; i=kernel@kempniu.pl;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=EU0N+NK2TGrYEQ59ert+9I0xYmY7UQqiUrHh4fhPx2Y=;
 b=McQAoBFKBVHL49UQWaH0M32WAL7xC6rDzr3Y53co8GjJwXXymSVFLvaZn5s+o0vi
 SmPHq0kt8nXDxk7bYo9d2jSpHVbutg9OIG+8+sI6Gx44T7e6mlw09JqpotSd4s5TbNa
 meRo4EXIvizUHC4J8kz2XRrOoLDuIDzXWNV+oQbM=
Received: from larwa.hq.kempniu.pl (212.180.138.61 [212.180.138.61]) by
 mx.zoho.eu with SMTPS id 16526847699991012.3311458811077;
 Mon, 16 May 2022 09:06:09 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Message-ID: <20220516070601.11428-1-kernel@kempniu.pl>
Subject: [PATCH 0/2] mtdchar_write_ioctl(): prevent integer overflow,
 use kvmalloc()
Date: Mon, 16 May 2022 09:05:59 +0200
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_000622_936546_D5874761 
X-CRM114-Status: UNSURE (   7.01  )
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

VGhpcyBwYXRjaCBzZXJpZXMgYWRkcmVzc2VzIHR3byBmbGF3cyBpbiBtdGRjaGFyX3dyaXRlX2lv
Y3RsKCkgZm91bmQgYnkKUmljaGFyZCBXZWluYmVyZ2VyIHdoaWxlIGhlIHdhcyByZXZpZXdpbmcg
djMgb2YgdGhlIHBhdGNoIHNlcmllcwpwcm9wb3NpbmcgYSBuZXcgTUVNUkVBRCBpb2N0bCBbMV0u
CgpSaWNoYXJkLCBJIGluY2x1ZGVkIGEgU3VnZ2VzdGVkLWJ5IHRhZyBjcmVkaXRpbmcgeW91IGlu
IGJvdGggb2YgdGhlCnBhdGNoZXMgaW4gdGhpcyBzZXJpZXMuICBJIGhvcGUgdGhhdCBpcyBva2F5
IHdpdGggeW91LCBidXQgcGxlYXNlIGxldCBtZQprbm93IGlmIGl0IGlzbid0LgoKT25jZSB0aGlz
IHBhdGNoIHNlcmllcyBpcyByZXZpZXdlZCBhbmQgYWNjZXB0ZWQsIEkgd2lsbCBhcHBseSBzaW1p
bGFyCmZpeGVzIGluIHY0IG9mIHRoZSBNRU1SRUFEIGlvY3RsIHBhdGNoIHNlcmllcy4KClsxXSBo
dHRwczovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LW10ZC8yMDIyLUZlYnJ1
YXJ5LzA5MTI3Ni5odG1sCgpNaWNoYcWCIEvEmXBpZcWEICgyKToKICBtdGRjaGFyOiBwcmV2ZW50
IGludGVnZXIgb3ZlcmZsb3cgaW4gYSBzYWZldHkgY2hlY2sKICBtdGRjaGFyOiB1c2Uga3ZtYWxs
b2MoKSBmb3IgcG90ZW50aWFsbHkgbGFyZ2UgYWxsb2NhdGlvbnMKCiBkcml2ZXJzL210ZC9tdGRj
aGFyLmMgICAgICB8IDEzICsrKysrKysrLS0tLS0KIGluY2x1ZGUvdWFwaS9tdGQvbXRkLWFiaS5o
IHwgIDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9u
cygtKQoKLS0gCjIuMzYuMQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
