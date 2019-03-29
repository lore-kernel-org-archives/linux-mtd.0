Return-Path: <SRS0=zMDb=SA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9748C10F05
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 11:00:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2A46217F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 11:00:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WgReAJRy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="b+WgoKnT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2A46217F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AmCKtWGHwj7a49zzu3YiDR+ebHwFU3ov/K3PmzkF0qA=; b=WgReAJRyXakAeF
	EVPOCqeatoBY09ZfzS7scxcM28UcLn0Y6tiwpyIXYbWHCPYUaUyc3kE7ILq4bBcJQ+viXt/9J/+rZ
	K43FTMHlGsn2tbqhyKdpDiquo03fKDmjC//UgbX2P7wgmEjolvCJtkbpiYZeMHKHtCfXrMMyLh/YN
	qK5q1OpZKSG6HU+FnNrv5AFSXr6M5JMZtc4Y5v/k0SGmaEzVrCDtqk/NeDYTA9Az5nyYFSskUOw/h
	lLr4o091WIygKQOvMclg89svU35qgFk3vPSkrOp+ylqEF9t95duzmD3WgxN/5rU7x94Rz3AN+MC0M
	dG+XmIHr9H4z3T1Y+AJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9pFh-0003EX-Eh; Fri, 29 Mar 2019 11:00:49 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9pFd-0003Do-MI
 for linux-mtd@lists.infradead.org; Fri, 29 Mar 2019 11:00:47 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2TB0amX029831;
 Fri, 29 Mar 2019 06:00:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1553857236;
 bh=3caNsEAYEqVE2i4jhAHj+wbfqzGZ3ZOweWv6j32fAWU=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=b+WgoKnTe3+OkAPgZRmPTihI/DzSC1u9UVoLHTF/yOIWO198xZWpeRAy/yqFd7YLW
 pU4KPiTSc81xY4vwClPSvPhUrlzb5QwNs1wme5nARlcOtlzJa7x/lXUAHCX6wbHKQ3
 /XR2JEdrt4nV6GgrZMt0JDNjDWrtJQvZRniHJnt8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2TB0aa1122100
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 29 Mar 2019 06:00:36 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 29
 Mar 2019 06:00:35 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 29 Mar 2019 06:00:35 -0500
Received: from [172.24.190.89] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x2TB0Viw075423;
 Fri, 29 Mar 2019 06:00:31 -0500
Subject: Re: [LINUX PATCH 2/3] spi: spi-mem: call
 spi_mem_default_supports_op() first
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <1553771784-3364-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20190328205522.272e1da6@collabora.com>
 <d21f7363-eeea-830e-b9b8-ef5bb9e1261b@ti.com>
 <20190329095307.02d970fd@collabora.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <850e1c59-8d00-31e5-e25a-72f36a52b86d@ti.com>
Date: Fri, 29 Mar 2019 16:31:29 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190329095307.02d970fd@collabora.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_040045_827577_BCF7EDF4 
X-CRM114-Status: GOOD (  19.76  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "nagasuresh12@gmail.com" <nagasuresh12@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 29/03/19 2:23 PM, Boris Brezillon wrote:
> On Fri, 29 Mar 2019 13:50:26 +0530
> Vignesh Raghavendra <vigneshr@ti.com> wrote:
> 
>> Hi Boris,
>>
>> On 29/03/19 1:25 AM, Boris Brezillon wrote:
>>> On Thu, 28 Mar 2019 16:46:24 +0530
>>> Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com> wrote:
>>>   
>>>> Call spi_mem_default_supports_op() first, before calling controller
>>>> specific ctlr->supports_op().
>>>> With this, controller drivers can drop checking the buswidths again.  
>>>
>>> No, this was done on purpose, in case the controller does not want the
>>> default check to be applied (say it does not need bus-width props to
>>> be defined and has another way to check if a device can be accessed in
>>> dual, quad or octal mode).  
>>
>> Sorry, I don't understand here.
>> Based on capabilities declared in spi_device->mode, m25p80 driver will
>> claim appropriate  SNOR_HWCAPS_*.  SPI NOR layer chooses opcodes based
>> on that for which m25p80 layer populates buswidths.
> 
> Well, that test in m25p80 should go away and be replaced by a proper
> spi_mem_supports_op() iteration on all modes reported as supported by
> the *chip* (I think that's what I did in my series merging m25p80 code
> into the spi-nor core). But that's not really related to the problem
> we're discussing here.
> 

I see that now.

>>
>> So, I don't really expect any mismatch in spi_mem_default_supports_op()
>> in the case you mentioned. Or did I miss something? Maybe something SPI
>> NAND specific?
> 
> Nothing NAND specific, just something controller specific and how we
> want to deal with buswidth detection. Most memory devices expose their
> caps in some way (be it ID-based detection or using some kind of
> caps/parameters table), so they know what they're capable of. SPI
> controllers know what they're capable of, of course. The only part that
> remains unknown for buswidth negotiation is how things are wired on the
> board. I keep thinking that defining buswidth in the DT (using
> spi-{tx,rx}-bus-width) should only be done if there are board-related
> limiting factors (some IO pins not routed).
> If you look at the code, SPI_{TX,RX}_{DUAL,QUAD,OCTAL} flags are only
> set if the spi-{tx,rx}-bus-width props are defined.
> 
> The idea behind making spi_mem_default_supports_op() optional is to let
> new drivers implement a new scheme where missing
> spi-{tx,rx}-bus-width does not necessarily mean "use regular SPI mode".
> 

Ok, thanks for explanation.


-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
