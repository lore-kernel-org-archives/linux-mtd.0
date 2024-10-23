Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44710CDDE49
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Oct 2024 10:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z1ArI3kEKtiy9HIudsqwv8HnkF28DRs4g9TI3DvtE0E=; b=e2vGFIh9wVESCc
	6y6z8y+W0Squ0ppJaArsNkZoZhm/3kOhAvRaZwuv5ij4caF/SHFquhUsF5rkN18AEpFgtyO4iJTmK
	cfowDgVENY5CI/BY7qwZCPpMNcXU8FBU4czoCzKHKVxS2D110UjJrW+nnQhBYjz+81ZKDdkV1kV4Z
	b1hMjT1oB8cJ/sAyysD0T17lreiNWLfg0ncq6LcMs96AbU8PogjxJr/nA3MkEFD6lUCQ4OjvQdC70
	U9dMTNyxNg6jLLxmkVKQ3ayrazlZJvu1sznEvepyqr2J5dF+j6lYA4GWvH/Cn0eT8H2VZ15tRkwNw
	cHiq0nsuF2rlPirBGi4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YAd-0000000DuDG-0IrB;
	Wed, 23 Oct 2024 10:00:51 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Xzf-0000000Drd7-1JbI;
	Wed, 23 Oct 2024 09:49:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4DE4520003;
	Wed, 23 Oct 2024 09:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729676966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k5rNzgUZyWrtBSbaLrqGd7OPbJDTaej+TlqFpiYfr5w=;
	b=F8eYGl/LUBLH5b5Qbnd7lJ8YsELa2AQ0vy3Ybz2eaaPly6sCgzpuebVN4kemUl9fWuTNhz
	8NEvWEaI81iXglBSAOCmf0xB/nJWq48qkvmb3GTf/5L+a/uO7twrYokRpy+GQAnKesoj9z
	AmZG+kTk+Dfgco6KAMJ28M4LCBlpeybWl1GtRRdNpokUsl1Li1PIzgaobDgkor0B989FXU
	3RNzD6i/t8PKUYoRHKtiMD+pR29ikp5HTDP2ttBWHW6vEFhjSQ6Sn0PJktpD1tbPMRhIWK
	hX8Zcm1bhpGJ+wYwu+qb5VtQUBV2Reubwe/kxOk/Nid3XXy4dHxB4BJ6KJ+Bbg==
Date: Wed, 23 Oct 2024 11:49:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] mtd: rawnand: fix double free in
 atmel_pmecc_create_user()
Message-ID: <20241023114923.18e8e1b2@xps-13>
In-Reply-To: <7d809e5f-32e1-4438-9cc6-3167f27dd239@stanley.mountain>
References: <7d809e5f-32e1-4438-9cc6-3167f27dd239@stanley.mountain>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_024931_664358_6D50695A 
X-CRM114-Status: UNSURE (   6.95  )
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

SGkgRGFuLAoKZGFuLmNhcnBlbnRlckBsaW5hcm8ub3JnIHdyb3RlIG9uIFdlZCwgMjMgT2N0IDIw
MjQgMTE6NDA6NTYgKzAzMDA6Cgo+IFRoZSAidXNlciIgcG9pbnRlciB3YXMgY29udmVydGVkIGZy
b20gYmVpbmcgYWxsb2NhdGVkIHdpdGgga3phbGxvYygpIHRvCj4gYmVpbmcgYWxsb2NhdGVkIGJ5
IGRldm1fa3phbGxvYygpLiAgQ2FsbGluZyBrZnJlZSh1c2VyKSB3aWxsIGxlYWQgdG8gYQo+IGRv
dWJsZSBmcmVlLgo+IAo+IEZpeGVzOiA2ZDczNGYxYmZjMzMgKCJtdGQ6IHJhd25hbmQ6IGF0bWVs
OiBGaXggcG9zc2libGUgbWVtb3J5IGxlYWsiKQoKSG0sIEkgbWlzc2VkIGl0LiBUaGFua3MgZm9y
IHRoZSBmaXghCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
