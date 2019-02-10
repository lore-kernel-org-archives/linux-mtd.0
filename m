Return-Path: <SRS0=jA3O=QR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA00C282C2
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Feb 2019 18:57:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B96AD21736
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Feb 2019 18:57:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f8kVldVu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B96AD21736
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JYIDqvdDX+iFblFnPM/mQqtSCRdko30HQ7zhKUIm6nA=; b=f8kVldVuMlluOS
	RiT+3OJwbOsJIMHMlL33+foh6F4SAjML76/RRJYEV3kvDa+1Hm+4+F3DtoYvledXxoS2pJgzs39t2
	eZ/Xplik2mRZBGcRSyIQg6SY+2LtmU68lCJIPwJ5npJL72wlzvSro3YmrShqdujeRNiKjwtnxGBO/
	NUhJ1XNfajzkV2rROpMq38j69zbCZNdkdHekYnw9gA5Kwe7p9c4rfuA0LZPdmyiWLi/lS4lfz8Y+e
	TClT1CptBeTeFUAvoJ/UnVJwooXZIzvjLoInJcXAaEy5b7tn04wbRlB2971qZ0p+udJe8gxD3iIP8
	/C7nl+5SdYnLgSx3YHEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsuHp-0002I2-KO; Sun, 10 Feb 2019 18:57:05 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsuHh-00025Y-OE
 for linux-mtd@lists.infradead.org; Sun, 10 Feb 2019 18:57:03 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B56592607F0;
 Sun, 10 Feb 2019 18:56:55 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ding Tao <miyatsu@qq.com>, avalentin@marcant.net, hauke@hauke-m.de,
 marek.vasut@gmail.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@bootlin.com, richard@nod.at, Tudor.Ambarus@microchip.com
Subject: Re: mtd: spi-nor: Add support for mx25u3235f
Date: Sun, 10 Feb 2019 19:56:52 +0100
Message-Id: <20190210185652.29330-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190130041121.109735-1-miyatsu@qq.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 748df6d831871ca2338644e6c61a84a02a8e2786
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190210_105658_494474_C6A301C2 
X-CRM114-Status: UNSURE (   7.58  )
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
Cc: linux-mtd@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogQm9yaXMgQnJlemlsbG9uIDxiYnJlemlsbG9uQGtlcm5lbC5vcmc+CgpPbiBXZWQsIDIw
MTktMDEtMzAgYXQgMDQ6MTE6MjEgVVRDLCBEaW5nIFRhbyB3cm90ZToKPiBGcm9tOiBBbmRyw6kg
VmFsZW50aW4gPGF2YWxlbnRpbkBtYXJjYW50Lm5ldD4KPiAKPiBUaGUgbXgyNXUzMjM1ZiBpcyBm
b3VuZCBvbiB0aGUgWnlYRUwgTkJHNjgxNyByb3V0ZXIsIHRoZXJlZm9yZQo+IGFkZCBkcml2ZXIg
c3VwcG9ydCBmb3IgaXQgc28gdGhhdCB3ZSBjYW4gdXBzdHJlYW0gYm9hcmQgc3VwcG9ydC4KPiAK
PiBNaW5pbWFsIHRlc3RlZCB3aXRoIHUtYm9vdCB0b29scyBmd19wcmludGVudi9md19zZXRlbnYg
b24gR2xvYmFsU2NhbGUKPiBFU1BSRVNTT2JpbiB2NSBib2FyZC4KPiAKPiBbbWl5YXRzdUBxcS5j
b206IFJlbW92ZSB1bm5lY2Vzc2FyeSB3aGl0ZSBzcGFjZS5dCj4gU2lnbmVkLW9mZi1ieTogQW5k
csOpIFZhbGVudGluIDxhdmFsZW50aW5AbWFyY2FudC5uZXQ+Cj4gU2lnbmVkLW9mZi1ieTogRGlu
ZyBUYW8gPG1peWF0c3VAcXEuY29tPgo+IFJldmlld2VkLWJ5OiBUdWRvciBBbWJhcnVzIDx0dWRv
ci5hbWJhcnVzQG1pY3JvY2hpcC5jb20+CgpBcHBsaWVkIHRvIGh0dHA6Ly9naXQuaW5mcmFkZWFk
Lm9yZy9saW51eC1tdGQuZ2l0IHNwaS1ub3IvbmV4dCwgdGhhbmtzLgoKQm9yaXMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
