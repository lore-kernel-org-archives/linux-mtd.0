Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A78BC4345F
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2024 14:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HxuFhpZHLKLyIKBL/aNUH/RyQfaAKV97DSO3SOVqZ2M=; b=1kX8icaPMlxQBx
	RwV5M6AGzVPK3FXXwNAFYd7m2vm3ei0FsI+ZQlMP7CUpPqDI5R9QRbmuojJiz8fyb35AzcMLIOjav
	GftnY/x9/7Jqox96CB1DF+b0EexmAouQ29MtGbKab9DpbEOpl57Nma5EtALSl1b/nTakGoT+jv7XQ
	n0rcDehmdRVq5/fokRIJoTmKzBZCI/yEwO+pgtGCJKxBDHJMgu/SDlvcqYkWcoiZNjayJaVFjMimv
	YElmcVw+IarvXg4S/GuU+KgNRREYAsBCVAER5+q9nKuxh3MpM87gYkPbQ/DKcjosaPJ5Kty8W6tLk
	Wc78uoUqBxSN0SIY0kjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx67p-0000000GJew-16QV;
	Wed, 17 Apr 2024 14:19:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx67m-0000000GJeN-3dco
	for linux-mtd@lists.infradead.org;
	Wed, 17 Apr 2024 14:19:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E4D6F6123F;
	Wed, 17 Apr 2024 14:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 671E1C072AA;
	Wed, 17 Apr 2024 14:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713363537;
	bh=MZQGj06BJDdrslsKZJAiXK55Co8ES6uGoSaBdr5+6bI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fUGdD89Km7HiRVPvV9ilyfxfT8MehO5cgauI6yIvifsb9UztQiV8UtJ02vrG/pf1U
	 HLmT27aX6TVjTtmQ7AoppChmzdNpXqM32hsyuVe2bGt/LdeZkx8D36VOIMPQNpcasg
	 LjN7njybBqoCwTeuatDo/aDuh1HteTmV4u/64a2LjWiRjU3L85AsERHFWsLVgFujUB
	 ibSmUTAZ7b88htsH6jY7ogxq4wFK8RmBFIM4G0rU833BLHTjmPK46AaZgBETKGfFJY
	 /bCDVk5Mp2uZ2BNBfZGsOBQ8j9SuxoB2byM9LYsISds8dhqVG9qxlqrgCM2CvPEv6c
	 aFVPfjj202BAA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v1 5/6] mtd: spi-nor: simplify spi_nor_get_flash_info()
In-Reply-To: <20240412134405.381832-6-mwalle@kernel.org> (Michael Walle's
	message of "Fri, 12 Apr 2024 15:44:04 +0200")
References: <20240412134405.381832-1-mwalle@kernel.org>
	<20240412134405.381832-6-mwalle@kernel.org>
Date: Wed, 17 Apr 2024 16:18:55 +0200
Message-ID: <mafs0o7a86pio.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_071859_071798_2B746619 
X-CRM114-Status: UNSURE (   7.05  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On Fri, Apr 12 2024, Michael Walle wrote:

> Rework spi_nor_get_flash_info() to make it look more straight forward
> and esp. don't return early. The latter is a preparation to check for
> deprecated flashes.

Looks much nicer now! Though I did spend around 15 minutes wondering if
it can be made even simpler, but I can't come up with anything better.

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
