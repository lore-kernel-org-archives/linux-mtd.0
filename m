Return-Path: <SRS0=22uX=KM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04AB3C433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 17 May 2021 07:35:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76DD2611C2
	for <linux-mtd@archiver.kernel.org>; Mon, 17 May 2021 07:35:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76DD2611C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=itgDaoyIwW8VdZ30ATU6lJHXeT34dBgYY4wAZKTtRYI=; b=M6yEZFuw0P2qAiyuSptoF90f4
	XaTTeDyno8wJ2ZBIA7ZrqHNFh8dCH2oMi4eYmFWUnZ+21O6vYxxnVjKNHX6aLSh1hI7H5ppeLR5q6
	D6Hcht9/CTiYdv4x8iKztqAGc9unC2/+OCGnoTzl70YNDCjcE68XmtbFuZ+fHnRF4qMjlR7H9HqTw
	6HopAGWn29Q1GdZ6kSpXgiaUxzirLFXbtx1m3xBjXRxnvoopNEF8JV2QQ6SoQg/9hv1QfeJaRc716
	yULR1P8gu+91Yd7Lv4aLMsA3Z+ZmZiIZU9YcArLRE6H0lOgUkaJpjb1RU9KDcqNcsI3UMi23FbM+E
	22Dx5Xeug==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liXlI-00E3Bj-Us; Mon, 17 May 2021 07:34:01 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liXkc-00E321-N3
 for linux-mtd@desiato.infradead.org; Mon, 17 May 2021 07:33:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=wIJJ5jCdwTb9SsArEhc/jnRTTl69GTr3L7YuAZJu/gs=; b=jwYqhInTTBrLgop9jf4wjDX4TH
 2qHjMbcwQNez9m2MvL6i62uliE7CVTsW/HoPbLnIxqDMcn7k7zQYyKveHW+2rWIZJXLp4UZ3AS4jB
 imVMF7vFFydTevdg+omJxScbh0LbWjx58B0p8NQ+iRkmw0fpZmxKq4fR0jVYI4NThqrqd7BKU8d1X
 Jq9+xced5BnEFxVg6LVz02KgMaRyyGYFPUS+FD0entxksoPuWJkl3OftQYLMN6F+wmceuHeouSrQP
 H6tVlsUOJ9xQyjVnIitcm6bHiLQ2LcIAqWE7e52H41FM9nkzpFNYpMEDxhbGGrZvjPae3m4gJ6fTF
 GEnN/tWg==;
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liXkY-00DY4g-TU
 for linux-mtd@lists.infradead.org; Mon, 17 May 2021 07:33:17 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14H7X80G069032;
 Mon, 17 May 2021 02:33:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1621236788;
 bh=wIJJ5jCdwTb9SsArEhc/jnRTTl69GTr3L7YuAZJu/gs=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=d+7NQsrg58MtVK7semUILHI4Z8ZqD2J+EiOOq615+6YlGaR+xMXjsF0mXZaINokUt
 bvzQd0hppufsZNwlwWpKNuLLzMlLAK7eWoyrzGtaeab4/P7e12Npq9MW7V6u9DNC8j
 QRHRAe5y2H1LSSwqfJDcuIiPh/d9OGnVKuOGkjUk=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14H7X7xM104587
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 17 May 2021 02:33:07 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 17
 May 2021 02:33:07 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 17 May 2021 02:33:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14H7X67V024915;
 Mon, 17 May 2021 02:33:07 -0500
Date: Mon, 17 May 2021 13:03:06 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Zhengxun Li <zhengxunli@mxic.com.tw>
CC: <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>,
 <tudor.ambarus@microchip.com>, <miquel.raynal@bootlin.com>,
 <broonie@kernel.org>, <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v5 1/2] mtd: spi-nor: macronix: add support for Macronix
 octaflash
Message-ID: <20210517073304.sldl5eybdkd6owvl@ti.com>
References: <1621232088-12567-1-git-send-email-zhengxunli@mxic.com.tw>
 <1621232088-12567-2-git-send-email-zhengxunli@mxic.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1621232088-12567-2-git-send-email-zhengxunli@mxic.com.tw>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_003315_898870_35986297 
X-CRM114-Status: GOOD (  13.66  )
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

On 17/05/21 02:14PM, Zhengxun Li wrote:
> The octaflash is an xSPI compliant octal DTR flash. Add support
> for using it in octal DTR mode.
> 
> Try to verify the flash ID to check whether the flash memory in octal
> DTR mode and SPI mode are correct. When reading ID in OCTAL DTR mode,
> ID will appear in a repeated manner. ex: ID[0] = 0xc2, ID[1] = 0xc2,
> ID[2] = 0x94, ID[3] = 0x94... Rearrange the order so that the ID can pass.
> 
> The octaflash series can be divided into the following types:
> 
> MX25 series : Serial NOR Flash.
> MX66 series : Serial NOR Flash with stacked die.(Size larger than 1Gb)
> LM/UM series : Up to 250MHz clock frequency with both DTR/STR operation.
> LW/UW series : Support simultaneous Read-while-Write operation in multiple
> 	       bank architecture. Read-while-write feature which means read
> 	       data one bank while another bank is programing or erasing.
> 
> MX25LM : 3.0V Octal I/O
>  -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7841/MX25LM51245G,%203V,%20512Mb,%20v1.1.pdf
> 
> MX25UM : 1.8V Octal I/O
>  -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7525/MX25UM51245G%20Extreme%20Speed,%201.8V,%20512Mb,%20v1.0.pdf
> 
> MX66LM : 3.0V Octal I/O with stacked die
>  -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7929/MX66LM1G45G,%203V,%201Gb,%20v1.1.pdf
> 
> MX66UM : 1.8V Octal I/O with stacked die
>  -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7721/MX66UM1G45G,%201.8V,%201Gb,%20v1.1.pdf
> 
> MX25LW : 3.0V Octal I/O with Read-while-Write
> MX25UW : 1.8V Octal I/O with Read-while-Write
> MX66LW : 3.0V Octal I/O with Read-while-Write and stack die
> MX66UW : 1.8V Octal I/O with Read-while-Write and stack die
> 
> About LW/UW series, please contact us freely if you have any
> questions. For adding Octal NOR Flash IDs, we have validated
> each Flash on plateform zynq-picozed.
> 
> Signed-off-by: Zhengxun Li <zhengxunli@mxic.com.tw>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
