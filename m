Return-Path: <SRS0=XuJY=IJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5DADC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 11:46:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE71A64E45
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 11:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE71A64E45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nD0ogeIb6syRxwoRKh7EMSLJhqTTV9CNj+ONbcJnPTY=; b=g/sZsfCYAfZW1atV+UmD94Gwq
	JN2z7AAr3AToqmvl3ef4Qc7QYNzoWGDeYPxchdGqeJZMLCdTgOf2r8avNaFTrm5DaHCpsqxOHYAv/
	uJ5kf0pHYHF3t5+4g6KvmVATpiVs03JZz3sDxE5q5QVl3d5l/6XKlluDwIV86UbRKtuQa3XC9XYd5
	TiNuqqRESE7gnfLe9B+FODrHcqBAWR52BKKvAttMYKg8P0FrzTOca4x7S5/2MRmR28NW/TzoU6xGU
	gNkipoe4j5wictUHqz5PWWRQrQI/yIOj09gE6fCmIAHMRgS/QiEFEmLwJXbiqir7GtEd+iQsbKy4a
	hKPn6fkbA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKJkr-008yJi-Au; Thu, 11 Mar 2021 11:45:25 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKJi1-008xte-Hh
 for linux-mtd@lists.infradead.org; Thu, 11 Mar 2021 11:42:32 +0000
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 4A41124000D;
 Thu, 11 Mar 2021 11:42:28 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Ansuel Smith <ansuelsmth@gmail.com>
Subject: Re: [PATCH] mtd: parsers: ofpart: limit parsing of deprecated DT
 syntax
Date: Thu, 11 Mar 2021 12:42:27 +0100
Message-Id: <20210311114227.306145-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210302190012.1255-1-zajec5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'2d751203aacf86a1b301a188d8551c7da91043ab'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_114229_911368_15BABBD4 
X-CRM114-Status: UNSURE (   7.65  )
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

T24gVHVlLCAyMDIxLTAzLTAyIGF0IDE5OjAwOjEyIFVUQywgPT91dGYtOD9iP1VtRm1ZY1dDSUUx
cHhZSmxZMnRwPz0gd3JvdGU6Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+IAo+IEZvciBiYWNrd2FyZCBjb21wYXRpYmlsaXR5IG9mcGFydCBzdGlsbCBzdXBwb3J0
cyB0aGUgb2xkIHN5bnRheCBsaWtlOgo+IHNwaS1mbGFzaEAwIHsKPiAJY29tcGF0aWJsZSA9ICJq
ZWRlYyxzcGktbm9yIjsKPiAJcmVnID0gPDB4MD47Cj4gCj4gCXBhcnRpdGlvbkAwIHsKPiAJCWxh
YmVsID0gImJvb3Rsb2FkZXIiOwo+IAkJcmVnID0gPDB4MCAweDEwMDAwMD47Cj4gCX07Cj4gfTsK
PiAod2l0aG91dCAicGFydGl0aW9ucyIgc3Vibm9kZSkuCj4gCj4gVGhlcmUgaXMgbm8gcmVhc29u
IGhvd2V2ZXIgdG8gc3VwcG9ydCBuZXN0ZWQgcGFydGl0aW9ucyB3aXRob3V0IGEgY2xlYXIKPiAi
Y29tcGF0aWJsZSIgc3RyaW5nIGxpa2U6Cj4gcGFydGl0aW9ucyB7Cj4gCWNvbXBhdGlibGUgPSAi
Zml4ZWQtcGFydGl0aW9ucyI7Cj4gCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+IAkjc2l6ZS1jZWxs
cyA9IDwxPjsKPiAKPiAJcGFydGl0aW9uQDAgewo+IAkJbGFiZWwgPSAiYm9vdGxvYWRlciI7Cj4g
CQlyZWcgPSA8MHgwIDB4MTAwMDAwPjsKPiAKPiAJCXBhcnRpdGlvbkAwIHsKPiAJCQlsYWJlbCA9
ICJjb25maWciOwo+IAkJCXJlZyA9IDwweDgwMDAwIDB4ODAwMDA+Owo+IAkJfTsKPiAJfTsKPiB9
Owo+ICh3ZSBuZXZlciBvZmZpY2lhbGx5IHN1cHBvcnRlZCBvciBkb2N1bWVudGVkIHRoYXQpLgo+
IAo+IE1ha2Ugc3VyZSBvZnBhcnQgZG9lc24ndCBhdHRlbXB0IHRvIHBhcnNlIGFib3ZlLgo+IAo+
IENjOiBBbnN1ZWwgU21pdGggPGFuc3VlbHNtdGhAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KCkFwcGxpZWQgdG8gaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBtdGQv
bmV4dCwgdGhhbmtzLgoKTWlxdWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
