Return-Path: <SRS0=eCmO=EQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1ABC388F7
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2020 15:36:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B355E2068D
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2020 15:36:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ocN/twBe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B355E2068D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P2HJg8+4YSPsXu1aRvW1fp9M6HLRBJyhG2vzC7+e8z8=; b=ocN/twBeQ8zZdwOSiS0kY5SjP
	ra9s8Ak6CVj2G7UD/iqghi64KtqsTsO5X4fPQZbNiwHhkziMkYjhALHAvcxZy++LyhHxj6cDIiMm8
	e8rRHk9YVpNjhLPsMcAma/pYvDwXtTlYUSEmGq/7kQtkXUVeIK6wkZj/vZ/BskomdqT/H4apzhRra
	gZc9N0wq+INb9VxGIhNXKrQ8tfVNLlSz5J1RNh28NKHDdLFApGzIhQxmBUYKZ1rORWYWTfz3Jt/SJ
	uOHz7prht4mVydOgp0sNXFaUMi1kY5Z8afZ4H8CMUCS5aCHr1xw3AvD+ZHURCf9+XUC8nqcNxN9YQ
	52+Lk7lJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcVgs-0005SY-Ba; Tue, 10 Nov 2020 15:36:14 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcVgi-0005R8-A9
 for linux-mtd@lists.infradead.org; Tue, 10 Nov 2020 15:36:08 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 1DB3BC001F;
 Tue, 10 Nov 2020 15:35:57 +0000 (UTC)
Date: Tue, 10 Nov 2020 16:35:56 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: drivers/mtd/maps/physmap-bt1-rom.c:78:18: sparse: sparse: cast
 removes address space '__iomem' of expression
Message-ID: <20201110163556.3e3423f6@xps13>
In-Reply-To: <20201110113827.hl5i27cpl6exo3md@mobilestation>
References: <202011021254.XC70BaQT-lkp@intel.com>
 <20201110113827.hl5i27cpl6exo3md@mobilestation>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_103604_461250_E2D13A81 
X-CRM114-Status: UNSURE (   9.01  )
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
Cc: linux-mtd@lists.infradead.org, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2VyZ2UsCgpTZXJnZSBTZW1pbiA8U2VyZ2V5LlNlbWluQGJhaWthbGVsZWN0cm9uaWNzLnJ1
PiB3cm90ZSBvbiBUdWUsIDEwIE5vdgoyMDIwIDE0OjM4OjI3ICswMzAwOgoKPiBIZWxsbyBNaXF1
ZWwsCj4gCj4gQSBzaXR1YXRpb24gbm90ZWQgYnkgdGhlIHdhcm5pbmcgYmVsb3cgd29uJ3QgY2F1
c2UgYW55IHByb2JsZW0gYmVjYXVzZQo+IHRoZSBjYXN0aW5nIGlzIGRvbmUgdG8gYSBub24tZGVy
ZWZlcmVuY2VkIHZhcmlhYmxlLiBJdCBpcyB1dGlsaXplZAo+IGFzIGEgcG9pbnRlciBiaWFzIGxh
dGVyIGluIHRoYXQgZnVuY3Rpb24uIFNoYWxsIHdlIGp1c3QgaWdub3JlIHRoZQo+IHdhcm5pbmcg
b3Igc3RpbGwgZml4IGl0IHNvbWVob3c/CgpEbyB5b3UgdGhpbmsgdGhlIGNhc3QgdG8gYSAhX19p
b21lbSB2YWx1ZSBpcyBtYW5kYXRvcnkgaGVyZT8KClBlcmhhcHMgaWYgeW91IGZpbmQgYW4gZWxl
Z2FudCB3YWl0IHRvIGF2b2lkIHRoZSB3YXJuaW5nIGl0IHdvdWxkIGJlCm5pY2UsIG90aGVyd2lz
ZSBJIGd1ZXNzIHdlJ2xsIGxldCBpdCBhc2lkZSBhcyBhIGZhbHNlIHBvc2l0aXZlLgoKQ2hlZXJz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
