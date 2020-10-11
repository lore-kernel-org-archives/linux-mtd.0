Return-Path: <SRS0=teGx=DS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7512BC433DF
	for <linux-mtd@archiver.kernel.org>; Sun, 11 Oct 2020 22:00:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B53E7206E9
	for <linux-mtd@archiver.kernel.org>; Sun, 11 Oct 2020 22:00:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KAX0zyY0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eGZTXqEJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B53E7206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ff8DOUaeSg0ypnM1WNdPnYGKLRUOFknAIl09wH3bW7s=; b=KAX0zyY0GLPoHUIGmZkzlwqxU
	OGRX1mIrCbA92uoRJ1AeUo1cGnvCEIqCkPDqGtUHZ7oXRQ5PNgozkEvvZfUQsIWeFnun2/8C1j/8n
	1H8P2ese3uLZkVvnNQhozC/d96rVDneI5Ym5NhsuqEJV7BW17zzNJAUmfKRK76J74PVJlW8L4Xp/P
	XPNv+E1RuJRA/oBuwvA/WUpKaRLX4FpRjdeU9xFPP/0/6w+ZlJlrrT5QETkBCPY75onhLu/tVyHuJ
	eIAmNiATyiUblSbUBWI1TXcwpYBPFjauR+fw/r4a/eH4q/I1ZCQCkK0d3DG/W0W+3N25fQy79msGB
	QtJlfkA2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRjN3-0004TF-Cl; Sun, 11 Oct 2020 21:59:13 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRjN1-0004Sl-BD
 for linux-mtd@lists.infradead.org; Sun, 11 Oct 2020 21:59:12 +0000
Received: by mail-pl1-x643.google.com with SMTP id 1so1606276ple.2
 for <linux-mtd@lists.infradead.org>; Sun, 11 Oct 2020 14:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9e6PE672g+KN/RueGHdjxF/dIhOA0t5UklRi8kBXIYo=;
 b=eGZTXqEJPHVQ6ExQM7Q4fX+YX9UywNaaTdrhxNyhFq/x/ONPOaRsJX9Ja5k1UcZXD9
 ZB+iBqfiyu8OAzY3LJavM7fqkMdhO+IPw8QuQZV5B54j3NTkKulvSgaZ1aXLL3m1zzOU
 tsPp7+UyR3dcp2WugGmzBiqrrLUWZCdAbgSHC4rTI9Rva4wIwFnhFT6v6T8s6TxLBdxf
 T1f2euYnQCi4WdYmGHwcwOQ4n2p4q0mfQ3vfD9CsPY2g7VrtHxM6LqrwbHXzd7dPtxHu
 jtdRAt8Vt/MzxNTRJDJh/Mt8GGnOnUFqHCUcqEyafKCN103ST1QSj2yc5OM9Y+3DOdsE
 66eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9e6PE672g+KN/RueGHdjxF/dIhOA0t5UklRi8kBXIYo=;
 b=BxBweSiMLNXvUf47O4zKCP/NybuA4ioYKz2SVtykjcEfPWIdML+vd7/e143s7lA64A
 iEqxb8t5Rbw0g0MhSxu5GDlDb8vJHJxSdFh5RSxSkDQAAjNScAvfYVyePYnAhektqZZ8
 sjEbfyvI+efLiTojdeXq1LFvqizAytGtn5vebJd0SwyeURY7Xkn2PXXURiZ7lOdrCO2W
 6h9Aoh2XfVXKJ+KenIvrHpaxMOQhf9HBvX682Odmr4Bjqpma8Yp8PcyQ/nrrHOVD/DdA
 hgNvgQTLXfGkZXUl2laGR3lGWfUrSLXMV1aw1+WYfF4bzLXSiheJEIH+/1SLw60GPCAi
 QjdQ==
X-Gm-Message-State: AOAM533MtWDEODVVaBnxvuC9wxiEKpBWhjfjVuFiGuc24KMsmII9btpM
 +n0h0IHOhQbb0p6a1jSrTKI=
X-Google-Smtp-Source: ABdhPJw9w8wG0tU/Hja1vCXKXZXyjMFMCjOovpXFIPxKynORAT5MAY46GzyM3OLhJvvH95vQJ+Z4jg==
X-Received: by 2002:a17:902:7d97:b029:d2:8046:f593 with SMTP id
 a23-20020a1709027d97b02900d28046f593mr20862497plm.43.1602453547585; 
 Sun, 11 Oct 2020 14:59:07 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
 by smtp.gmail.com with ESMTPSA id
 e13sm17090832pfi.70.2020.10.11.14.59.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Oct 2020 14:59:06 -0700 (PDT)
