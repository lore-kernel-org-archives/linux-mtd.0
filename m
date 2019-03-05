Return-Path: <SRS0=LjUq=RI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40908C43381
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Mar 2019 06:37:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F74320842
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Mar 2019 06:37:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RmOTeOe6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="IbpQgqpu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F74320842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EPEkVD/dSEHYfe+MYEVCFGhe5TUk6iEpZVIjg+DEebw=; b=RmOTeOe6xWfAIa
	5LguMDE0whPeJgGgJ65MA4/pRlV+HU3FoXiPcVlnneytbYGTMTvBQUKhSTzxkGjj5HYjxQYtFXOiK
	SvVCEmZdfxiFy2Hdn6PurDd+GxYKxE1kALC61VdWXceP8HCGk79aJ139VgXiZjYWUdK4FgFcLpv5b
	/rCEyS8dVEHFD2Z09Lh1g7IfrAvHxM/NagFo1p7RYS04/M626SxaVtXLuIRTEKvg76GMHcT9XrpG6
	x7iVhuEa301I4OQ6TkIomX/qgHHQ7ocyLaj2Ijzs5puXomWSsGM9fRF9g7EUCcQiUR1qN++a1xnUN
	Bom02t4jGjoBnaRI/0rA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h13hc-0004X6-UU; Tue, 05 Mar 2019 06:37:24 +0000
Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h13hZ-0004W0-Qd
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2019 06:37:23 +0000
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id x256b0xS024760
 for <linux-mtd@lists.infradead.org>; Tue, 5 Mar 2019 15:37:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x256b0xS024760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1551767821;
 bh=JbIazAa1ZSJRKnDzcfc5Qsq/YvL6BKExSfpDOizLBOM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IbpQgqpuQIyIm4w3dGAF2QD9J64Y+sWrwC1TigKqFKCmbPyT0/4hm1piC6QOnINe0
 1Vxm84JAQQxxmErBSzifjSTnkdkj1Mk2aE9twlx/KkpgsiF8IN/64p4A9stI+6mlGR
 Dh+nKe56SdHYRmzm7u6g/KyfNFUvuAFkx7U+tzHCX8n9CCzcP7WUDNX08hNkz7r95A
 sVkBW4M13chUMELQbyQacCqdunvKpih2kqfN2H8wum+Bx7L4bIruREStolV+16VdVL
 9jIw2vLL2r5a5MJ7ZCBGXH9tSFPhSlg501QAFkTLcvpC9DIK82QRB9AeIcSOJh5sN7
 XZIZSP6NvxA0Q==
X-Nifty-SrcIP: [209.85.222.46]
Received: by mail-ua1-f46.google.com with SMTP id x1so6777113uaj.4
 for <linux-mtd@lists.infradead.org>; Mon, 04 Mar 2019 22:37:00 -0800 (PST)
X-Gm-Message-State: APjAAAWZ1ORIkxW3ypedxDZYtZ9maE5Jz0K9IueHssW0oneY/tmkoULC
 tkiVvsAhy0Faxgis0DUqgeL7MNFFVdPCMqUZeZE=
X-Google-Smtp-Source: APXvYqylV0ZTHhoN/LtvtPh6WbpZJq6c2NEePNdBGGxxDLZ3+qkE3EhSp3as7/KkS18Pu71R6Ddhs+Z6wqxpyC22LAg=
X-Received: by 2002:a67:7bd3:: with SMTP id w202mr339247vsc.179.1551767819908; 
 Mon, 04 Mar 2019 22:36:59 -0800 (PST)
MIME-Version: 1.0
References: <1549955582-30346-1-git-send-email-yamada.masahiro@socionext.com>
 <1549955582-30346-6-git-send-email-yamada.masahiro@socionext.com>
 <20190304094346.3b62e6cd@xps13>
