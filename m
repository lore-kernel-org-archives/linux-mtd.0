Return-Path: <SRS0=iCcf=U2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB333C48BD7
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 14:55:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A99020663
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 14:55:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j7BJD8J2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pLIpA7rw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A99020663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0sN+RbHkV7481Zu+VbV6NxGrXnC71Oz+KRab1uiF2gQ=; b=j7BJD8J2DovSX7
	iGdsDSwJF5Ix7xOHctiqxpA2PmJ5Cr0U/gd/qk80vED8dxzcvmwbfYm/ZTrsr+keHf4m63UKsRTKS
	MhuWxzX3ycnuXqo8ZL9PuQ9lXxw53K85cw1wn86zfhjlvQlGzYmcVFS2ztWa09qNJgjAW+TE6Hmmp
	MkzBnKwqoDugjm8BNpDnosYrKTMh+k3RymGQnAv3h2LigdldPACSr76XmknM4omoIehRcUJFIM/tF
	LMcsUhdb7omLXawgjJVCj8THvqlI7uZEz3LmRXlsaEDtG+C+HbQhun5lv2fyD7Sbjb90MrA09WjsA
	wKXKUzdGQTjBeUA4QnLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgVnY-00060U-9u; Thu, 27 Jun 2019 14:54:52 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgVnW-00060M-QN
 for linux-mtd@bombadil.infradead.org; Thu, 27 Jun 2019 14:54:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UmBJaRkt6nwtWq6ERDaG7pdB4GwOAcVrATmQQNDtldI=; b=pLIpA7rw/FfrmyvdTOJhL9dWpk
 i6wWWOwuG1uE9B6rkVJbSuXiBXuySGdNPSCFK/llhp5+PKTwQC7uFnZnLxj3j+uFJh8KcdFswWq+S
 Dgw7W+WcxEW6V2SGPsRTF7Cgedq6ZqkqOY8Xq/YWvxTwn1UDKalKXiwEHsKy+326Y65Qn5Gv2n9uj
 uM9k0HJUi721INsQ9l6iwnwH944BR8H+XT5KGY6zNb+emNhlK1dFbDhUFMclWfuLlseI6A4Sdh4Yt
 Bq3QXB/EW9wNhZLhNyRMYEPtPPsAyup1iSqkcyXIRwhbDAReNuLe4bXTniVz/KyqzACcPuW/TF3n7
 Sqva0y7g==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgVnT-0000yt-UM
 for linux-mtd@lists.infradead.org; Thu, 27 Jun 2019 14:54:49 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B42BCC000D;
 Thu, 27 Jun 2019 14:54:08 +0000 (UTC)
Date: Thu, 27 Jun 2019 16:54:07 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: nand: raw: brcmnand: When oops in progress
 use pio and interrupt polling
Message-ID: <20190627165407.221844be@xps13>
In-Reply-To: <CAFLxGvzMhDwoP5wqLFq-SUyDsyPNCMmiNgSr=FXFL6ee1uA4dw@mail.gmail.com>
References: <1558024913-26502-1-git-send-email-kdasu.kdev@gmail.com>
 <1558024913-26502-2-git-send-email-kdasu.kdev@gmail.com>
 <CAFLxGvyZCpKthJevFHjjBQXo=j5f-FUip0MAsLy0HaoJzLZ2rA@mail.gmail.com>
 <CAC=U0a2UxMG2SuVCjv=TLzMs7Dg3yqJdxW6ft2tSQgEKj0C6ZQ@mail.gmail.com>
 <CAC=U0a3co4Ju94pEp4exDYNz=G7YnEztjdZWSjOBKTL+C_7g8Q@mail.gmail.com>
 <CAFLxGvzMhDwoP5wqLFq-SUyDsyPNCMmiNgSr=FXFL6ee1uA4dw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmljaGFyZCwKClJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZC53ZWluYmVyZ2VyQGdtYWls
LmNvbT4gd3JvdGUgb24gVHVlLCAxMSBKdW4KMjAxOSAyMjoxNjozNiArMDIwMDoKCj4gT24gVHVl
LCBKdW4gMTEsIDIwMTkgYXQgMTA6MDMgUE0gS2FtYWwgRGFzdSA8a2Rhc3Uua2RldkBnbWFpbC5j
b20+IHdyb3RlOgo+ID4KPiA+IFJpY2hhcmQsCj4gPgo+ID4gWW91IGhhdmUgYW55IG90aGVyIHJl
dmlldyBjb21tZW50cy9jb25jZXJucyB3aXRoIHRoaXMgcGF0Y2gsIGlmIG5vdAo+ID4gY2FuIHlv
dSBwbGVhc2Ugc2lnbiBvZmYgb24gaXQuICAKPiAKPiBJJ20gZmluZSB3aXRoIHRoYXQgYXBwcm9h
Y2guCj4gSSBob3BlZCB0byBnZXQgc29tZSBpbnB1dCBmcm9tIG90aGVyIE1URCBmb2xrcyB0b28g
Oi0oCj4gCgpTb3JyeSBmb3IgbXkgbGF0ZSBhbnN3ZXIgYnV0IHllcywgSSBhbSB0b3RhbGx5IGZp
bmUgd2l0aCB0aGlzIGFwcHJvYWNoLgpJJ2xsIGNhcnJ5IHRoaXMgdGhyb3VnaCB0aGUgbmFuZCBi
cmFuY2guCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