To: Jim Quinlan <james.quinlan@broadcom.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, abhimanyu.saini@nxp.com,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Fabio Estevam <festevam@gmail.com>
References: <CA+G9fYvuq58q+GsWnzni0sKSHbubuQz-UaK3TASX26V_a7yBVw@mail.gmail.com>
 <20200924090349.GF27174@8bytes.org>
 <ecf71b34-a104-d42a-bfcd-9570e73520a7@arm.com>
 <20200924092546.GJ27174@8bytes.org>
 <e2186418-d4d6-e1f4-5eb4-3bfafb5cebb2@arm.com>
 <20200924095629.GL27174@8bytes.org>
 <CA+G9fYu42j_B+Rg2nq+KKBiKLqxVEqabQ15CujyJ+o6jqRj2uQ@mail.gmail.com>
 <CA+G9fYtG6Ro-NdrP89ipDyUqVVT2=_8pTvjTSeFcWr795bp8AA@mail.gmail.com>
 <20201011055258.22337d66@canb.auug.org.au>
 <CA+-6iNwpFeJaa7CisS-DD2q45uaV8Jz6YU0kPucqpZAAK3ojuQ@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: arm-smmu 5000000.iommu: Cannot accommodate DMA offset for IOMMU
 page tables
Message-ID: <c7e7b9ab-95a8-625f-7988-7f7397a0749f@gmail.com>
Date: Sun, 11 Oct 2020 14:59:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <CA+-6iNwpFeJaa7CisS-DD2q45uaV8Jz6YU0kPucqpZAAK3ojuQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201011_175911_390333_30C99396 
X-CRM114-Status: GOOD (  20.89  )
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
Cc: Poonam Aggrwal <poonam.aggrwal@nxp.com>, Rob Herring <robh@kernel.org>,
 Joerg Roedel <jroedel@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Richard Weinberger <richard@nod.at>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, "Z.Q. Hou" <Zhiqiang.Hou@nxp.com>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Christoph Hellwig <hch@lst.de>, Will Deacon <will@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Suram Suram <suram@nxp.com>, masonccyang@mxic.com.tw,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

+Abhimanyu, Ioana, Fabio

On 10/11/2020 1:36 PM, Jim Quinlan wrote:
> On Sat, Oct 10, 2020 at 2:53 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Hi Naresh,
>>
>> Just adding Christoph and Jim to cc]
>>
>> On Fri, 9 Oct 2020 19:26:24 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>>>
>>> On Fri, 9 Oct 2020 at 19:24, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>>>>
>>>>
>>>>
>>>> On Thu, 24 Sep 2020 at 15:26, Joerg Roedel <joro@8bytes.org> wrote:
>>>>>
>>>>> On Thu, Sep 24, 2020 at 10:36:47AM +0100, Robin Murphy wrote:
>>>>>> Yes, the issue was introduced by one of the changes in "dma-mapping:
>>>>>> introduce DMA range map, supplanting dma_pfn_offset", so it only existed in
>>>>>> the dma-mapping/for-next branch anyway.
>>>>
>>>
>>> FYI,
>>> The reported problem still exists on 5.9.0-rc8-next-20201009.
>>>
>>> [    1.843814] Driver must set ecc.strength when using hardware ECC
>>> [    1.849847] WARNING: CPU: 4 PID: 1 at
>>> drivers/mtd/nand/raw/nand_base.c:5687 nand_scan_with_ids+0x1450/0x1470
>>> [    1.859676] Modules linked in:
>>> [    1.862730] CPU: 4 PID: 1 Comm: swapper/0 Not tainted
>>> 5.9.0-rc8-next-20201009 #1
>>> [    1.870125] Hardware name: Freescale Layerscape 2088A RDB Board (DT)
>>> [    1.876478] pstate: 40000005 (nZcv daif -PAN -UAO -TCO BTYPE=--)
>>> [    1.882483] pc : nand_scan_with_ids+0x1450/0x1470
>>> [    1.887183] lr : nand_scan_with_ids+0x1450/0x1470
> 
> Hi,
> 
> I'm having a hard time coming up with a theory regarding  how a commit
> concerning DMA offsets can affect the operation of a NAND driver that
> appears not to use DMA or the dma-ranges property.  Does anyone else
> have some ideas, or is there perhaps someone familiar with this test
> configuration that I can correspond with to get to the bottom of the
> warning?

I believe you are given only a partial warning and just a glimpse of the 
thread here which is why understanding the connection to the dma ranges 
parsing is not clear. The start of the thread can be found here:

https://lore.kernel.org/lkml/CA+G9fYvuq58q+GsWnzni0sKSHbubuQz-UaK3TASX26V_a7yBVw@mail.gmail.com/

Robin indicated that the IOMMU probe failure was fixed with:

https://lore.kernel.org/linux-iommu/daedc9364a19dc07487e4d07b8768b1e5934abd4.1600700881.git.robin.murphy@arm.com/T/#u

which is confirmed with the new log from Naresh:

https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20201009/testrun/3284876/suite/linux-log-parser/test/check-kernel-warning-92014/log

however the NAND warning still remains. Someone else familiar with these 
NXP development boards should fix the DTS so as to provide the require 
ECC strength property.
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
