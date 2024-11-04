Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5A5CFB422
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Nov 2024 08:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=okunYyMhJWtHALT37z740VZEJcdx0J+zLNPISocE4F0=; b=AAahGkIuNVy0QB
	caBiXoSYoonJCLQK459Om2HyUX7YVineMTvQlCl6UucQ5IzsWkbVl0AYWYA/tyq0sNIBZAf7mQ/mj
	GtKE8n8kHqjD0VFYAAZpGHcF7S1XyZiouCd/Mlss8T6vf+OIIVI6AnjcT2XxAtQwIAGXma5BVCVUa
	VHnqpx8seiehNvui0QA1/NEof2k3wKxi1PNtWz2ORwnpP5p5k/r5kkdIMz2ZjHznGhXYt1urJ5vQY
	vJ9w0zJlxV2NmrBuGQ+iheGpc3uWnpvk9zD7JUu3pRtnG3IQqfBZjz2WsBaGtlTgEMTLu0jlu6RRl
	xQeXjIAiPMHNMA+1TOlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7sat-0000000CzhZ-0nMM;
	Mon, 04 Nov 2024 08:37:51 +0000
Received: from mail.venturevistas.pl ([149.202.34.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7sZO-0000000CzQo-0kGq
	for linux-mtd@lists.infradead.org;
	Mon, 04 Nov 2024 08:36:20 +0000
Received: by mail.venturevistas.pl (Postfix, from userid 1002)
	id 4B67823831; Mon,  4 Nov 2024 09:36:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=venturevistas.pl;
	s=mail; t=1730709370;
	bh=fKcpwC0ymovmBOVe7lsaiiVFMcR1WBPva/dbH2iWMmM=;
	h=Date:From:To:Subject:From;
	b=gk18z1VnYBXbVXlpg6rSfiaJ/eoiCnG7uwrYdxI8YRqwlAFVkedAyAXYVBxgBocTm
	 eC/rxZZECEUuBmQ8b+KqN3iRTF8v2ZHKlVM2i87NW2iwXBbOvZXQMDBwLTUgZs3ZBI
	 oENlVKsPLyVojhrqf8qOzWCUOUbndrUvEA74l5aMd4d2GQw14xu5HN54jeDLrB64hx
	 9lqpSp7UHHS22roBkiHqGnzR8HUwddoQrScp69lhHgz9laFKcV4BXqSX4eAcNxNvKi
	 ssdEwqSnpVV4tJ9X0DVWoj2Wvy+OHCzwhjYCjeN5ZbIBcPbF6qtUb9rKgANnwx0Kgk
	 AlVAcTaklkKOA==
Received: by mail.venturevistas.pl for <linux-mtd@lists.infradead.org>; Mon,  4 Nov 2024 08:36:02 GMT
Message-ID: <20241104084500-0.1.e6.t0ou.0.rzbfpoh8bc@venturevistas.pl>
Date: Mon,  4 Nov 2024 08:36:02 GMT
From: =?UTF-8?Q?"Paulina_Soko=C5=82owska"?= <paulina.sokolowska@venturevistas.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Zwrot
X-Mailer: mail.venturevistas.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_003618_957618_5AF4C1B3 
X-CRM114-Status: UNSURE (   2.42  )
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

RHppZcWEIGRvYnJ5LCAKCncgcHJ6eXBhZGt1IHByb2JsZW11IG9kenlza2FuaWEgxZtyb2Rrw7N3
IG9kIEtvbnRyYWhlbnRhLCBwcmlvcnl0ZXRlbSBqZXN0IG5hdHljaG1pYXN0b3dlIHBvZGrEmWNp
ZSBvZHBvd2llZG5pY2ggZHppYcWCYcWELiAKCkdkeSBva3JlcyB6d8WCb2tpIHd5bm9zaSBtbmll
aiBuacW8IDMgbWllc2nEhWNlLCB1ZHppYcWCIHNwxYJhdCB3enJhc3RhIGRvIDcyJSwgbmF0b21p
YXN0IHByenkgMTItbWllc2nEmWN6bnltIG9ww7PFum5pZW5pdSBzcMWCYXQsIHd5bm9zaSBvbiB6
YWxlZHdpZSAyNiUgLiAKCkplc3RlxZtteSB6bmFuaSB6IHd5c29raWVnbyBwb3ppb211IG9kenlz
a2l3YW5pYSBuYWxlxbxub8WbY2kgdyBQb2xzY2UuIFByemVkc2nEmWJpb3JjeSB6d3JhY2FqxIUg
c2nEmSBkbyBuYXMgeiBwcm9ibGVtYW1pIHogbmlldXJlZ3Vsb3dhbnltaSBmYWt0dXJhbWksIGt0
w7NyZSBza3V0ZWN6bmllIHJvendpxIV6dWplbXkuCgpDenkgY2hjaWVsaWJ5IFBhxYRzdHdvIHNr
b3J6eXN0YcSHIHogbmFzemVnbyB3c3BhcmNpYT8gTWFjaWUgUGHFhHN0d28gZMWCdcW8bmlrYSBv
ZCwga3TDs3JlZ28gbW9nbGliecWbbXkgcG9tw7NjIG9kenlza2HEhyDFm3JvZGtpPwoKClBvemRy
YXdpYW0KUGF1bGluYSBTb2tvxYJvd3NrYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
