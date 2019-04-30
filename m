Return-Path: <SRS0=r2JG=TA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A497C04AA6
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Apr 2019 12:08:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BB2F205ED
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Apr 2019 12:08:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MydR3CQ+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BB2F205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZAfD8OQOcjxB3r9vFmZ7hdzslXpq2UJLbMqbM8Y0+U4=; b=MydR3CQ+4me3A7
	HVMoon9A4I4xorxg6wAc0J4c9Cc5vvN6iVPVT+plX8JgfKfgDdl4DqiTz2H7mjx9baa9/7xtnkr2V
	Qq+uAec/cPAbB6cfDzPEfhx+4jZnksrUXtiJ9KSF7UHcFStsTOvWcDAOh7Z5jFD37GO5ClPknj2bZ
	XyFOJLLm6I07ggMUCzZA7evu14THeyONGhYRYVijN0oJKlSIhIeOOEkd/MdQb/oI/wDx9MG88zksw
	y7AG+2U0D/YYDBI55DHo+DFwLXC3kuJ2/WI9pXp0oj7cyPPOVouzL+C//5APA7DMTtkuoEgxixiWS
	XnEutUA4UKcgstX8zpFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLRZ0-0005PW-6Q; Tue, 30 Apr 2019 12:08:46 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLRYw-0005O2-Qj; Tue, 30 Apr 2019 12:08:44 +0000
X-Originating-IP: 90.88.147.33
Received: from xps13 (aaubervilliers-681-1-27-33.w90-88.abo.wanadoo.fr
 [90.88.147.33]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id CB4AC240021;
 Tue, 30 Apr 2019 12:08:34 +0000 (UTC)
Date: Tue, 30 Apr 2019 14:08:33 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Xiaolei Li <xiaolei.li@mediatek.com>
Subject: Re: [PATCH v2 0/5] MTK NAND driver improvements and fixes
Message-ID: <20190430140833.08039a9f@xps13>
In-Reply-To: <20190430100250.28083-1-xiaolei.li@mediatek.com>
References: <20190430100250.28083-1-xiaolei.li@mediatek.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190430_050843_018270_C0721111 
X-CRM114-Status: UNSURE (   6.73  )
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
Cc: richard@nod.at, linux-mediatek@lists.infradead.org,
 linux-mtd@lists.infradead.org, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWGlhb2xlaSwKClhpYW9sZWkgTGkgPHhpYW9sZWkubGlAbWVkaWF0ZWsuY29tPiB3cm90ZSBv
biBUdWUsIDMwIEFwciAyMDE5IDE4OjAyOjQ1CiswODAwOgoKPiBUaGUgZm9sbG93aW5nIHBhdGNo
IHNldCBtYWlubHkgY29udGFpbnM6Cj4gKiBGaXggbG93IGxldmVsIHRpbWUgY2FsY3VsYXRpb24g
b2YgcmVhZC93cml0ZSBjeWNsZSB0byBtZWV0IHRSQ19taW4KPiAgIGFuZCB0V0NfbWluIHJlcXVp
cmVtZW50cy4KPiAqIFJlZmluZSBSRSMgcHVsc2Ugd2lkdGggY2FsY3VsYXRpb24gYW5kIGRhdGEg
c2FtcGxpbmcgdG8gaW1wcm92ZSByZWFkCj4gICBwZXJmb3JtYW5jZS4KPiAqIEFkZCBDUyB2YWxp
ZGl0eSBjaGVjay4KPiAqIEZpeCBvb2IgYnVmZmVyIHBvaW50ZXIgd3JvbmdseSBzZXR0aW5nIGFu
ZCBlbXB0eSBwYWdlIHRocmVzaG9sZCBzZXR0aW5nLgo+IAo+IENoYW5nZXMgb24gdjIgcmVsYXRp
dmUgdG86Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAKPiB0cmVlICAgIDogZ2l0Oi8vZ2l0Lmlu
ZnJhZGVhZC5vcmcvbGludXgtbXRkLmdpdAo+IGJyYW5jaCAgOiBtYXN0ZXIKCldlIGp1c3Qgc3dp
dGNoZWQgdG8gYSByZXBvc2l0b3J5IGhvc3RlZCBvbiBrZXJuZWwub3JnOgpodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0LwpuYW5kL25l
eHQgaXMgdGhlIGJyYW5jaCBmb3IgdGhpcyBraW5kIG9mIHNlcmllcy4KClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
