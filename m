Return-Path: <SRS0=/+zL=6W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8321C35280
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 02:31:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD207207DD
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 02:31:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mOS2aeTy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD207207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wU9vaJJeXTTJatUywRxEvEWuaq7x91VwRp2XSSo6vjw=; b=mOS2aeTy4VSkG6
	wWKi34bGI80wjos2pHwctvVVZwQlngBVAYUPEUO9sv7NsS2ywa9K8hTGOQGz4k+rJEJSWIeZfItlY
	NyTB4RYygAyH+9YGlMJbUzQ27yUCiKOrdKItiA0BYzJBB20kmJugK+Oi58fwmJkKhGu7FITbVy0aP
	8/9PMjAPPmGSZiiFosTbyHLRWmlRdeftDnJDljgeVm4emChdOrWOVUUWQEFfiV+H82RdlfkLxj8So
	wK0wvy7Yin/heO2YZYe7v4HFqa05vvrI9CvP9w4WOLrQK0d7c9RAv8gWbo41ezTM+0wouEsL8cRsg
	iIjDMy7Z3sypLWOJkZKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWsnT-00041c-Rt; Fri, 08 May 2020 02:31:31 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWsnO-0003wD-Dc
 for linux-mtd@lists.infradead.org; Fri, 08 May 2020 02:31:28 +0000
IronPort-SDR: VLLc2nVA2tgGCI4IN3ooQZuGqLl1Uqfjx4S2D6exaIG7av+DE8GN/rbZiGixjCGdvxWUygG4N8
 CGm7fi6MlrhA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 19:31:25 -0700
IronPort-SDR: CjOhS/m/S5QJz2g+WvbIMHXFxFQoeuzgIpCgt6bhRN43uycCy6cj+bYZcbgbqLgcXnSzSXFqZG
 u343lCOsI7Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; d="scan'208";a="296724654"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 07 May 2020 19:31:24 -0700
Received: from [10.213.154.115] (vramuthx-MOBL1.gar.corp.intel.com
 [10.213.154.115])
 by linux.intel.com (Postfix) with ESMTP id 642A1580378;
 Thu,  7 May 2020 19:31:20 -0700 (PDT)
Subject: Re: [PATCH v5 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20200507001537.4034-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200507001537.4034-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200507072831.1bf7f784@collabora.com>
 <440c0002-e572-7b8b-ba08-773932370eb0@linux.intel.com>
 <20200507082730.6425cd96@collabora.com>
 <69a06362-1f9d-bf65-4a9b-98fc6b63a391@linux.intel.com>
 <20200507084831.1483b19a@collabora.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <547af0d0-a304-8fd8-12a3-263a900da6af@linux.intel.com>
Date: Fri, 8 May 2020 10:31:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507084831.1483b19a@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_193126_480181_16540C3D 
X-CRM114-Status: GOOD (  18.13  )
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
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, qi-ming.wu@intel.com,
 anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
 hauke.mehrtens@intel.com, richard@nod.at, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, tglx@linutronix.de,
 masonccyang@mxic.com.tw, andriy.shevchenko@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

   Thank you very much for the review comments and your time...
On 7/5/2020 2:48 pm, Boris Brezillon wrote:
 > On Thu, 7 May 2020 14:38:52 +0800
 > "Ramuthevar, Vadivel MuruganX"
 > <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
 >
 >> Hi Boris,
 >>
 >>    Thank you very much for the review comments and your time...
 >>
 >> On 7/5/2020 2:27 pm, Boris Brezillon wrote:
 >>> On Thu, 7 May 2020 14:13:42 +0800
 >>> "Ramuthevar, Vadivel MuruganX"
 >>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
 >>>
 >>>> Hi Boris,
 >>>>
 >>>>      Thank you very much for the review comments and your time...
 >>>>
 >>>> On 7/5/2020 1:28 pm, Boris Brezillon wrote:
 >>>>> On Thu,  7 May 2020 08:15:37 +0800
 >>>>> "Ramuthevar,Vadivel MuruganX"
 >>>>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
 >>>>>
 >>>>>> +	reg = readl(ebu_host->ebu + EBU_ADDR_SEL(ebu_host->cs_num));
 >>>>>> +	writel(reg | EBU_ADDR_MASK(5) | EBU_ADDR_SEL_REGEN,
 >>>>>> +	       ebu_host->ebu + EBU_ADDR_SEL(ebu_host->cs_num));
 >>>>> Seriously, did you really think I would not notice what you're doing
 >>>>> here?
 >>>> Yes , I know that you have very good understanding about this.
 >>>>    You're reading the previous value which either contains a default
 >>>>> mapping or has the mapping set by the bootloader, and write it 
back to
 >>>>> the register along with a new mask and the REGEN bit set (which
 >>>>> BTW is wrong since you don't mask out other fields before updating
 >>>>> them).
 >>>> There is no other field get overwritten
 >>>>    This confirms that this Core -> FPI address translation exists
 >>>>> and has to be set properly, so please stop lying about that.
 >>>> Sorry, there is no SW translation, as I have mentioned that it's
 >>>> optional only, for safer side , reading and writing the default 
values.
 >>> Then write EBU_ADDR_SEL_REGEN and we'll if see that works. I suspect it
 >>> won't.
 >> You mean, without reading just writing EBU_ADDR_SEL_REGEN bit alone in
 >> EBU_ADDR_SELx , as you said it won't work because it overwrites 0x174
 >> with 0x0 values so BASE is lost.
 > Which confirms that this mapping has to be defined.
Sure, Noted.
 >> either we can leave it or read & write with ORed | EBU_ADDR_SEL_REGEN
 > None of this is acceptable IMO. You have to build the value based on the
 > address translation described in the DT. Why are you so reluctant to
 > this approach?
Agreed!, will derive the values(0x174/0x17C) to be written into these 
registers based on the chip select (CS0/CS1)
Address_sel0_register: 0xE0F0_0020
Address_sel1_register: 0xE0F0_0024
Bits : 31...12|11...8| 7..4 |3..2|  1   |  0
flags:  BASE  |------| MASK | -- | MRME | REGEN

BASE : 0x17400 /0x17C00 to be written into 31:12 based on the chip selection
MASK: 5: bits 26:22 to included address comparison
MRME: Memory Region Memory Enable
REGEN: Memory Region Access Enable

As you have suggested to get the above base values from DT and update in 
driver, will do that.

Thanks!
Regards
Vadivel
 >> Please correct me if anything is wrong, Thanks!
 >>>
 >>>> The memory region to enabled that's my concern so written the same
 >>>> register values.
 >>> I don't buy that, sorry.
 >>>
 >>>> This will not be impact other fields, so please see below for 
reference
 >>>>
 >>>> The EBU Address Select Registers EBU_ADDR_SEL_0 to EBU_ADDSEL3 
establish
 >>>> and control memory regions for external accesses.
 >>>>
 >>>> Reset Value: 17400001H
 >>> See, as suspected the reset value is exactly what you expect.
 >> Yes , that's the reason said being optional.
 > Then it's not optional. It just works because you use the default
 > va

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
