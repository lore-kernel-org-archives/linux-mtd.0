Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EF0CA0ED3
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Sep 2024 14:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=35Z8eEd8nzFi4tVkG0fIQspdTX1I8TwLJ+1qqVDeRac=; b=0JLxWD9sJWFtcu
	ItVmX6c61BGQpkGQGrq00X9mZFTbnOnvIxBBU7ukRGul1Rw3HBxZwchWUtallzngXfClEhOz4hvG1
	PNI24QGo2/+NBXKItLUc/cbrctV0lBASyV29oX4LdSfWULG6Q0hn9KoGoY2ojrk2xaESpmCS3fu9r
	R8FYYVmDPiMgFZa9Dr1K64FbdeOhRaBmJMiBXjIVyBWI6IrGTz3vsmi4SlXSWzjqkalXM7REWDFip
	dPSSYLSSQNrFWJBiXyV3oPo3qKG/F4nhWKaIQt26slXFE8aRmKSO1jHBLUzvL//u8ah/J2AwQ9ZmA
	t8z9eEDEBN8cA9J4JPbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slqYj-00000004faJ-3vAb;
	Wed, 04 Sep 2024 14:00:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slqYg-00000004fZR-2YEu
	for linux-mtd@lists.infradead.org;
	Wed, 04 Sep 2024 14:00:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EA185A44398;
	Wed,  4 Sep 2024 14:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D6DC4CEC6;
	Wed,  4 Sep 2024 14:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725458428;
	bh=RMcBzsfPKn0VFKK+q6cn1224QUjbLG3SRwjvEetOfL0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mJzwvSwTTctvN0VsrTgqUOCYROkui0e/OesPtyDp9nS/0IuAPJYkySiE9z7HD3QOo
	 xaQmgvudniNSOGX1GDWw74RPkJAtuNC6lhPhqDkIB5VP7MxVu+Deivd0sohCdO8czm
	 15Qn2C1MyFlkiUAP5ZUjOvzzdjf+K+w28ho+YaoI4UUT3AQLcpZvMLYJzuDtM7x8qR
	 PwBXmqQds6a7bAswMbAma9+6AewOBuvvyTLAYVyv/vwklMIjaMFLKbXajHfhsb+uhf
	 sbOAkF8QqfhxTUFakjWffYMST30vk1+crtUJmIjzQNPHwhe/yCnOw0udDR0wbYZS+h
	 92QHKzTi3EmPg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush
 Yadav <pratyush@kernel.org>,  Michael Walle <michael@walle.cc>,
  <linux-mtd@lists.infradead.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Liang Yang <liang.yang@amlogic.com>
Subject: Re: [PATCH] mtd: rawnand: meson: Fix typo in function name
In-Reply-To: <20240826153158.67334-1-miquel.raynal@bootlin.com> (Miquel
	Raynal's message of "Mon, 26 Aug 2024 17:31:58 +0200")
References: <20240826153158.67334-1-miquel.raynal@bootlin.com>
Date: Wed, 04 Sep 2024 16:00:26 +0200
Message-ID: <mafs0a5gnikn9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_070030_731957_B68FA544 
X-CRM114-Status: UNSURE (   9.28  )
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

On Mon, Aug 26 2024, Miquel Raynal wrote:

> There is a reason why sometime we write "NAND chip" with an 's'. It
> usually means several chips can be managed by the same controller. So
> when initializing a single chip at a time, the wording "chip" must be
> used, otherwise when talking about all the chips managed by the
> controller, we want to use "chips". Fix the function name to clarify the
> meson_nfc_nand_chip*s*_cleanup() helper intend.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
