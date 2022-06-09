Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F92C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 13:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Hia+SxunqMDJdnnHj+d/TN1avFcRailLxHCpsbT+PA=; b=FSGld5tpOlqwj3
	Rjv3mfzl3ecnvK7K3lHr0bGYzOTScZq77n3BtaUfrLHy68YFr9CwH0yduYIqnH4McnglkM3JvzQDB
	/HDi08R8qj+VkxYSAHrtfBHwTRsBZPR+JJ+5e7S3l0zpK4C3AzbRTuNxWF8uwNAuj9RslfuQlLHcZ
	X1PSn4nPe27fAggbQSkZqfEUJef3XJaMBUqUcP3fmys5JCzFSGwCXlqVU7EbNgCkB/L5Gue0C6/z1
	+ZHg0uG1GTJ9r68/sDMoaXebugu4MPgvpPa9dq5RF5bK/FrWDbBLv/ZNVTTEjpVZJx1Kz5orm7A6P
	IIbRrgsvLOcRjJezCNHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHuI-00208o-L5; Thu, 09 Jun 2022 13:09:02 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHuF-00206E-3e
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 13:09:01 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 23F621BF204;
	Thu,  9 Jun 2022 13:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654780136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ExFsoC1kMmD+KTyxpPV7vANui0wcJxVq00EOCBm0EFk=;
	b=P/+sxGl89/iH0Ba6evDnvmkWi8c4oO9i4ClXEWkKNmBysaQ72g0VbMSCq7j8MunzMnaFJq
	LSiHQW0cGLdqwJ5aXdq+bff4eeiUfRyK5MnGphqrjU4WRLPnR8BO1JY01gjdY3ANG8iwXd
	g+xNUrGVyduDvr8jRTGSq8Qsn6w9BTNlmPCZ1Laa5LGEo735ln+r8XRegCUBQX8VMenKaC
	qZieU44bVIOqdGRCGXSlnx5gNjMcayZfnSlfueAZ6EUpa+oBPlEiEfAz1XL4zWp1rG0gnG
	hDWFqE2vv+221F8FUWp3RrCXEYxpk2/tYlPfUQ+nUhoewueZfpFLdBZWOLp/Ew==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Arvind Yadav <arvind.yadav.cs@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 3/4] mtd: st_spi_fsm: Disable clock only after device was unregistered
Date: Thu,  9 Jun 2022 15:08:54 +0200
Message-Id: <20220609130854.292980-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607152458.232847-4-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'cd043c613e21bb6f039057043da759471706adf5'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_060859_373919_528FBEE9 
X-CRM114-Status: UNSURE (   7.99  )
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

T24gVHVlLCAyMDIyLTA2LTA3IGF0IDE1OjI0OjU3IFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
Sz1DMz1CNm5pZz89IHdyb3RlOgo+IFVudGlsIG10ZF9kZXZpY2VfdW5yZWdpc3RlcigpIHJldHVy
bnMgdGhlIGRldmljZSBpcyBleHBlY3RlZCB0byBiZQo+IG9wZXJhdGlvbmFsLiBTbyBvbmx5IGRp
c2FibGUgdGhlIGNsb2NrIGFmdGVyIHRoZSBtdGQgaXMgdW5yZWdpc3RlcmVkLgo+IAo+IEZpeGVz
OiAxZmVmYzhlY2I4MzQgKCJtdGQ6IHN0X3NwaV9mc206IGFkZCBtaXNzaW5nIGNsa19kaXNhYmxl
X3VucHJlcGFyZSgpIGluIHN0ZnNtX3JlbW92ZSgpIikKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xl
aW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgoKQXBwbGllZCB0byBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXgu
Z2l0IG10ZC9uZXh0LCB0aGFua3MuCgpNaXF1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
