Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91214C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Nov 2022 08:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aRffJ+tYwDCG+E3JsZGHnxgXM/Ti+TTPU/CItvCIP2Y=; b=jJgaamcbDMBccP8Z/8JV7zRmuP
	lYg/c1TgayhmT5dkvPGIRJ/hk92sqH9rSQWiviFCG/NrlNJk4HHz0U2oWSIf+najS8aBGdHcd6MUC
	jJFHl4tyrE/GBU7ZATqkK5SclSOrJfASzECv1mQwJzafhuXDg6gY8XNCcuMRvfOIfrbRCfQ/T2DhY
	93bfCgSn+wj6Gu8Jhaf5KhV9t/5bW0RLGf4oVy7MpNIMu2rtQ13M3lLRcKettX2stuSqZpLzz1GEK
	03awq40oZT7P9IhZKgQDV8BHFL8kLdKgb6CiVMHoWOjz/4iYZuAhhvIizww/Ypx8wJBsdiEkJd0si
	dubdeGqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy7GN-006RSO-9s; Thu, 24 Nov 2022 08:07:15 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy7GJ-006ROy-KJ
	for linux-mtd@lists.infradead.org; Thu, 24 Nov 2022 08:07:14 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id E6DE51382;
	Thu, 24 Nov 2022 09:07:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1669277227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3oyThiqymInQ+VthPmFXExjCfeb3J0zdU0dVGbxnNXU=;
	b=cyU95ByhbpMSEw5v4I3cWJcsGYse3UlbVRxkrc9er/Fep/usCpQ61tPKAVzreU7IPUaVEV
	ag5eaUTxa31vcayMTrzUvl1ytLirgqtZ8klXQ6KP+vwnvrus5oPoONysP6vAfIgdkEBL2n
	LX/opTqBYDhKToWnMW48mwhBYWSA05av+ihwQ3Xx2qMN0xf9820HAsbCV8h9EoxPz0lVAf
	JyDQWvFRApxuf5iikIJGgL3+u07iHr9TQ7NWmCVSGjOpGpkk2EL9PCIjFeF0r1QGZDWzvm
	68F3+tnc3gG+rmhmXP7Q5w3kH5KdPgzbp7w00YnJKg3/HgnGrWWv2uSh3IlfIg==
MIME-Version: 1.0
Date: Thu, 24 Nov 2022 09:07:06 +0100
From: Michael Walle <michael@walle.cc>
To: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Cc: greg.malysa@timesys.com, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] These are the required patches I found while adding
In-Reply-To: <20221123211335.126417-1-nathan.morrison@timesys.com>
References: <20221123211335.126417-1-nathan.morrison@timesys.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <bb6c006a27184ffa0e4ab9303cffcc72@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_000711_850071_9E8EF66D 
X-CRM114-Status: UNSURE (   9.66  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Nathan,

Am 2022-11-23 22:13, schrieb Nathan Barrett-Morrison:
> 1) The core framework needs some additional logic for 8S-8S-8S to pass 
> through
> succesfully.
> 
> 2) The IS25LX256 chip needs added to the SPI part table along with
> various fixups

Unfortunately, I can't make any sense of this series. First of all, the
IS25LX256 [1] doesn't support 8S-8S-8S, only 8D-8D-8D and 1S-8S-8S, see
ch. 4. Confused, I've looked at your octal str enable function and it 
writes
0xc7 to the volatile configuration register 0x00. According to the 
datasheet,
that is the enable for the octal DTR mode.

Please explain your problem and your motivation in the cover 
letter/commit
message and how you fix it.

[1] https://www.issi.com/WW/pdf/25LX-WX256-128.pdf

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
