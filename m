Return-Path: <SRS0=ekNa=5F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C82B1C4332B
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2020 10:19:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99C9620722
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2020 10:19:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O5qhfdlH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99C9620722
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KgKX4Uw+zRSnm+0sZHk3mmHgTrLsI2umzlLE24l7NjU=; b=O5qhfdlHdQm/WA
	XAdE6Ij6oTTgWoEFRo7sMGJ7APAoT8jVVuhsLeB3EDI9ecdGpCcM/BjyJ03YD6z2gmlNG89nJKALt
	npB+5cwQL1QlDAOD1hQAki9EZfmgblcXrWXvFbXzpo7WnRCwB3ESLMOZJAnMIrFGyL254D2sABfjG
	ESQPkmbGJgOOpJs6Uz9jEBiYVToZK48Rtty+MGXGL69Xl9hw+BpwqQBUSszKfJrnUmFQ3vw+1IhKu
	WncGO17NUGY8iKxm6shRU/YKxfXGW0s7O7cpljwTQiTyxzRB4kaGC5xRqlR1YIdR0bsIH3SWgxW+o
	3ajb7be2GBfKsNth1yUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFEjz-00043R-PA; Fri, 20 Mar 2020 10:18:59 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFEjw-00042O-73; Fri, 20 Mar 2020 10:18:58 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 4F407240014;
 Fri, 20 Mar 2020 10:18:43 +0000 (UTC)
Date: Fri, 20 Mar 2020 11:18:41 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yifeng Zhao <yifeng.zhao@rock-chips.com>
Subject: Re: [PATCH v4 0/3] Add Rockchip NFC drivers for RK3308 and others
Message-ID: <20200320111841.3386d415@xps13>
In-Reply-To: <20200320093342.15470-1-yifeng.zhao@rock-chips.com>
References: <20200320093342.15470-1-yifeng.zhao@rock-chips.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200320_031856_390574_D498D175 
X-CRM114-Status: UNSURE (   6.88  )
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
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, heiko@sntech.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWWlmZW5nLAoKWWlmZW5nIFpoYW8gPHlpZmVuZy56aGFvQHJvY2stY2hpcHMuY29tPiB3cm90
ZSBvbiBGcmksIDIwIE1hciAyMDIwCjE3OjMzOjM5ICswODAwOgoKPiBSb2NrY2hwJ3MgTkZDKE5h
bmQgRmxhc2ggQ29udHJvbGxlcikgaGFzIHRocmVlIHZlcnNpb25zOiBWNiwgVjggYW5kIFY5Lgo+
IFRoaXMgc2VyaWVzIHBhdGNoIGNhbiBzdXBwb3J0IGFsbCAgdGhyZWUgdmVyc2lvbnMuCj4gCj4g
Ckl0IGxvb2tzIGxpa2UgaXQncyB0aGUgdGhpcmQgdGltZSB5b3Ugc2VuZCBhIHY0IGZvciB0aGlz
IHNlcmllcywgaWYgeW91CmNoYW5nZSB0aGluZ3MgaW4gdGhlIHNlcmllcywgcGxlYXNlIGluY3Jl
YXNlIHRoZSB2ZXJzaW9uIG51bWJlci4gSWYKaXQgaXMgYSBtaXN0YWtlLCBwbGVhc2UgdGVsbCB1
cyBzbywgYmVjYXVzZSBpdCBpcyBub3QgZWFzeSB0byBmb2xsb3cgOikKCgpUaGFua3MsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
