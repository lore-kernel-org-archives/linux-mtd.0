Return-Path: <SRS0=7Ms1=QS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D2CC282C2
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 01:27:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0BDB2146F
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 01:27:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M211GSVt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="guK0/6QX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0BDB2146F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6qIagNzrfQoftxGObmYa20KFUJNYBzwrNEL/ttDSmIM=; b=M211GSVtUi7KCi
	qPIfJBvtTsk6vRgCrGHFSJSoH/4+aqpiLHmMxsY+r/0ICKJ/KZcNVrIba8HVTL1Ngq2RRkmtaRTXn
	f5oYqg4xT9MDey+bSKU3UIL9Nt837Osms0tMN06E8CloSoUE3okfUdtCS4nIoZzvAhlqFUMn2o4n5
	sjUHpQBdNFsz5k4XG971HKdNuaJYi82R0g2pHwN8vIaLhNQAhk6iKyi2pOP4eVSTmDlWXte0j7S99
	asvF7b/PX0mZOEjw1hev5/saPKwuIftGY0Vc4EnA5IInpp8kF7lZo8qyHdoDd0Fob/xT0CgObXc1c
	8VqNWhx2cgYgqK3bwoHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gt0Nw-0006cg-Pn; Mon, 11 Feb 2019 01:27:48 +0000
Received: from conssluserg-03.nifty.com ([210.131.2.82])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gt0Nu-0006cE-0R
 for linux-mtd@lists.infradead.org; Mon, 11 Feb 2019 01:27:47 +0000
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id x1B1RFif003781
 for <linux-mtd@lists.infradead.org>; Mon, 11 Feb 2019 10:27:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x1B1RFif003781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1549848436;
 bh=Bjymw9ZL2xJrOsBKqziIPpjjf6rQJ1btIsnzSZqEoMA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=guK0/6QXKr7QEDuSC6oClOpIlZkziPPJ2dSS0om4rBcKq6rUbNQdf4UIwAvSu0vj5
 eM2AIFz6DPm4DQYvJ5w6gZwMfBrQ2jGXNvjLMljA25W3/QgDReXVOxwcgULNiEkhIF
 4vkkesJQg6qH8/I+jor8PcX4mQDG2Bqd41OCeMqVvXyWSjpdYvYDqIYu2eZ7o+lxVm
 VYkhFf68HjSnTRb/5LgBtaSeQHz94a4hQcqHEo2qaEH9+kluvKnyqsSoY1cTSOdCPB
 qLTobuFeB4CQdT+GMXGP5bFFykbfDVyl+XXXlenbN/T6pWzJ4mlLvBYNN0K9JEaomn
 hfrunUCT9ubwg==
X-Nifty-SrcIP: [209.85.221.174]
Received: by mail-vk1-f174.google.com with SMTP id v70so2088202vkv.7
 for <linux-mtd@lists.infradead.org>; Sun, 10 Feb 2019 17:27:16 -0800 (PST)
X-Gm-Message-State: AHQUAuaZtFyhGMiPp0S+PRClS4Oive7BEpkrMjzrqETfZwEPdS+ZMsmO
 lOvnfHS6dhm7xOlnbZN76QdnOMF2nL1ToxOfDDE=
X-Google-Smtp-Source: AHgI3IarDvwMyJxXOcRy4QcYDk2Iek/zEss62Tawjmjxe/rUD4YkU9Wmbq94+C5udJB1zZmbQ5ONUMZ3Mb6XOROfFq0=
X-Received: by 2002:a1f:9350:: with SMTP id v77mr13775627vkd.64.1549848435275; 
 Sun, 10 Feb 2019 17:27:15 -0800 (PST)
MIME-Version: 1.0
References: <1549613335-30319-1-git-send-email-yamada.masahiro@socionext.com>
 <1549613335-30319-7-git-send-email-yamada.masahiro@socionext.com>
 <20190208230511.5ee7c0f1@xps13>
In-Reply-To: <20190208230511.5ee7c0f1@xps13>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 11 Feb 2019 10:26:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNASSX=XTfykvqs3MYYZUbpWAGDrXVWsQQ3S6=RQG5DcbkA@mail.gmail.com>
Message-ID: <CAK7LNASSX=XTfykvqs3MYYZUbpWAGDrXVWsQQ3S6=RQG5DcbkA@mail.gmail.com>
Subject: Re: [PATCH 06/11] mtd: rawnand: denali: use more precise timeout for
 NAND_OP_WAITRDT_INSTR
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190210_172746_265949_268503F8 
X-CRM114-Status: GOOD (  17.73  )
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

