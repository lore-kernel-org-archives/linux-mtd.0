Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BC2C54E49
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2024 17:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gRpPJM/3rAGmwRQna5QUICJZtIZLw/q/kUh1utlxqsA=; b=S/q6y+Q3GxkmTQ
	6zS4pDCXe9/shKRhPqGjEpXT/u7ksSLa6LooBhyoU9qxFocbLdUZaZIZjrn2AN/m9xQEvCZjYtwx2
	08lwzewDx19BWmtQtNKf5oLq6PAWYCsYMu+Fm35r7NcNui7GzKvn2fHIsGPjYUZqmiGr4HaUjmQpj
	BPj0EcMbu4DsCIO6U9aFtDH21cGeMhDPTE0BgPKxrpxc0Y0ylF/LOsjJiLUZi4n4O6jlpevMwoJ6x
	KMJuuZvjVP7fs6Od0Z4G+143whXK+t+JgAKZj580id+EJjcNduQTaVKHYBP5EZ5Il0mcyshqCH8n2
	lhdCUmwh/855HslNVSvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riHFO-00000005cro-2kPf;
	Thu, 07 Mar 2024 17:09:34 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riHFJ-00000005coQ-3XCk
	for linux-mtd@lists.infradead.org;
	Thu, 07 Mar 2024 17:09:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DEFA61BF20C;
	Thu,  7 Mar 2024 17:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709831362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0158TLc0ICtoCZguejr+zbtSGcdN6fCyVK3FtyQSPF0=;
	b=aSX5IC8wo2daPPFRNdt26E3qkyG0IMb7wG2NxHIov3jWV5fHN31m+vqOABVnwvKLNGM/5r
	IpG3YY2FQTPiBtBvIurSMUvEBav/VYj88aZo3JtqsKTPAQu89B+t3/Crs+q4HfWIBps4ye
	JBtUnRs6lJVnC26mqLmXumUCDsVSBZDhUMaNgk49S0wKuaXFA31+rRqWJL84i/wiTGNqgj
	lB3jPnUeYiU/3p605kEvQRw51DEx/TeYudgdj5WAy5wslcobxTPWltFHe8yDUwXSnTbTwW
	WoKxtSomNO85cNxIz8KzwInFbitAYrJL5eA9IDK4wpHxi2uxuWBAnDAqPORaHA==
Date: Thu, 7 Mar 2024 18:09:19 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, Michael Walle <mwalle@kernel.org>,
 Pratyush Yadav <pratyush@kernel.org>, "open list:SPI NOR SUBSYSTEM"
 <linux-mtd@lists.infradead.org>
Subject: Re: [GIT PULL] mtd: spi-nor: changes for v6.9
Message-ID: <20240307180919.4cb7a4cb@xps-13>
In-Reply-To: <7d391df2-09e4-4166-9116-312bfa74e738@linaro.org>
References: <7d391df2-09e4-4166-9116-312bfa74e738@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_090930_166615_1B27F5FB 
X-CRM114-Status: UNSURE (   7.90  )
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gVGh1LCAyOSBGZWIg
MjAyNCAxNjoxNTozNCArMDIwMDoKCj4gSGkhCj4gCj4gSGVyZSBpcyB0aGUgU1BJIE5PUiBQUiBm
b3IgdjYuOS4KClRoYW5rcyBmb3IgdGhlIFBSLiBKdXN0IHRvIGxldCB5b3Uga25vdywgSSB3aWxs
IG1lcmdlIGl0IGVhcmx5IG5leHQgd2VlawphcyBJIGRvbid0IGhhdmUgZW5vdWdoIHRpbWUgbm93
LiBJIHdpbGwgYWxzbyBhcHBseSBhcyBoaW50ZWQ6CgoJW1BBVENIIHYyXSBtdGQ6IHNwaS1ub3I6
IGNvcmU6IGNvcnJlY3QgdHlwZSBvZiBpCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
