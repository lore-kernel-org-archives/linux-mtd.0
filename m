Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBF3C54EBD
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Jan 2023 15:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dC7zdqMSIrdqXjv8bXefA3KYWdwhQLDS8K4UeEryiWo=; b=DpDlKgFaCm3W33
	mWmiWzwlfPGuu/1Uquv2IsEKbglZ+SdfDra+BhbCbZxshKtenHaoFzOdmZL8VUtMBXhH+UxaAc2ju
	EsVtXhB2cUPNoyin/QV1+CpuV2pvS21CfmxaN/JaUj1mt+pk2WZrcS7BXga9bCx0GcIAOcs5q0+04
	v+DNfzog9/83XhqUclibBIpgl/z50HYn9SIUGbPd5lcJxu1Jl0n9liTOGvvamDdl84eJIVtHbK4Ei
	beTdtNizd9Dt7ej7u6gjiLJSwddv3EGFc8rl8OCqnwBBCK8+dzPAeB38p/jLs8uTg8Conb348DXuK
	3jUwKAnQJ0zdPV85N8cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEBJx-007XnO-0V; Sat, 07 Jan 2023 15:41:21 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEBJl-007Xhg-PH; Sat, 07 Jan 2023 15:41:11 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BBC34C0008;
	Sat,  7 Jan 2023 15:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673106065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rX0H29McC/C7xK42sgmW/TJ1Y/Q+h/+Kp2qtSE/fOWw=;
	b=kKdDbqy+oitflGNwjpX4pVzJ8wlLk53FfhhWqO/X6VRZ4982zWw2SvSlLC/xsm/mzifhx9
	Y/vjIMzkDwdEf0qZRlf2TB45/Fe+Gb11RDqmssfyW1ATz+PRwvYU6PIzEFZ2cSt9rn1RG5
	iEaYxrQlMR2BdluebwbE3ulEaAga51pGEQww9lc1MMqowHNNUxArfqW5fNYtotVm0SMyQM
	g1/zPXnvV2GSJAUsqOxPySe1Q+Fp14wKcd8R2z6jjw2260LeIv8L1eitEXlyYdXKcYhxd3
	8xmQCLtVO34rpHDcneDG/KtG2kbQHL71HfXq+963AGqm0RQQSWi/2VAwt9axOA==
Date: Sat, 7 Jan 2023 16:41:02 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack
 <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Arnd
 Bergmann <arnd@arndb.de>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 20/27] mtd: remove tmio_nand driver
Message-ID: <20230107164102.4e9265da@xps-13>
In-Reply-To: <20230105134622.254560-21-arnd@kernel.org>
References: <20230105134622.254560-1-arnd@kernel.org>
	<20230105134622.254560-21-arnd@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_074109_992665_BF4CA779 
X-CRM114-Status: UNSURE (   8.89  )
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

SGkgQXJuZCwKCmFybmRAa2VybmVsLm9yZyB3cm90ZSBvbiBUaHUsICA1IEphbiAyMDIzIDE0OjQ2
OjE1ICswMTAwOgoKPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IAo+IFdp
dGggdGhlIFRNSU8gTUZEIGRyaXZlcnMgZ29uZSwgdGhlIE5BTkQgc3VwcG9ydCBpcyBhbHNvCj4g
b2Jzb2xldGUgYW5kIGNhbiBiZSByZW1vdmVkLgo+IAo+IENjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1
ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IENjOiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRA
bm9kLmF0Pgo+IENjOiBWaWduZXNoIFJhZ2hhdmVuZHJhIDx2aWduZXNockB0aS5jb20+Cj4gQ2M6
IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJn
bWFubiA8YXJuZEBhcm5kYi5kZT4KClRoZSBwYXRjaCBkaWQgbm8gYXBwbHkgYXMtaXMsIHNvIEkg
ZGlkIHRoZSByZW1vdmFsIG1hbnVhbGx5IHdoaWxlCmFwcGx5aW5nIHRvIG10ZC9uZXh0LgoKVGhh
bmtzIQpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