SGkgTWlxdWVsLAoKT24gU2F0LCBGZWIgOSwgMjAxOSBhdCA3OjA1IEFNIE1pcXVlbCBSYXluYWwg
PG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGkgTWFzYWhpcm8sCj4KPiBN
YXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPiB3cm90ZSBvbiBG
cmksICA4IEZlYgo+IDIwMTkgMTc6MDg6NTAgKzA5MDA6Cj4KPiA+IEN1cnJlbnRseSwgd2FpdF9m
b3JfY29tcGxldGlvbl90aW1lb3V0KCkgaXMgYWx3YXlzIHBhc3NlZCBpbiB0aGUKPiA+IGhhcmQt
Y29kZWQgbXNlY190b19qaWZmaWVzKDEwMDApLiBUaGVyZSBpcyBubyBzcGVjaWZpYyByZWFzb24g
Zm9yCj4gPiAxMDAwIG1zZWMsIGJ1dCBJIGp1c3QgY2hvc2UgaXQgbG9uZyBlbm91Z2guCj4gPgo+
ID4gV2l0aCB0aGUgZXhlY19vcCgpIGNvbnZlcnNpb24sIE5BTkRfT1BfV0FJVFJEWV9JTlNUUiBw
cm92aWRlcyBtb3JlCj4gPiBwcmVjaXNlIHRpbWVvdXQgdmFsdWUsIGRlcGVuZGluZyBvbiB0aGUg
cHJlY2VkaW5nIGNvbW1hbmQuIExldCdzIHVzZQo+ID4gaXQgdG8gYmFpbCBvdXQgZWFybGllciBp
biBlcnJvciBjYXNlLgo+Cj4gSSdtIG5vdCBzdXJlIHVzaW5nIDEwbXMgaW5zdGVhZCBvZiAxMDAw
bXMgaXMgcmVsZXZhbnQgaW4gdGhlIGJlbG93Cj4gY2FzZXMsIDEwbXMgaXMgcmF0aGVyIHNob3J0
IGZvciBhbiBJUlEsIGlmIHlvdXIgc3lzdGVtIGlzIHVuZGVyIGxvYWQKPiB5b3UgbWlnaHQgZW5k
IHVwIHdpdGggYSB0aW1lb3V0LCBub3QgYmVjYXVzZSB0aGUgcmlnaHQgSVJRIGRpZCBub3QKPiBm
aXJlLCBidXQgYmVjYXVzZSB0aGUgaGFuZGxlciB3YXMgbm90IGV4ZWN1dGVkIHlldCAoaXQgaGFw
cGVuZWQgdG8gbWUKPiBpbiB0aGUgbWFydmVsbF9uYW5kLmMgZHJpdmVyIHJlY2VudGx5KS4KCgpH
b29kIHBvaW50LgpTaW5jZSBMaW51eCBpcyBub3QgUlQtT1MsIHRoZXJlIGlzIG5vIGRlZmluZWQg
d29yc3QtY2FzZSB0aW1lCnVudGlsIHRoZSBoYW5kbGVyIGlzIGludm9rZWQuCgoKSSB3aWxsIGFk
ZCB0aGUgZm9sbG93aW5nIHRvIGRlbmFsaV93YWl0X2Zvcl9pcnEoKS4KCiAgICAgICAgLyogUHJv
bG9uZyB0aGUgSVJRIHdhaXQgdGltZSBpbiBjYXNlIHRoZSBzeXN0ZW0gaXMgdW5kZXIgaGVhdnkg
bG9hZC4gKi8KICAgICAgICB0aW1lb3V0X21zICs9IDEwMDsKCgoKCgo+IEFsc28sIHdvdWxkIHlv
dSBtaW5kIHVzaW5nIGEgZGVmaW5lIGluc3RlYWQgb2YgaGFyZGNvZGluZyAnMTAwMCc/CgoKSSBk
byBub3QgdGhpbmsgdGhpcyBpcyB3b3J0aCBkb2luZy4KCgoKCj4gPgo+ID4gSSBhbSBzdGlsbCBr
ZWVwaW5nIHRoZSBoYXJkLWNvZGVkIHZhbHVlcyBmb3Igb3RoZXIgaGlnaGVyIGxldmVsIGhvb2tz
Cj4gPiBzdWNoIGFzIHBhZ2VfcmVhZCwgcGFnZV93cml0ZSwgZXRjLiBXZSBrbm93IHRoZSB2YWx1
ZSBvZiB0UiwgdFBST0csIGJ1dAo+ID4gd2UgaGF2ZSB1bmtub3dsZWRnZSBhYm91dCB0aGUgZGF0
YSB0cmFuc2ZlciBzcGVlZCBvZiB0aGUgRE1BIGVuZ2luZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPgo+Cj4KPiBU
aGFua3MsCj4gTWlxdcOobAoKCgotLSAKQmVzdCBSZWdhcmRzCk1hc2FoaXJvIFlhbWFkYQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
