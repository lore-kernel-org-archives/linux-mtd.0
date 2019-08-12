Return-Path: <SRS0=CTVO=WI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB587C433FF
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2019 20:26:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8213206C2
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2019 20:26:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ELwOdu78";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="KKrjEGma"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8213206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/JWwrHatS7u4Ap9klY7JSUzXvoV1Qfzi3SyY9tkdmB8=; b=ELwOdu78+0k12+
	8A0/jhBXYyrQ2MU1zS+k6OrFEwoa9qlCrumYbJ1RKtT86HgMrmx46QvZ+iuoo2xcLnjYwJrtTRWP4
	sHzW1orerUhxktCqV0FHPQHI+4ELyMSJngi2dK71En2INU7vMWyHWpdRnmzTF5DB7X9BOZSsoX3fh
	Nh5mkna0Jia4Bs9LZDu1hIeXVFU2GFl0biISwwJNg7AI9U+FET8ZCJPj1ARepNaH1wsP0Pr9zyvBZ
	dQApknfQjaq22ClrDwz1Htkmr1xO/iDPv2bSelNreklBsvyW0rxr3uVsE3A0Ai9Hx8SKuw43NiQnj
	rOdAMc85+U0k50+CbC5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxGt7-00070J-Vs; Mon, 12 Aug 2019 20:25:54 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxGt4-0006zz-L4
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2019 20:25:52 +0000
Received: by mail-vk1-xa32.google.com with SMTP id b69so21031048vkb.3
 for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2019 13:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=OL2MxBBdd7f6FbPuvANXnPGQ+mS7KK60e8W2I2bYmso=;
 b=KKrjEGmaWBQbl2Vci2F0gILMocRdAT/fH0siruYApkhhndEitXCLWm5nTyWpeU6xzd
 q9Lm4OB9sIrl53k401aJ1YlAJRnbOpVEBhe+pWg+YTgKdPlzar70QjWiGnntmgdg9/4m
 8b44BGY3ZYWU7pU7Q1+60v6xqtwTJASirZUjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=OL2MxBBdd7f6FbPuvANXnPGQ+mS7KK60e8W2I2bYmso=;
 b=Do5ChtxuQRvd433xowLOzdoGsak78MnjDQfygB6OYRxOlmN/gxnxm4Lcz4BHJb2txN
 dB32uDU1uM/aXPJUJBhvd5YMHvGhrqgFIf9qwzs+u0LdjBbK7stlGVX7La1t9//LxIbK
 hPWdQMOeYHkeSFbR5J0AbuD4XsILg8VGjjOtcb0fUQw/yHxd/gKjTxSIQAoqL7aFxWMC
 6dDDD8W5qQX9jTi4Et97nCF5q6QmFeCpOURn7Klhq3wfrnNwGc/SboOQwG/kGFjVLCW4
 ebpO5ihVnI/8YExtxZLrDvGNH7vpvzIopp9bkZ0dFlYZ55kjdE+IPRg811SHdrprCofO
 037Q==
X-Gm-Message-State: APjAAAXjx/yAJ2+c5n8kU90V69jIod33rsC+PvFJkR6Jl+lsTMVc5Wq2
 dotcUzV4mx8TauObHIJi0WmaPaJt9CgMZlTBynLMBGk0lxY=
X-Google-Smtp-Source: APXvYqwbKUCVRdSekiyBwfc/ugNzyG9C4hsliXXnEhbMqtNYKxMnJ4pMuMz8wxsO2r/iG2Of+pm3Yb3g5SDR07su9iQ=
X-Received: by 2002:ac5:c1c2:: with SMTP id g2mr4492115vkk.66.1565641548507;
 Mon, 12 Aug 2019 13:25:48 -0700 (PDT)
