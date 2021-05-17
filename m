Return-Path: <SRS0=22uX=KM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE003C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 17 May 2021 07:31:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2951E611C2
	for <linux-mtd@archiver.kernel.org>; Mon, 17 May 2021 07:31:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2951E611C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=edV5zfhgwIXqVHkSO3VZDpw71W9zn+CLUL5c/hyF9J0=; b=Z9cDletSx7kJXi9yL+YPzL2Kk
	MYdBfrD/mqYhHZ1BOiA92tJ74RYyDCR1yRpi8oT/7UPri6vhPtqwlB84XngKg4h+u9s96Dtm5oAOL
	p1pJTxygYQO8oN2HybSxOg9Cl4AUk2RlBAIaj0keP9eg7Xo6OnAUFAu6OBvx96NReZ453PcmuYj3L
	HglqTcB2WErBcI71Crrowh4jwTA/uhFM4GdtwMkdCwcARMSPE4sHdwN0Poe4LQRor7DCIqWxPOgOW
	O8EyqkVWNmDWqTZvL+IucVEC2rlE5tDsPS2P8KTlCfyKaj6pp1CjyGZjRRF0e0/6xssd000EP3N+e
	A+aFk+7QQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liXhU-00E2XR-1Q; Mon, 17 May 2021 07:30:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liXh9-00E2Uh-PR; Mon, 17 May 2021 07:29:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=IBklEhJOoqnRyM5eXyLESodNBjnwwQeXasaYr+V1Hs8=; b=ItNxN4pCIM9K+IxFVL4q7s3TTa
 2s85bNNVesUy6flUTPRn9UOk9WHyjEBfccx5/IvOp8XkXV3ABlPt7OnUmimACF16djLVo5cdmk3ru
 R2L/H2QcIeFkU0pQ1mdWwRzTWkf0a8d9SIgEVZoN5ZPFb7QQtnzquL3T41AcLD6vqNzYqnDPQs5Fd
 HNsyhL9zUfjCQxL/5eeVEYu/N7oW7dkoD5LuPTZlU3hfZ3IEfy2XQhlvFG7ldh2JMJ+aJX5hH5uUj
 HC/TcqBZsZ08fl6LfQkEtiS9snwuMIAQV7psu4YmoYaFnSDuMhXvb6mHwxEUOgifTXmwZRI9ADvpc
 g5Qw9+pw==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liXh6-00DXuA-Dg; Mon, 17 May 2021 07:29:42 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14H7C2Y0012348; Mon, 17 May 2021 09:29:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=IBklEhJOoqnRyM5eXyLESodNBjnwwQeXasaYr+V1Hs8=;
 b=AXloOSyjoJBa8hQbEwYVFThW80uykJN6iVPny5RTPDvvzEuUAG2oPtk4xmHFuGF7AoJ1
 aIkKBc+W8RoTown7zPNJmSxbpGK8xeNanQ92dHzxrernkIElpge/31I8CDumzyI3a/0X
 BgvlrEqU9ZJYqvN+7EFaW4yh0DTtvF7H6JWbLPYL6ek+RhL0xfmx/66qFhs/yrAtcUd4
 XnRviqW2iaRTVxSnEz59/QU/vWOIFsV9BJw1ICHfS25lFqvMUuGDmlVxQs83ttA/N6uX
 44PybUlC573C6fw9oCoe5ZMUWbe8GjXDfzK9fxUjzfezG7CIM/4a44x9PTx2ePPGpF0c Lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38k5dq34pu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 May 2021 09:29:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E4D53100034;
 Mon, 17 May 2021 09:29:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B4B34214D36;
 Mon, 17 May 2021 09:29:26 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 17 May
 2021 09:29:25 +0200
Subject: Re: [PATCH v2 1/3] spi: spi-mem: add automatic poll status functions
To: Boris Brezillon <boris.brezillon@collabora.com>
CC: Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <christophe.kerello@foss.st.com>
References: <20210507131756.17028-1-patrice.chotard@foss.st.com>
 <20210507131756.17028-2-patrice.chotard@foss.st.com>
 <20210508095506.4d0d628a@collabora.com>
 <542000b4-1a65-5090-72f9-441c75ee1098@foss.st.com>
 <20210510112249.5613978e@collabora.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <48d8774c-9868-27e5-b8b0-fdbf99c84ba2@foss.st.com>
Date: Mon, 17 May 2021 09:29:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210510112249.5613978e@collabora.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-17_01:2021-05-12,
 2021-05-17 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_002940_967924_6DA6CE29 
X-CRM114-Status: GOOD (  20.88  )
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

Hi Boris

On 5/10/21 11:22 AM, Boris Brezillon wrote:
> On Mon, 10 May 2021 10:46:48 +0200
> Patrice CHOTARD <patrice.chotard@foss.st.com> wrote:
> 
>>>   
>>>> +
>>>> +	if (ctlr->mem_ops && ctlr->mem_ops->poll_status) {
>>>> +		ret = spi_mem_access_start(mem);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +
>>>> +		reinit_completion(&ctlr->xfer_completion);
>>>> +
>>>> +		ret = ctlr->mem_ops->poll_status(mem, op, mask, match,
>>>> +						 timeout_ms);
>>>> +
>>>> +		ms = wait_for_completion_timeout(&ctlr->xfer_completion,
>>>> +						 msecs_to_jiffies(timeout_ms));  
>>>
>>> Why do you need to wait here? I'd expect the poll_status to take care
>>> of this wait.  
>>
>> It was a request from Mark Brown [1]. The idea is to implement
>> similar mechanism already used in SPI framework.
> 
> Well, you have to choose, either you pass a timeout to ->poll_status()
> and let the driver wait for the status change (and return -ETIMEDOUT if
> it didn't happen in time), or you do it here and the driver only has to
> signal the core completion object. I think it's preferable to let the
> driver handle the timeout though, because you don't know how the
> status check will be implemented, and it's not like the
> reinit_completion()+wait_for_completion_timeout() done here would
> greatly simplify the drivers wait logic anyway.
> 

Ok i will remove the reinit/wait_completion() as you suggested.
Thanks
Patrice

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
