Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84C8C77B75
	for <linux-mtd@archiver.kernel.org>; Mon,  8 May 2023 05:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=az5VRE8fSkQrbyR8+8hFFM35OLjbVf8DzofdbQ2ZOrQ=; b=AQ7NyuqMDFt+mW
	xYJMjW8vws+zDN5ipRBGPoY1r3jDfnrNKR3GqHLsLBseZyRKQarGBYV98DqTwcG3b3BYwZj2fk+DI
	tx6T4/dftPeFi90SS5EWd54/0ry66VGSfOaROfOw+ZV+v8pZ23RvO+9hdUxixAq4zYE7BCuiS+6zW
	m08p7IdOvGETyVXBn3mkmQjhswtKljvZPSXxQiQyMsJd0aGx4ZLAGKRnX73S5ZDnmuKbTYIsPbc6d
	mz6MoTCovrfg/MbpmEo3bD+1I9SJsqeRfiyVcjlWnYw0OFhindlbWXjnhUwWiSWY+9nhZs22vmqeI
	zuf8udgsLTNPY5RdP9Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvtRU-00HJ2K-1R;
	Mon, 08 May 2023 05:29:48 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvtRR-00HJ1L-0U;
	Mon, 08 May 2023 05:29:46 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3485TPVo043363;
	Mon, 8 May 2023 00:29:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683523765;
	bh=pQ0TgZRCQgJhRr1DJoN+C7+TJSytbKAikGHfK/voFrI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=CdkdToo6SPQAuJso8YGUtKdgbYpGqYWBAcKyM/J+EQRl9j/qXu5K2MkqLKplMbWUj
	 8awUh9rMu/DnE7SZTOWDSfuIpMB9oHZG9luUeIpbrJbxG/88S2CE7dGcEm18VSbf3c
	 9xaP3ArSA1Gt1YFNCg+Dss37/Xf9gJeB9wSEANmI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3485TPYW059921
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 May 2023 00:29:25 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 May 2023 00:29:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 May 2023 00:29:25 -0500
Received: from [10.24.69.26] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3485TMf4081139;
	Mon, 8 May 2023 00:29:22 -0500
Message-ID: <11c63702-cd25-67c9-d0bc-21ec47e14c98@ti.com>
Date: Mon, 8 May 2023 10:59:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: RE: [PATCH v2 4/4] spi: cadence-quadspi: use STIG mode for small
 reads
To: Yoshitaka Ikeda <ikeda@nskint.co.jp>
CC: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Vaishnav Achath <vaishnav.a@ti.com>,
        "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "Takahiro.Kuwano@infineon.com"
	<Takahiro.Kuwano@infineon.com>,
        Pratyush Yadav <ptyadav@amazon.de>, Mark
 Brown <broonie@kernel.org>
References: <20230125081023.1573712-1-d-gole@ti.com>
 <20230125081023.1573712-5-d-gole@ti.com>
 <OSZPR01MB70048CE259A3D63C4179199A8B659@OSZPR01MB7004.jpnprd01.prod.outlook.com>
 <044a723e-b81e-f6f2-8bf7-3680a10abc86@ti.com>
 <OSZPR01MB7004D229048A950C93B40CC88B6A9@OSZPR01MB7004.jpnprd01.prod.outlook.com>
 <b1d30948-ba3d-a4cc-e1ed-851a9dedba7c@ti.com>
 <OSZPR01MB7004907B2FB95F45E9B83FEC8B719@OSZPR01MB7004.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Dhruva Gole <d-gole@ti.com>
In-Reply-To: <OSZPR01MB7004907B2FB95F45E9B83FEC8B719@OSZPR01MB7004.jpnprd01.prod.outlook.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_222945_291558_A1635E66 
X-CRM114-Status: GOOD (  24.24  )
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



On 08/05/23 06:06, Yoshitaka Ikeda wrote:
> Hi Dhruva,
> 
> Sorry for the late reply as I was on a long vacation.
> 
>> Thanks for sharing, I went through and couldn't really find any major changes
>> at the controller level.
>> So I am wondering if some specific sequence of flash operations on your
>> device is exposing some issues in the driver's STIG reads.
> 
> Thank you for looking into this.
> 
>> Please can you share some logs with the following patch:
>> I am trying to see a pattern that may be causing issues.
>> I am unable to reproduce this on my end at the moment.
> 
> The logs obtained with the patch applied are as follows:

Thanks for sharing the logs. It has made me concerned about something,

> 
> - Error at startup
>    - Kernel log
> [    0.980598] **********spi_mem_op dump**************
> [    0.980613] addr: nbytes:0x0 , buswidth 0x0, dtr 0x0, val 0x0
> [    0.984223] cmd: nbytes:0x1 , buswidth 0x1, dtr 0x0, opcode 0x9F
> [    0.988656] data: nbytes:0x6 , buswidth 0x1, dtr 0x0, data dir 0x1
> [    0.993362] ***************************************
> [    0.998329] spi-nor spi0.0: found mt25ql512a, expected n25q512a
> [    1.006574] **********spi_mem_op dump**************
> [    1.006583] addr: nbytes:0x3 , buswidth 0x1, dtr 0x0, val 0x0
> [    1.010150] cmd: nbytes:0x1 , buswidth 0x1, dtr 0x0, opcode 0x5A
> [    1.014596] data: nbytes:0x10 , buswidth 0x1, dtr 0x0, data dir 0x1
> [    1.019285] ***************************************
> [    1.524271] cadence-qspi ff705000.flash: Flash command execution timed out.

This print message is from cqspi_exec_flash_cmd. This function should
only be called from cqspi_command_read/write .

However, from spi_mem_op dump that you have provided above,
where addr.nbytes is 3 and data.nbytes is 0x10 (which is > 8)
it should never have entered the cqspi_command_read function.

> [    1.533483] **********spi_mem_op dump**************
> [    1.533489] addr: nbytes:0x3 , buswidth 0x1, dtr 0x0, val 0x10
> [    1.537055] cmd: nbytes:0x1 , buswidth 0x1, dtr 0x0, opcode 0x5A
> [    1.541579] data: nbytes:0x8 , buswidth 0x1, dtr 0x0, data dir 0x1
> [    1.546266] ***************************************
> [    1.551123] spi-nor spi0.0: operation failed with -110
> [    1.558531] spi-nor spi0.0: mt25ql512a (65536 Kbytes)
> 

Anything after the Flash command execution timed out step seems
irrelevant because at that point the controller is in some weird state 
that it never again comes out of.


Please can you share the exact output of uname -a where you observe this
error?

I am now wondering why atall would the following conditions be satisfied
in your case:

if (!op->addr.nbytes || op->data.nbytes <= CQSPI_STIG_DATA_LEN_MAX)

either addr.nbytes needs to be 0, which it isn't.
or data has to be <= 8 (which again doesn't seem to be the case here)

So it should never enter the above "if" chunk.

My logs for reference:
https://gist.github.com/DhruvaG2000/7185a84de5757e4988f93478f6b75289


Are you carrying any sort of local patches? Can you make sure that the
CQSPI_STIG_DATA_LEN_MAX is 8 in your case too?
Any other delta from linux-next that I am using in the logs I gave
above?

-- 
Thanks and Regards,
Dhruva Gole

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
