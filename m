Return-Path: <SRS0=I4i7=4T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D892BC3F2D2
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 09:31:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABC4D246B4
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 09:31:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RSDlpwv7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABC4D246B4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a0u2KyfEYwhO+aDJxobBE8fDPMGUXsnzfXqqWhMB/Pk=; b=RSDlpwv7cy9WQZ
	w+atCKfDzNTb9KungeyRjJlqptJGqNzyaF9eGFlzW3TYL+PBTl1JwXf24Hb7i6uPkibus+0rIKRg7
	sNeWTjAtPe6RYeI08wgRuU9q4l0JmNIq8qA3RUOqknOg2uHTaRbsPIgbeKexyXRxNMQq2q7qpzBd/
	Fu46h76ejIB5thidTVX5ulbICndBm9gBBuLu6FGSYK1VaMhHSEaLJKkGeHGiVqgzpkZFb4XXMpHq/
	Gm9fYYQKXFCY8zrKjDe7iRfrETYPWQvKsEuiaJXHXVvcB0N4uXeOW399DvdZ8wXCEvYHUc1Ql3k+x
	bNnxhIGl4VJA4ewk8xbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8hQJ-0000R8-EE; Mon, 02 Mar 2020 09:31:39 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8hQG-0000Q1-Oj; Mon, 02 Mar 2020 09:31:38 +0000
X-Originating-IP: 90.89.41.158
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 80483FF803;
 Mon,  2 Mar 2020 09:31:03 +0000 (UTC)
Date: Mon, 2 Mar 2020 10:31:03 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yifeng Zhao <yifeng.zhao@rock-chips.com>
Subject: Re: [PATCH 0/3] Add Rockchip NFC drivers for RK3308 and others
Message-ID: <20200302103103.1eb7df94@xps13>
In-Reply-To: <1582884076-27615-1-git-send-email-yifeng.zhao@rock-chips.com>
References: <1582884076-27615-1-git-send-email-yifeng.zhao@rock-chips.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_013136_944736_AEE4DFD0 
X-CRM114-Status: UNSURE (   7.65  )
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
ZSBvbiBGcmksIDI4IEZlYiAyMDIwCjE4OjAxOjEzICswODAwOgoKPiBSb2NrY2hwJ3MgTkZDKE5h
bmQgRmxhc2ggQ29udHJvbGxlcikgaGFzIHRocmVlIHZlcnNpb25zOiBWNiwgVjggYW5kIFY5Lgo+
IFRoaXMgc2VyaWVzIHBhdGNoIGNhbiBzdXBwb3J0IGFsbCAgdGhyZWUgdmVyc2lvbnMuCj4gCgpZ
b3VyIHNlcmllcyBoYXMgYmVlbiBiYWRseSBjcmVhdGVkLCBzdHJhbmdlbHkgSSByZWNlaXZlZCB0
d2ljZSBwYXRjaCAxCndpdGggdHdvIGRpZmZlcmVudCBjb250ZW50cywgcGF0Y2ggMiBhcnJpdmVk
IHdheSBsYXRlciB0aGFuIHBhdGNoIDEgYW5kCjMgYW5kIHRoZSBjb21taXQgdGl0bGUgb2YgdGhl
IGJpbmRpbmdzIHBhdGNoIGlzIHdyb25nLCBpdCBzaG91bGQKYmVzb21ldGhpbmcgbGlrZToKCglk
dC1iaW5kaW5nczogbXRkOiBEZXNjcmliZSBSb2NrY2hpcCBSSzN4eHggTkFORCBmbGFzaCBjb250
cm9sbGVyCgpDYW4geW91IHBsZWFzZSByZXNlbmQgdGhpcyBzZXJpZXMgaW4gYSB2Mj8KClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