MIME-Version: 1.0
From: Kursad Oney <kursad.oney@broadcom.com>
Date: Mon, 12 Aug 2019 16:24:57 -0400
Message-ID: <CAMm8Nh0+BgomkSMrDHgzA5SkQZczp5CVAJefE79z=vfoPrui_Q@mail.gmail.com>
Subject: Number of bytes for spi-nand bad block marker
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_132550_699753_CE0D75ED 
X-CRM114-Status: UNSURE (   8.58  )
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
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpUaGUgc3BpLW5hbmQgZHJpdmVyIGluIGJvdGggbGludXggYW5kIHUtYm9vdCBjaGVjayAy
IGJ5dGVzIGZvciBiYWQKYmxvY2sgbWFya2VycyBpbiBzcGluYW5kX2lzYmFkKCkuIEhvd2V2ZXIs
IHRoZSBkYXRhc2hlZXQgZm9yClcyNU4wMUdWeHhJRyBzYXlzICdBIOKAnEJhZCBCbG9jayBNYXJr
ZXLigJ0gaXMgYSBub24tRkZoIGRhdGEgYnl0ZSBzdG9yZWQKYXQgQnl0ZSAwIG9mIFBhZ2UgMCBm
b3IgZWFjaCBiYWQgYmxvY2suIEFuIGFkZGl0aW9uYWwgbWFya2VyIGlzIGFsc28Kc3RvcmVkIGlu
IHRoZSBmaXJzdCBieXRlIG9mIHRoZSA2NC1CeXRlIHNwYXJlIGFyZWEuJyB3aGljaCBpcwpiYXNp
Y2FsbHkgb25lIGJ5dGUgZm9yIEJCTSBpbiBzcGFyZS4KCkJvcmlzIHNheXMgdGhleSBoYXZlIHVz
ZWQgdGhlIHNhbWUgcGF0dGVybiBmb3IgcGFyYWxsZWwgTkFORCBiZWNhdXNlCnNvbWUgTkFORHMg
YXJlIGludGVyZmFjZXMgdGhyb3VnaCBhIDE2LWJpdCBidXMuCgpIZXJlIGlzIHRoZSBzaXR1YXRp
b24gSSBhbSBmYWNpbmc6IFdlIHJvbGxlZCBvdXIgb3duIG93biBzcGktbmFuZAprZXJuZWwvYm9v
dGxvYWRlciBkcml2ZXJzIGJlZm9yZSB0aGUga2VybmVsIHNwaS1uYW5kIGRyaXZlciB3YXMKaW50
ZWdyYXRlZCwgYW5kIHNldCBCQk0gc2l6ZSB0byAxIGJ5dGUgZm9yIHRoaXMgdHlwZSBvZiBmbGFz
aC4gVGhpcwptZWFucyB0aGUgMm5kIGJ5dGUgaXMgYXZhaWxhYmxlIGZvciB1c2UuIFNvbWUgZGV2
aWNlcyBpbiB0aGUgZmllbGQKdXRpbGl6ZSB0aGUgZXh0cmEgYnl0ZSBmb3IgdGhlIGpmZnMyIGNs
ZWFuIG1hcmtlci4KCldlIHdvdWxkIGxpa2UgdG8gbWlncmF0ZSB0byB0aGUgbWFpbmxpbmUgZHJp
dmVycyBidXQgdGhpcyBwcmVzZW50cyBhbgppc3N1ZS4gV2hlbiB3ZSBmbGFzaCBhbiBpbWFnZSB3
aXRoIHRoZSBtYWlubGluZSB1LWJvb3Qgc3BpLW5hbmQKZHJpdmVyLCBpdCB0aGlua3MgdGhlIGNs
ZWFuZWQgamZmczIgYmxvY2tzIGFyZSAiYmFkIGJsb2NrcyIgc2luY2Ugb25lCm9mIHRoZSBieXRl
cyBpbmNsdWRlcyB0aGUgY2xlYW4gbWFya2VyLgoKTWFyZWsgc3VnZ2VzdGVkIHdlIGRvIGEgb25l
LXRpbWUgdXBncmFkZSBzY3JpcHQgd2hlcmUgd2UgcmV3cml0ZSB0aGUKT09CIGJ1dCBpdCdzIGEg
cmlza3kgb3BlcmF0aW9uLCBlc3BlY2lhbGx5IGluIHRoZSBmaWVsZC4gQm9yaXMgYXNrZWQKbWUg
dG8gZW1haWwgdGhlIE1URCBsaXN0IGFuZCBjb250aW51ZSB0aGUgZGlzY3Vzc2lvbiBoZXJlLiBJ
CmFwcHJlY2lhdGUgYW55IG9waW5pb25zL3N1Z2dlc3Rpb25zLgoKVGhhbmtzIQprdXJzYWQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
