Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD1AC43334
	for <linux-mtd@archiver.kernel.org>; Sat, 16 Jul 2022 09:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LX+f8UMHaXwljFK4Ek1fc5XqtsnSqTnA+mAsSOxW47U=; b=Agdu/v+ifNelBE1BWJqOSKFAMq
	DNokJMiRuTzsYuIeCwciNdDoC4QTb7n5v0F/hmsYx4WfIl9Inp+pK9MSH6Ck7JKLvlx0XV8m2hYaY
	wBLQLoBr3q8LtUgamSVNEr0xJeiUdtcKgGr/GmnLJN4WAUglbfoO/NfkPkH0kvejwCKxJOUKqtRYG
	l8CHrtsd3VCqWCBurDJJMTtNHy63tnzdF0ziUtS022qs9f+QUHymloMT20a/j7+CAhENDG2opQO7n
	/81MB6kx3khRbdOT+y65vK5+QFy8/ZmZ6eZKZV8bwxIKFLgv8LOEHBKTzTy8TAY0qAZC6jutzugPk
	1DaF5V9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCdq0-00Etid-Az; Sat, 16 Jul 2022 09:11:48 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCdpw-00EthB-S5
	for linux-mtd@lists.infradead.org; Sat, 16 Jul 2022 09:11:46 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id D9C4222239;
	Sat, 16 Jul 2022 11:11:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1657962696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yQGL23JsPeSeAEQf+zFFrbIZAmWH8zEFfmNMuLuPhpc=;
	b=adivtjJ8EP/gIxSf5jgl/wyTKIUeMTPJctYdpQUagTsYiY/I1+k09dm4e8QVscwkFtWpm+
	we9xa/wMvvkraVLkJjqGs+PspYY7dJflaK+RM5eSb6N0qX+4xNhnv1EWOyXJztxj4c3Fhq
	h9nP3QjkbhljrVJjDoG+Lapm6FDmjYQ=
MIME-Version: 1.0
Date: Sat, 16 Jul 2022 11:11:35 +0200
From: Michael Walle <michael@walle.cc>
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Jamie Iles <quic_jiles@quicinc.com>, Graeme Gregory
 <quic_ggregory@quicinc.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: winbond: add support for
 W25Q512NW-IQ
In-Reply-To: <20220716000643.3541839-2-quic_jaehyoo@quicinc.com>
References: <20220716000643.3541839-1-quic_jaehyoo@quicinc.com>
 <20220716000643.3541839-2-quic_jaehyoo@quicinc.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <52fb683e27b3208d07d9f9d1ab44148d@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_021145_106736_3B722BE3 
X-CRM114-Status: UNSURE (   6.92  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpBbSAyMDIyLTA3LTE2IDAyOjA2LCBzY2hyaWViIEphZSBIeXVuIFlvbzoKPiBBZGQgc3Vw
cG9ydCBmb3IgV2luYm9uZCBXMjVRNTEyTlctSVEvSU4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYWUg
SHl1biBZb28gPHF1aWNfamFlaHlvb0BxdWljaW5jLmNvbT4KPiBMaW5rOiAKPiBodHRwczovL3d3
dy53aW5ib25kLmNvbS9yZXNvdXJjZS1maWxlcy9XMjVRNTEyTlclMjBSZXZCJTIwMDcxOTIwMjEu
cGRmCj4gUmV2aWV3ZWQtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+CgpUaGFu
a3MgYWdhaW4gZm9yIGZpbmRpbmcgdGhlIHJlYWwgaXNzdWUgaGVyZSEKClJldmlld2VkLWJ5OiBN
aWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPgoKQnV0IGFsc28gc2VlIGJlbG93LgoKPiAk
IGhleGR1bXAKPiAvc3lzL2J1cy9wbGF0Zm9ybS9kZXZpY2VzLzFlNjIwMDAwLnNwaS9zcGlfbWFz
dGVyL3NwaTAvc3BpMC4xL3NwaS1ub3Ivc2ZkcAo+IDAwMDAwMDAgNDY1MyA1MDQ0IDAxMDYgZmYw
MSAwNjAwIDEwMDEgMDA4MCBmZjAwCj4gMDAwMDAxMCAwMDg0IDAyMDEgMDBkMCBmZjAwIGZmZmYg
ZmZmZiBmZmZmIGZmZmYKPiAwMDAwMDIwIDZmMDAgNzA3NCA3NDIwIDczNjUgZmY3NCBmZmZmIGZm
ZmYgZmZmZgoKRGlkIHlvdSBub3RpY2VkIHlvdXIgU0ZEUCBkYXRhIGNoYW5nZWQgY29tcGFyZWQg
dG86Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDIyMDcxMDE0NTcyMS4xMjA3
MTU3LTEtcXVpY19qYWVoeW9vQHF1aWNpbmMuY29tLwoKV2hpY2ggbWFrZXMgbWUgd29uZGVyIGlm
IHlvdSBldmVyIGhhZCBhbiBvZmZzZXQgMAp3aXRoIHRoZSBPVFBfSU5GTygpLiBGb3IgV2luYm9u
ZCB0aGUgZmlyc3QgT1RQCnJlZ2lvbiBpcyBhY3R1YWxseSB0aGUgU0ZEUC4uIFNvIHlvdSBtaWdo
dAphY2NpZGVudGFsbHkgbW9kaWZpZWQgaXQuCgotbWljaGFlbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
