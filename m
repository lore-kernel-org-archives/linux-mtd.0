Return-Path: <SRS0=79EA=KN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 563A7C433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 18 May 2021 11:29:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA39E611BD
	for <linux-mtd@archiver.kernel.org>; Tue, 18 May 2021 11:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA39E611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nf5ajKGk5WM8zxQqhDRrX7ovTp9oKcc+rxEEnhHTolk=; b=KWMggHojtVz9f1yr6l+hXN9/K
	LdhtFgwOI0GRUenjn9Pmpg8STJrzIm0qWw7c35T0ASJ0J5RPPeIbdEfeONnH3+8fkIasfXyCzXUV2
	XCFCcOcKX/gufQL5tXSkRIvcRSPQmJ04RM5JiAuXozSeZ0pF8hTyrDnJmwi3QXJMbUtEJNFlgpRMX
	b2CQDotEufxTvx+KJiOL7eZ+hdkYFtTBptK3GOg4kw2IXO4f1h08Zsd140d00s4mAGPLz4pRKLqKj
	CgWAKxkt2pQ+dmCSQj76CZIsZnbPDvdkOsYXB+ywXzNZLTCGdwAkdcOByBh2EfjAMHv43GhHRnO+t
	HffR9RT9Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lixtv-000YPj-Pm; Tue, 18 May 2021 11:28:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lixts-000YNq-Q1; Tue, 18 May 2021 11:28:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=jIHeIpLexvh71jo95l2Q1zRybn6F6JJrMnWG91BQdYI=; b=SV6RIzX4IbcRJL7LzVodAwXDcn
 Zn/MCT89GjoZTuvUnscHemcESpvnGUF60Brje6t56wbfsIJ8WrIOITx/nmvieOKLAhbG1FbmYynnv
 qrfJ/wzxVcKW9Ys/FnzDei4YPJ15ExpFv6ePbvlt3UlKdRoneODwsXhA2oddU71uCcYw8xDwMvmYe
 LT1oK3vKr2aAvaJXgwd/v15+yc+EJXKFiuz7fEp/e96MSeAQ6n1hSEptQvxtLQRxlswTwt5/wQJ/p
 EnuIzlANYhxdRrUL5/Q0a+XeZrSAfwqIA7KNwePKUwe7fPKZ6vMRvTZF9po/lh3WVFV6K0MQUwQD1
 koBwQfPg==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lixtp-00EbLS-0M; Tue, 18 May 2021 11:28:34 +0000
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IBMvhb005094; Tue, 18 May 2021 13:28:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=jIHeIpLexvh71jo95l2Q1zRybn6F6JJrMnWG91BQdYI=;
 b=W/PyzKsyKG1YtdseKpWomCRLeDWCe5BgGmTwczcvDKNlNKSoesN+prfkb16Qqq3cjsFm
 6vC2W47RWwvxz4s85LCw3hnyiYzKjnnurfLPxtYI/Qrt4xoLlxnweIUvjh9Fp8XNSZds
 LdpEP12+jF5gLgNiPjuTXdn7Zb8q0DCMh3Wo55hGdootAcGzCY96gt5pV3tdhDAY9beL
 6cF1Imso3LE8RVc88R35MHnbxuurovfwK8ggPS1o0UzcjqB8TLEeh3LuQWiCNI7arBac
 MD4T7ZpEQljQolMZnlhrj4bQIO/RTPv+4zWqSD/o8OMlTGNvcAqg9LDUoAF08HRoOjPz 2A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38maunrpw1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 13:28:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E110D10002A;
 Tue, 18 May 2021 13:28:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CC51C221F77;
 Tue, 18 May 2021 13:28:25 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 18 May
 2021 13:28:24 +0200
Subject: Re: [PATCH v3 0/3] MTD: spinand: Add spi_mem_poll_status() support
To: Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <christophe.kerello@foss.st.com>
References: <20210518093951.23136-1-patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <b4fb34ad-b70f-b8b9-3fcb-09dd812acfa9@foss.st.com>
Date: Tue, 18 May 2021 13:28:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210518093951.23136-1-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-18_04:2021-05-18,
 2021-05-18 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_042833_555864_AFCD1A17 
X-CRM114-Status: GOOD (  22.22  )
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

Just saw a missing update, i am sending a v4.
Sorry
Patrice

On 5/18/21 11:39 AM, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> This series adds support for the spi_mem_poll_status() spinand
> interface.
> Some QSPI controllers allows to poll automatically memory 
> status during operations (erase, read or write). This allows to 
> offload the CPU for this task.
> STM32 QSPI is supporting this feature, driver update are also
> part of this series.
> 
> Chnages in v3:
>   - Add spi_mem_read_status() which allows to read 8 or 16 bits status.
>   - Add initial_delay_us and polling_delay_us parameters to spi_mem_poll_status().
>     and also to poll_status() callback.
>   - Move spi_mem_supports_op() in SW-based polling case.
>   - Add delay before invoquing read_poll_timeout().
>   - Remove the reinit/wait_for_completion() added in v2.
>   - Add initial_delay_us and polling_delay_us parameters to spinand_wait().
>   - Add SPINAND_READ/WRITE/ERASE/RESET_INITIAL_DELAY_US and
>     SPINAND_READ/WRITE/ERASE/RESET_POLL_DELAY_US defines.
>   - Remove spi_mem_finalize_op() API added in v2.
> 
> Changes in v2:
>   - Indicates the spi_mem_poll_status() timeout unit
>   - Use 2-byte wide status register
>   - Add spi_mem_supports_op() call in spi_mem_poll_status()
>   - Add completion management in spi_mem_poll_status()
>   - Add offload/non-offload case management in spi_mem_poll_status()
>   - Optimize the non-offload case by using read_poll_timeout()
>   - mask and match stm32_qspi_poll_status()'s parameters are 2-byte wide
>   - Make usage of new spi_mem_finalize_op() API in
>     stm32_qspi_wait_poll_status()
> 
> Patrice Chotard (3):
>   spi: spi-mem: add automatic poll status functions
>   mtd: spinand: use the spi-mem poll status APIs
>   spi: stm32-qspi: add automatic poll status feature
> 
>  drivers/mtd/nand/spi/core.c  | 45 +++++++++++++------
>  drivers/spi/spi-mem.c        | 85 ++++++++++++++++++++++++++++++++++++
>  drivers/spi/spi-stm32-qspi.c | 83 +++++++++++++++++++++++++++++++----
>  include/linux/mtd/spinand.h  | 11 ++++-
>  include/linux/spi/spi-mem.h  | 14 ++++++
>  5 files changed, 216 insertions(+), 22 deletions(-)
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
