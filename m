Return-Path: <SRS0=iCcf=U2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F4BEC48BD7
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 07:40:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41F05205C9
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 07:40:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mQuNnlkL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41F05205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0tE276ME9D0BB8aad5dVzqRlSYaA4VtE5Qn2n9GVVfY=; b=mQuNnlkLdmsnsx
	r9r1ttfv86UlK6C/uleMYJY8RFa4ur4JlYgEu+YVbwApcoAu+o9VZxbFO6Xokf1mKe/lJn/5hmLpz
	7MxG6Wa3Qa+eZTS4jMW2/hFlrlJOjkgENOi8I5nbEn/7lsckClct0omekkf7UFi+dGbHTQ3oJyhp4
	+/IpufK3nkGKLTuXLeGkLR6SkapaPP/1vWMy9tRm/p40cfFJRQ02ANJfkaPNjQIKBTmxf/njIntsw
	fC1K4+vTK3YHmG1DW8gn9LDsSBbRKtgrtMj1T8d+50M2mpo/3pEJtWQs6lG8cEnc8q4J38oHy3wxO
	+zGHb/gnDKFxI056Ez/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgP0h-0004Tw-Vm; Thu, 27 Jun 2019 07:40:00 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgP0e-0004TU-Qx
 for linux-mtd@lists.infradead.org; Thu, 27 Jun 2019 07:39:58 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id A3E9C6058371;
 Thu, 27 Jun 2019 09:39:55 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id tvWP0UWhmkVX; Thu, 27 Jun 2019 09:39:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 146576088966;
 Thu, 27 Jun 2019 09:39:54 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id r-gwNHDINXTn; Thu, 27 Jun 2019 09:39:54 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id D07A46058370;
 Thu, 27 Jun 2019 09:39:53 +0200 (CEST)
Date: Thu, 27 Jun 2019 09:39:53 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Message-ID: <363893471.18166.1561621193771.JavaMail.zimbra@nod.at>
In-Reply-To: <20190627070745.9561-1-yamada.masahiro@socionext.com>
References: <20190627070745.9561-1-yamada.masahiro@socionext.com>
Subject: Re: [PATCH] mtd: abi: do not use C++ style comments in uapi header
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF60 (Linux)/8.8.12_GA_3809)
Thread-Topic: do not use C++ style comments in uapi header
Thread-Index: 2PQpdijhcDac/HQZ/2uT6aaag+Q+mw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_003957_016008_460227B7 
X-CRM114-Status: UNSURE (   6.77  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1hc2FoaXJvIFlhbWFkYSIg
PHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPgo+IEFuOiAiRGF2aWQgV29vZGhvdXNlIiA8
ZHdtdzJAaW5mcmFkZWFkLm9yZz4sICJCcmlhbiBOb3JyaXMiIDxjb21wdXRlcnNmb3JwZWFjZUBn
bWFpbC5jb20+LCAiTWFyZWsgVmFzdXQiCj4gPG1hcmVrLnZhc3V0QGdtYWlsLmNvbT4sICJNaXF1
ZWwgUmF5bmFsIiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4sICJyaWNoYXJkIiA8cmljaGFy
ZEBub2QuYXQ+LCAiVmlnbmVzaCBSYWdoYXZlbmRyYSIKPiA8dmlnbmVzaHJAdGkuY29tPiwgImxp
bnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPgo+IENDOiAiTWFzYWhpcm8g
WWFtYWRhIiA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+LCAibGludXgta2VybmVsIiA8
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4KPiBHZXNlbmRldDogRG9ubmVyc3RhZywgMjcu
IEp1bmkgMjAxOSAwOTowNzo0NQo+IEJldHJlZmY6IFtQQVRDSF0gbXRkOiBhYmk6IGRvIG5vdCB1
c2UgQysrIHN0eWxlIGNvbW1lbnRzIGluIHVhcGkgaGVhZGVyCgo+IExpbnV4IGtlcm5lbCB0b2xl
cmF0ZXMgQysrIHN0eWxlIGNvbW1lbnRzIHRoZXNlIGRheXMuIEFjdHVhbGx5LCB0aGUKPiBTUERY
IExpY2Vuc2UgdGFncyBmb3IgLmMgZmlsZXMgc3RhcnQgd2l0aCAvLy4KPiAKPiBPbiB0aGUgb3Ro
ZXIgaGFuZCwgdWFwaSBoZWFkZXJzIGFyZSB3cml0dGVuIGluIG1vcmUgc3RyaWN0IEMsIHdoZXJl
Cj4gdGhlIEMrKyBjb21tZW50IHN0eWxlIGlzIGZvcmJpZGRlbi4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPgoKQWNrZWQt
Ynk6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+CgpUaGFua3MsCi8vcmljaGFy
ZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
