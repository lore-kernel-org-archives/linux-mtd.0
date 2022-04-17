Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC5FC433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 17 Apr 2022 19:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i6qCvF7psZT8/h8rdaFVq84T/ug5y3yvkqS7vpQB4Cg=; b=4C1tgEcfeecDG6zaL6AGQ4Ae9z
	WMqPfiLGzrdlLoBoh+tueOptvnYFJrdjJG9EDUZW42jIM4GH+h/3aDNwEO2A/cBNBlkjefW6rP1ar
	qfYMYes6jcd2qIZaH+6w3iy3hfHGkfQE8iIXmTxZeBgy7pPhoSAnZbjgKIJJR4VPC+yG/9cO/7V04
	uhv7ctCMcfblMhJf5nV15UgmMJJMDsFLkQUVp+af8gwjqxEp8noVZYgxp7BhCaICZ6sfxCnu6rMQs
	PYZXUPXhadZTc5ub8qBLIK43Y4lEWfAiwRbc8EiVnH5icOh1yntrb3aV0fYzn4IlMCNsPcqTF9V7x
	YGnTDvPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngAcQ-00EsGV-6Q; Sun, 17 Apr 2022 19:31:34 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngAcN-00EsG3-DM
 for linux-mtd@lists.infradead.org; Sun, 17 Apr 2022 19:31:33 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id C3C4222238;
 Sun, 17 Apr 2022 21:31:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1650223886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pq6hLMQv4hPuNqosqBP+KVPlfDr1hbO5mSyBKH9f6cs=;
 b=qmXyC2SARbSt+czEPUlY1pJZ9nDT6eLGSPs/0vKSr8y2GSR9v7RoZl9+2YEeG137aWSPVr
 T+GU2UktPP/q/eIhjCuGYvucipw0XtD/sHjaYwFre3PwB9GamOxgCSpbUA7VhcmvmsSQJg
 cjXCJn7bvleMfc4LsskUwkS25DbUgrg=
MIME-Version: 1.0
Date: Sun, 17 Apr 2022 21:31:25 +0200
From: Michael Walle <michael@walle.cc>
To: niravkumar.l.rabara@intel.com
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: issi: Add IS25WP512 device
In-Reply-To: <d805708b94dc4a00b854f3769c5013b1@walle.cc>
References: <20220414130004.945924-1-niravkumar.l.rabara@intel.com>
 <d805708b94dc4a00b854f3769c5013b1@walle.cc>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <24c324e4f57c896bd289c367bdd5f9a8@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_123131_689158_1D72F3CF 
X-CRM114-Status: UNSURE (   4.86  )
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

Am 2022-04-14 12:09, schrieb Michael Walle:
>> +is25xx_post_bfpt_fixups(struct spi_nor *nor,
> 
> Please use is25_post_bfpt_fixups.

Sorry, this should be is25_nor_post_bfpt_fixups.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
