Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA192C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 15:22:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8C02208E4
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 15:22:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pAi6dL04"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8C02208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tAhIAgYYpEOXGjJSKUktCsaO6ND5IStFlb5fEuUb89Q=; b=pAi6dL04jNiuIy
	WB6WHr+ja7UBlY5hTbv9/+tZd0Xtw2qFVxxKxNUmdFzw7k1mbzS6HaUKFxtLoYq33uM3q+wMBh1zs
	PCgEz8PM/5pL5BeyDBfk3iTgCRGyRaGSNohuL5ml0jWu5lMYDxIY4EmtqYQE0HPilOriO+MZk1WFt
	evGWgKyh+hRf5umbL5Hn/UU+qHF3WNX1y4/HedaYcNBM562CxEwu04S70wjZrI61QRg3AShobQYuw
	auv4W7G/BMIDhQQkyiKoR22gbHtoyOwi8GAFWRlrNM3LoFuAVYmkYof+LL0n8WtG0oLoNRqBRSc6x
	jj7C8wUNJulxiPUMsydQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAylu-0004Nv-Tr; Mon, 01 Apr 2019 15:22:50 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAyls-0004NV-AY
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2019 15:22:49 +0000
X-Originating-IP: 90.88.32.136
Received: from xps13 (aaubervilliers-681-1-91-136.w90-88.abo.wanadoo.fr
 [90.88.32.136]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 8F57B1BF214;
 Mon,  1 Apr 2019 15:22:45 +0000 (UTC)
Date: Mon, 1 Apr 2019 17:22:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: gpmi: Introduce GPMI_IS_MXS() macro
Message-ID: <20190401172244.738b0ca5@xps13>
In-Reply-To: <20190207105055.10860-1-festevam@gmail.com>
References: <20190207105055.10860-1-festevam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_082248_508833_3C966DCD 
X-CRM114-Status: UNSURE (   6.10  )
X-CRM114-Notice: Please train this message.
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
Cc: han.xu@nxp.com, martin.kepplinger@ginzinger.com,
 linux-mtd@lists.infradead.org, bbrezillon@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRmFiaW8sCgpGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+IHdyb3RlIG9uIFRo
dSwgIDcgRmViIDIwMTkgMDg6NTA6NTQKLTAyMDA6Cgo+IEludHJvZHVjZSBhIEdQTUlfSVNfTVhT
KCkgbWFjcm8gdG8gdGFrZSBpbnRvIGFjY291bnQgdGhlIGNhc2VzCj4gd2hlbiBteDIzIG9yIG14
MjggYXJlIHVzZWQsIHdoaWNoIGhlbHBzIHJlYWRhYmlsaXR5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4KPiAtLS0KCkFwcGxpZWQgdG8gZ2l0
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQK
b24gbmFuZC9uZXh0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
