Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182DAC4167B
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Nov 2023 08:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzJoyfroNz8epZe2NecgnApNjsi2KlfkCuOS0a/mAYg=; b=nNflszfPSWHkR+QN0L3FoAG4k0
	siBF8dPvW+Gp/jDwoRPiT0bOCfhmziP+3Ljz/AZPyWhUuBMcKIBXzPKOMGrpbl/3biajbCqnOuiIK
	6II/NwTQhYzNait9srbNRMBBNIu8K+8BdlYvrSA+zvp9rwNbsQTiTMuVmZu2dubxPnHORgAAJY8a7
	mZbnOs/+grIOteA6A+jnkaEz6MdcLGpiG7A4zOajLd9tU0oi13PDRA/zEhsxFvVS4vt/TEdf6+uzG
	r0ByLnVV5N49x0/O1bmq0siF9cAoBzI72hv9nHMXhuytKRdm9kpkShcRN9RxGu5gxf14NPy3JlBhL
	oXxQMfgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7ta5-004YIj-2X;
	Tue, 28 Nov 2023 08:36:33 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7ta2-004YHm-29
	for linux-mtd@lists.infradead.org;
	Tue, 28 Nov 2023 08:36:32 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 61F27957;
	Tue, 28 Nov 2023 09:36:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1701160587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v7glijZ94HivCAw9X2/CNGh4iPBKIx0lMfpD6J7YHzw=;
	b=Q/V8VItWQFtZyEEvwC+SczVu+gyUqbQLZLTIH+h0OZyxZHBkhVp67d2HATpAkpt7rYr3dO
	UmFtaAD/hD1sNEBZZqNQL2mmy8RJPWjAlUOrWc0mH4gjJmh+9j4T3ns6b4HasL4F9Ne5l9
	vKzuW0qQg9V5PvpSMaQF9h+8O5C0An1dloKkPj6dzsshpGhrveILw0hMy7BAAyy2RjNrET
	GQXDfMz3KiyeFx+3RiJtpDX4XlShpdTXD74EkUaQUZCaBVOliIuEwNVX3AjwqxQW9j+C1B
	tEePae6WjARPrhqunE0QWTfR4FcdA4ZwKvkkTEti5LvXUusYK0jWYezSgR1smA==
MIME-Version: 1.0
Date: Tue, 28 Nov 2023 09:36:27 +0100
From: Michael Walle <michael@walle.cc>
To: "Boyapally, Srikanth" <Srikanth.Boyapally@amd.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, tudor.ambarus@linaro.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, "git
 (AMD-Xilinx)" <git@amd.com>
Subject: Re: [PATCH] mtd: spi-nor: issi: Add support for is25lp02g
In-Reply-To: <BN9PR12MB51966705C3E306502ABABA6E9EBCA@BN9PR12MB5196.namprd12.prod.outlook.com>
References: <20231123054713.361101-1-srikanth.boyapally@amd.com>
 <mafs0jzq7dx8l.fsf@kernel.org>
 <BN9PR12MB51966705C3E306502ABABA6E9EBCA@BN9PR12MB5196.namprd12.prod.outlook.com>
Message-ID: <6342ad8a798ef811d37775b7269623a3@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_003630_853330_1E42B64B 
X-CRM114-Status: UNSURE (   9.95  )
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

Hi,

>> > Add support for issi is25lp02g.
>> >
>> > Verified on AMD-Xilinx versal platform and executed mtd_debug
>> > read/write test.
>> >
>> > Signed-off-by: Srikanth Boyapally <srikanth.boyapally@amd.com>
>> 
>> Based on a datasheet [0] I found online, this flash seems to have 
>> SFDP.
>> And since you do not add any flash specific fixups, it likely does not 
>> need an entry
>> and would work fine with the generic flash driver. Did you try using 
>> that? See [1]
>> for more info on contribution guidelines.
>> 
>> [0] https://www.issi.com/WW/pdf/25LP-WP02GG.pdf
>> [1] https://lore.kernel.org/linux-mtd/20231123160721.64561-2-
>> tudor.ambarus@linaro.org/
>> 
> I ran mtd_debug read/write tests on this flash, without adding flash
> entry, it worked fine for me. Please ignore this patch.

Great! Could you please still dump and post your SFDP just for us to
have more SFDP of diferent flashes? See [1].

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
