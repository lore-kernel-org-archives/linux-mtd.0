Return-Path: <SRS0=DZ8H=ML=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF6DC07E95
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jul 2021 19:37:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40158610D2
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jul 2021 19:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40158610D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=X5nNfNW5KaDmsN4HUpjKv10Q60oeNnIrP4USmLG/PR4=; b=s2BDokKurPZAqn0euILw2xlodu
	tNKPpfSD8nz6ivCCnuM4O0Ba+EAU2G3D1QixgR38Yo6KeWRSqThw9eYP9D2B7sxjbp9kuJYtbskdd
	3E9yIh5GCmnqIUIFrflpDVTyglXaRlUkCe82ga173DSjoT94hJQRRfI4rDh8IYF8BW87GHwHCFYCY
	q6weKDsDetGgLmetcaf9vuB2DB1vhkVOupfoJHik1G2WvldPSZtDDNPIzieulGj6hmQiAxP4oFbzH
	t4bA+321RtSTWbeuvTatm1rMqNu8zYTfV4J9F/tv3BF/m+aHUCSPJ4zzrkWAyHcx2Ua8aSxWfgD03
	XB93NppQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5Z4R-00B7Sj-FS; Mon, 19 Jul 2021 19:36:55 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5Z4M-00B7Qe-Kp
 for linux-mtd@lists.infradead.org; Mon, 19 Jul 2021 19:36:52 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id F39566169BC2;
 Mon, 19 Jul 2021 21:36:47 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id aL-lUs1p6lLF; Mon, 19 Jul 2021 21:36:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 3F1EE616F7AF;
 Mon, 19 Jul 2021 21:36:47 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Oi5E0qhND6sh; Mon, 19 Jul 2021 21:36:47 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 1B0606169BC2;
 Mon, 19 Jul 2021 21:36:47 +0200 (CEST)
Date: Mon, 19 Jul 2021 21:36:46 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: festevam <festevam@gmail.com>
Cc: david oberhollenzer <david.oberhollenzer@sigma-star.at>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Marek Vasut <marex@denx.de>, hs <hs@denx.de>
Message-ID: <323618383.46712.1626723406949.JavaMail.zimbra@nod.at>
In-Reply-To: <CAOMZO5BX9iYmZwBBGEstbcWpvftRNExtwq+kX_rQff0v_o1P5g@mail.gmail.com>
References: <CAOMZO5BX9iYmZwBBGEstbcWpvftRNExtwq+kX_rQff0v_o1P5g@mail.gmail.com>
Subject: Re: mtd-utils: Proper way to handle erasize=0
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF90 (Linux)/8.8.12_GA_3809)
Thread-Topic: mtd-utils: Proper way to handle erasize=0
Thread-Index: sA8zP7JJ0ycQ4VWP2lLds75DAOezMQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_123650_882540_68C457D9 
X-CRM114-Status: UNSURE (   8.34  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImZlc3RldmFtIiA8ZmVzdGV2
YW1AZ21haWwuY29tPgo+IEFuOiAiZGF2aWQgb2JlcmhvbGxlbnplciIgPGRhdmlkLm9iZXJob2xs
ZW56ZXJAc2lnbWEtc3Rhci5hdD4sICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+Cj4gQ0M6ICJs
aW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4sICJNaXF1ZWwgUmF5bmFs
IiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4sICJNYXJlayBWYXN1dCIKPiA8bWFyZXhAZGVu
eC5kZT4sICJocyIgPGhzQGRlbnguZGU+Cj4gR2VzZW5kZXQ6IE1vbnRhZywgMTkuIEp1bGkgMjAy
MSAyMToxMjoyNgo+IEJldHJlZmY6IG10ZC11dGlsczogUHJvcGVyIHdheSB0byBoYW5kbGUgZXJh
c2l6ZT0wCgo+IEhpLAo+IAo+IFdoZW4gdXNpbmcgYSBNaWNyb2NoaXAgNDhsNjQwIFNSQU0gKGRy
aXZlcnMvbXRkL2RldmljZXMvbWNocDQ4bDY0MC5jKQo+IHRoZSByZXBvcnRlZCBlcmFzZXNpemUg
aXMgMDoKPiAKPiAjIGNhdCAvcHJvYy9tdGQKPiBkZXY6ICAgIHNpemUgICBlcmFzZXNpemUgIG5h
bWUKPiBtdGQwOiAwMDAwMjAwMCAwMDAwMDAwMCAic3BpMC4wIgo+IAo+IFRoaXMgY2F1c2VzIGEg
ZGl2aXNpb24gYnkgemVybyBhdCBsaWJtdGQuYywgYXMgbXRkX2dldF9kZXZfaW5mbzEoKSBoYXM6
Cj4gCj4gbXRkLT5lYl9jbnQgPSBtdGQtPnNpemUgLyBtdGQtPmViX3NpemU7Cj4gCj4gV2hhdCB3
b3VsZCBiZSB0aGUgYXBwcm9wcmlhdGUgd2F5IHRvIGZpeCB0aGlzPwoKRGlkbid0IHRoaXMgY29t
bWl0IGFkZHJlc3MgdGhhdCBwcm9ibGVtPwoKY29tbWl0IDU0ZDY4Nzk5YjczZTc1NTkyM2RlZjEz
MDZiNGRhNjA3YWQ0NWJkNjAKQXV0aG9yOiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFs
bGllZHRlbGVzaXMuY28ubno+CkRhdGU6ICAgRnJpIE5vdiAyNyAxMzowNzowOCAyMDIwICsxMzAw
CgogICAgbGlibXRkOiBhdm9pZCBkaXZpZGUgYnkgemVybwogICAgCiAgICBUaGUgY29uY2VwdCBv
ZiBlcmFzZSBibG9ja3MgZG9lc24ndCBhcHBseSB0byBtdGQtcmFtIGRldmljZXMuIFN1Y2gKICAg
IGRldmljZXMgc2V0IE1URF9OT19FUkFTRSB0byBpbmRpY2F0ZSB0aGlzIGFuZCBzb21lIHJlcG9y
dCAwIGZvciB0aGUKICAgIGVyYXNlIGJsb2NrIHNpemUuIEF2b2lkIGEgZGl2aWRlIGJ5IHplcm8g
d2hlbiBjYWxjdWxhdGluZyB0aGUgZXJhc2UKICAgIGJsb2NrIGNvdW50IGZvciBzdWNoIGRldmlj
ZXMuCiAgICAKICAgIFNpZ25lZC1vZmYtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1A
YWxsaWVkdGVsZXNpcy5jby5uej4KICAgIEFja2VkLWJ5OiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJp
Y2hhcmRAbm9kLmF0PgogICAgU2lnbmVkLW9mZi1ieTogRGF2aWQgT2JlcmhvbGxlbnplciA8ZGF2
aWQub2JlcmhvbGxlbnplckBzaWdtYS1zdGFyLmF0PgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
