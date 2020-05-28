Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DBF2C433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 09:55:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F183208A7
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 09:55:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cV8A8RpQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QdLpXxfH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F183208A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h/EQzHXry4i/HVLsCvJ/FQ7S6o8CqQIUynEJbheHrYc=; b=cV8A8RpQrZ5N3U
	vqjdpEod6JnksvDi1RUGLb5NEiWzc3ueMLjBRNofiUZ1ajSq9/xTHomf7oTIPZJ0BaFrfpY0pSr5w
	VPlBLB/f5JQ6Gk+JnBbciiIht3EoooBU5Hk32gmwrSuM5e4jwn/PeoIMFIhJzOk6ieGzmiSOCPkJq
	0M7ODzizqUUnnRgzwfL0ewTiD3A/0FsasnJpLzuqrifwU7ehqyJRw9+EVf85z1Tq5QpUePL2ver2T
	qw5WsZrC9aOTLXUlPVLRs9P2hem0SKPlQw8DL7MD0kfS2W4C+ql529TsYLP1f+M5C9NJInfFuXvEV
	gjhTuQqhFaMhYej95Mhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeFFM-0007bi-T5; Thu, 28 May 2020 09:54:44 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeFFK-0007ZT-SV
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 09:54:44 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04S9sKep073014;
 Thu, 28 May 2020 04:54:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1590659660;
 bh=fFt+EvSvDnHIYU/mdgaQndevTVzx/3/nPmaY5O3YS8Y=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=QdLpXxfHddhehXDQFmZjHc3vxdZOL1M+cG5mEV72ev2HFoDsuqSVDTAOyMuF2DAyt
 OlZQvFwghFf/ZGZRUWTQmaEOyN+js9oDwHSx6oC59XUfkyIvYzwDV3CMxD+tH8U0F/
 w+lyEThhkiBlHPZ5b+bQkaBpT0VKUh9LSEYgmzlw=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04S9sKMb073639;
 Thu, 28 May 2020 04:54:20 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 28
 May 2020 04:54:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 28 May 2020 04:54:19 -0500
Received: from [10.250.234.195] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04S9sFgS019886;
 Thu, 28 May 2020 04:54:15 -0500
Subject: Re: [PATCH v2 6/6] spi: Move cadence-quadspi driver to drivers/spi/
To: kbuild test robot <lkp@intel.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Mark Brown <broonie@kernel.org>
References: <20200526093604.11846-7-vigneshr@ti.com>
 <202005280400.IgqKbGTF%lkp@intel.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <3fd21609-cb9a-cbe9-f40f-a8a8a00491a2@ti.com>
Date: Thu, 28 May 2020 15:24:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <202005280400.IgqKbGTF%lkp@intel.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_025443_000445_88E07EC0 
X-CRM114-Status: GOOD (  12.36  )
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
Cc: marex@denx.de, kbuild-all@lists.01.org,
 Boris Brezillon <bbrezillon@kernel.org>, dinguyen@kernel.org,
 simon.k.r.goldschmidt@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 28/05/20 2:28 am, kbuild test robot wrote:
> Hi Vignesh,
> 
[...]
> 
> In file included from include/linux/err.h:5,
> from include/linux/clk.h:12,
> from drivers/spi/spi-cadence-quadspi.c:9:
> include/linux/scatterlist.h: In function 'sg_set_buf':
> arch/xtensa/include/asm/page.h:193:9: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
> 193 |  ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
> |         ^~
> include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
> 78 | # define unlikely(x) __builtin_expect(!!(x), 0)
> |                                          ^
> include/linux/scatterlist.h:143:2: note: in expansion of macro 'BUG_ON'
> 143 |  BUG_ON(!virt_addr_valid(buf));
> |  ^~~~~~
> arch/xtensa/include/asm/page.h:201:32: note: in expansion of macro 'pfn_valid'
> 201 | #define virt_addr_valid(kaddr) pfn_valid(__pa(kaddr) >> PAGE_SHIFT)
> |                                ^~~~~~~~~
> include/linux/scatterlist.h:143:10: note: in expansion of macro 'virt_addr_valid'
> 143 |  BUG_ON(!virt_addr_valid(buf));
> |          ^~~~~~~~~~~~~~~
> In file included from ./arch/xtensa/include/generated/asm/bug.h:1,
> from include/linux/bug.h:5,
> from include/linux/thread_info.h:12,
> from arch/xtensa/include/asm/current.h:18,
> from include/linux/mutex.h:14,
> from include/linux/notifier.h:14,
> from include/linux/clk.h:14,
> from drivers/spi/spi-cadence-quadspi.c:9:
> include/linux/dma-mapping.h: In function 'dma_map_resource':
> arch/xtensa/include/asm/page.h:193:9: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
> 193 |  ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
> |         ^~
> include/asm-generic/bug.h:139:27: note: in definition of macro 'WARN_ON_ONCE'
> 139 |  int __ret_warn_once = !!(condition);            |                           ^~~~~~~~~
> include/linux/dma-mapping.h:352:19: note: in expansion of macro 'pfn_valid'
> 352 |  if (WARN_ON_ONCE(pfn_valid(PHYS_PFN(phys_addr))))
> |                   ^~~~~~~~~
> In file included from include/linux/shm.h:6,
> from include/linux/sched.h:16,
> from include/linux/ratelimit.h:6,
> from include/linux/dev_printk.h:16,
> from include/linux/device.h:15,
> from include/linux/dma-mapping.h:7,
> from drivers/spi/spi-cadence-quadspi.c:12:
> drivers/spi/spi-cadence-quadspi.c: In function 'cqspi_direct_read_execute':
> arch/xtensa/include/asm/page.h:193:9: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
> 193 |  ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
> |         ^~
> arch/xtensa/include/asm/page.h:201:32: note: in expansion of macro 'pfn_valid'
> 201 | #define virt_addr_valid(kaddr) pfn_valid(__pa(kaddr) >> PAGE_SHIFT)
> |                                ^~~~~~~~~
>>> drivers/spi/spi-cadence-quadspi.c:911:26: note: in expansion of macro 'virt_addr_valid'
> 911 |  if (!cqspi->rx_chan || !virt_addr_valid(buf)) {
> |                          ^~~~~~~~~~~~~~~


Thanks for the report! But it seems with ARCH=xtensa and config that was
attached, I see above warning for every file in the kernel that uses
virt_addr_valid(), So, the fix for this warning is really in xtensa arch
code and therefore should not block this series from being merged.


Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
