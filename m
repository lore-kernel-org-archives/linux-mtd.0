Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3E8CFA76A
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2024 11:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FK/f+w0gtNN5jzLIq7VNmCu9B7bzSI8mZjtq2hn8jBg=; b=0tSPWVEmJP6Neb
	BcMOQiCra+h8IV1NXEwzjGuDvvUInlbjWUYptvJoXFIOnrDKv2KZTxP7+7JD5OPlicldoEcYyLbic
	+sXzrwwGBu8NUlkWySMKYOtS03yvesHOQ3kXd54ueHC2xzTTzcVlh+KGVEJLxTi9260wxCtqNmBc6
	v2NtGb1O9gx7sXk4I3Ul+XridQuCeRP768p50yL/oEyL4aw5bkIYD19MTnKmpyP21Z50Hj+jimzOv
	C9zW3rr6pUIKgjNFJH61WJ872mUYZY5/pfIsFfQ/2XsfHhw4Crmjp65aKvxnwrKlq8gwfdZcESX1Z
	G9HFv4jgj1VNBMiK4qXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swgM3-0000000C54x-2tuL;
	Fri, 04 Oct 2024 11:20:15 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swgF5-0000000C2k8-2dXL
	for linux-mtd@lists.infradead.org;
	Fri, 04 Oct 2024 11:13:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC9F3E0004;
	Fri,  4 Oct 2024 11:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728040379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uWJpWfVVmhp6/USa7TNupLRzH7JfpNcqUZ83ujHpQTw=;
	b=Gtot70MS7zUOsJICv+34irrkhFF+T2szuAWXaNyHAMObNpHzi1iafymW5MuSgctdIWgr25
	EKV5aiPdMnQpIqg6/gAeWz7K7PhZnmtRmlIYLiIXc6i2RVSPvOcqyqLHlxusdIug2hadMG
	GbQR6cmblzCiw5A8ontXwb0lXn+hLmpFYs6g3Os+a8OUA7wVDUMinX9RGyRK2K5MGZWD9K
	Wnm/CgnodrsafMAptL1LHZgMFfrDH9NKW9Fz5zyFVwAx0F1W4b2Ep9EYqApjJzg+jU08GL
	y+1SPIBFu65wkyQeXx+CHQRPwQx5ftGNPG1BBs65r69/qlqu+Bkn7kpWXdMOqQ==
Date: Fri, 4 Oct 2024 13:12:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Han Xu <han.xu@nxp.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 29/51] mtd: rawnand: gpmi: Switch to
 __pm_runtime_put_autosuspend()
Message-ID: <20241004131256.193dd92a@xps-13>
In-Reply-To: <20241004094133.113844-1-sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
	<20241004094133.113844-1-sakari.ailus@linux.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_041304_336319_73EA9404 
X-CRM114-Status: UNSURE (   8.00  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2FrYXJpLAoKc2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbSB3cm90ZSBvbiBGcmksICA0
IE9jdCAyMDI0IDEyOjQxOjMzICswMzAwOgoKPiBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgp
IHdpbGwgc29vbiBiZSBjaGFuZ2VkIHRvIGluY2x1ZGUgYSBjYWxsIHRvCj4gcG1fcnVudGltZV9t
YXJrX2xhc3RfYnVzeSgpLiBUaGlzIHBhdGNoIHN3aXRjaGVzIHRoZSBjdXJyZW50IHVzZXJzIHRv
Cj4gX19wbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpIHdoaWNoIHdpbGwgY29udGludWUgdG8g
aGF2ZSB0aGUKPiBmdW5jdGlvbmFsaXR5IG9mIG9sZCBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVu
ZCgpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNha2FyaSBBaWx1cyA8c2FrYXJpLmFpbHVzQGxpbnV4
LmludGVsLmNvbT4KCkFyZSB5b3Ugc3VyZSB1c2luZyBhIGNhbGxiYWNrIHByZWZpeGVkIHdpdGgg
J19fJyBpcyByZWxldmFudCBpbiBub3JtYWwKZHJpdmVycz8gSSdkIGV4cGVjdCBzb21ldGhpbmcg
Y2xlYW5lciBmcm9tIGEgbmFtaW5nIHBvaW50IG9mIHZpZXcuCgpUaGFua3MsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