In-Reply-To: <20190304094346.3b62e6cd@xps13>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 5 Mar 2019 15:36:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ4cxLHB_iVZvKdon--4x69HUh0_uJ_zAw89S4XN6aDcg@mail.gmail.com>
Message-ID: <CAK7LNAQ4cxLHB_iVZvKdon--4x69HUh0_uJ_zAw89S4XN6aDcg@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] mtd: rawnand: denali: use more precise timeout
 for NAND_OP_WAITRDT_INSTR
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_223722_096760_D5BA3928 
X-CRM114-Status: GOOD (  15.01  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKCgpPbiBNb24sIE1hciA0LCAyMDE5IGF0IDU6NDQgUE0gTWlxdWVsIFJheW5h
bCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIaSBNYXNhaGlybywKPgo+
IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+IHdyb3RlIG9u
IFR1ZSwgMTIgRmViCj4gMjAxOSAxNjoxMjo1NyArMDkwMDoKPgo+ID4gQ3VycmVudGx5LCB3YWl0
X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoKSBpcyBhbHdheXMgcGFzc2VkIGluIHRoZQo+ID4gaGFy
ZC1jb2RlZCBtc2VjX3RvX2ppZmZpZXMoMTAwMCkuIFRoZXJlIGlzIG5vIHNwZWNpZmljIHJlYXNv
biBmb3IKPiA+IDEwMDAgbXNlYywgYnV0IGl0IHdhcyBjaG9zZW4gdG8gYmUgbG9uZyBlbm91Z2gu
Cj4gPgo+ID4gV2l0aCB0aGUgZXhlY19vcCgpIGNvbnZlcnNpb24sIE5BTkRfT1BfV0FJVFJEWV9J
TlNUUiBwcm92aWRlcyBtb3JlCj4gPiBwcmVjaXNlIHRpbWVvdXQgdmFsdWUsIGRlcGVuZGluZyBv
biB0aGUgcHJlY2VkaW5nIGNvbW1hbmQuIExldCdzIHVzZQo+ID4gaXQgKCsgMTAwIG1zZWMpIHRv
IGJhaWwgb3V0IGVhcmxpZXIgaW4gZXJyb3IgY2FzZS4gVGhlIDEwMCBtc2VjIGV4dHJhCj4gPiBp
cyBpbiBjYXNlIHRoZSBoZWF2eSBsb2FkIG9uIHRoZSBzeXN0ZW0uCj4gPgo+ID4gSSBhbSBzdGls
bCBrZWVwaW5nIHRoZSBoYXJkLWNvZGVkIHZhbHVlcyBmb3Igb3RoZXIgaGlnaGVyIGxldmVsIGhv
b2tzCj4gPiBzdWNoIGFzIHBhZ2VfcmVhZCwgcGFnZV93cml0ZSwgZXRjLiBXZSBrbm93IHRoZSB2
YWx1ZSBvZiB0UiwgdFBST0csIGJ1dAo+ID4gd2UgaGF2ZSB1bmtub3dsZWRnZSBhYm91dCB0aGUg
ZGF0YSB0cmFuc2ZlciBzcGVlZCBvZiB0aGUgRE1BIGVuZ2luZS4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPgo+Cj4g
SSByZWFsbHkgYW0gbm90IGNvbnZpbmNlZCBieSB0aGlzIGNoYW5nZS4gUGxlYXNlIGp1c3QgZGVm
aW5lIGEgdGltZW91dAo+IGJpZyBlbm91Z2ggZm9yIG1vc3QgY2FzZXMgKDEwMDAgaXMgb2theSkg
YW5kIHVzZSBpdCBzeXN0ZW1hdGljYWxseS4KCgpPSywgSSB3aWxsIGRyb3AgdGhpcyBwYXRjaC4K
YW5kIGlnbm9yZSBjdHgud2FpdHJkeS50aW1lb3V0X21zLgoKCgoKCj4gVGhhbmtzLAo+IE1pcXXD
qGwKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IExpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdAo+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwoKCgotLQpCZXN0IFJlZ2Fy
ZHMKTWFzYWhpcm8gWWFtYWRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
