Return-Path: <SRS0=Tm4b=6O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B0FC8300A
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Apr 2020 12:36:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E69C12072A
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Apr 2020 12:36:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VjiEd/GA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E69C12072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KaMyGdDjJRayahXBP8AUcfHYgc4TrI+9jlw+2XTm5Eo=; b=VjiEd/GAb4H3/m
	t8mdrisZplkRNt5F3N6hKGQlPmTXMQm/nM/JYrdnH0Do7Zqc+R/Pxl/h7REjMwSjlkxQb7BDFqVmu
	Oykxn+eeAEVy9FknE4kqXUD4v1Gf0moo58QJc6IOKFonSlMXHsB6DyZ6XAlUw1Bb9LSBjwNbifXeK
	fKB4u+sffaAMXwgMc7ghFwcSiC952iYGCIs4GxbPvjEA7OTfNkWofyxrAaYAVhudrkR3I9QmxvGVB
	JJeNJAjnQozgQzUj6V5w/unCpjSiSbRnFffGcTwDO2MwC/gYr/M43A6w/fzxgXhLy7+ducsv0N3xT
	4PKgPoDm8o+T96F5wzag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jU8QF-0001oB-5Y; Thu, 30 Apr 2020 12:36:11 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jU8QA-0001nC-Nb
 for linux-mtd@lists.infradead.org; Thu, 30 Apr 2020 12:36:09 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 101482A23DC;
 Thu, 30 Apr 2020 13:36:03 +0100 (BST)
Date: Thu, 30 Apr 2020 14:36:00 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v4 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200430143600.27031639@collabora.com>
In-Reply-To: <1d5aec11-a7b5-01c2-6614-16e57c64511b@linux.intel.com>
References: <20200429104205.18780-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200429104205.18780-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200429162249.55d38ee8@collabora.com>
 <9d77c64c-d0f9-7a13-3391-d05bf458bdb1@linux.intel.com>
 <20200429164832.6800fc70@collabora.com>
 <2e83a2f7-853c-f0e2-f686-daf1e0649eae@linux.intel.com>
 <20200429173107.5c6d2f55@collabora.com>
 <1de9ba29-30f1-6829-27e0-6f141e9bb1e6@linux.intel.com>
 <20200430102114.29b6552f@collabora.com>
 <1df71cf7-4cae-4cd0-864c-0812bb2cc123@linux.intel.com>
 <20200430103658.4b0b979e@collabora.com>
 <1d5aec11-a7b5-01c2-6614-16e57c64511b@linux.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200430_053606_901419_A558D4C2 
X-CRM114-Status: GOOD (  11.99  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
 masonccyang@mxic.com.tw, anders.roxell@linaro.org, vigneshr@ti.com,
 arnd@arndb.de, hauke.mehrtens@intel.com, richard@nod.at,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, tglx@linutronix.de, qi-ming.wu@intel.com,
 andriy.shevchenko@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 30 Apr 2020 17:07:03 +0800
"Ramuthevar, Vadivel MuruganX"
<vadivel.muruganx.ramuthevar@linux.intel.com> wrote:

> >>> The question is, is it the same value we have in nand_pa or it is
> >>> different?
> >>>      
> >> Different address which is 0xE1400000 NAND_BASE_PHY address.  
> > 
> > Then why didn't you tell me they didn't match when I suggested to pass  
> 
> sorry, because you keep asking nand_pa after that only I realized that.
> 
> > nand_pa? So now the question is, what does this address represent?  
> 
>                 EBU-MODULE
>   _________     _______________________
> |         |   |            |NAND CTRL  |
> | FPI BUS |==>| CS0(0x174) | 0xE100    ( 0xE14/0xE1C) NAND_PHY_BASE
> |_________|   |_CS1(0x17C)_|__________ |
> 
> EBU_CONRTROLLER_BASE : 0xE0F0_0000
> HSNAND_BASE: 0xE100_0000
> NAND_CS0: 0xE140_0000
> NAND_CS1: 0xE1C0_0000
> 
> MEM_REGION_BASE_CS0: 0x17400 (internal to ebu controller )
> MEM_REGION_BASE_CS1: 0x17C00
> 

Hm, I wonder if we shouldn't use a 'ranges' property to describe this
address translation. Something like

	ebu@xxx {
		ranges = <0x17400000 0xe1400000 0x1000>,
			 <0x17c00000 0xe1c00000 0x1000>;
		reg = <0x17400000>, <0x17c00000>;
		reg-names = "cs-0", "cs-1";
	}

The translated address (0xE1X00000) will be available in res->start,
and the non-translated one (0x17X00000) can be retrieved with
of_get_address(). All you'd have to do then would be calculate the
mask:

	mask = (translated_address & original_address) >> 22;
	num_comp_bits = fls(mask);
	WARN_ON(mask != GENMASK(num_comp_bits - 1, 0));

Which allows you to properly set the ADDR_SEL() register without
relying on some hardcoded values:

	writel(original_address | EBU_ADDR_SEL_REGEN |
	       EBU_ADDR_COMP_BITS(num_comp_bits),
	       ebu_host->ebu + EBU_ADDR_SEL(csid));

That's quite important if we want to merge the xway NAND driver with
this one.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
