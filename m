Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFF6C43458
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2026 03:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3w/C+TAT+kxf2SYMYoKDrQt5C2dSpIC28fZLPNrgGh0=; b=LSjcBZbz0kAz/x
	6yHnMt+LuLtln3w3evzUg3MYNITfqq9HZ+3SZUHhWahng1/OoP/nmrAcm20BmPhDYUeTM7+e0krsn
	JLhZIQOKSuV1BounYvvjersAIb3LdPvBhu3K1e5Kjt1kSNHHq3VPlGYpMDDNgAvbQuHpXdRCnZZq+
	rgB3x/uG/C06rqvDfeOiD63sUO4ZLDbXPmxZa+RdDN194kwnjueeflUQcJqcBCaWxw5ysRPCPUSIn
	G6B3BARw3Nw9AMnqSLQma5s2eyGVTLTtOHRt4ugrJC+zxdEGLWhwMbTJiLHfqNWGWkPhA1YpWMGFB
	cawe/WpEw5YTCWoVKF0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf7l3-00000003SqL-3sGZ;
	Thu, 02 Jul 2026 03:06:33 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf7l0-00000003SpY-1ozG
	for linux-mtd@lists.infradead.org;
	Thu, 02 Jul 2026 03:06:32 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id F0ED52C04EA;
	Thu,  2 Jul 2026 15:06:10 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1782961570;
	bh=V812YaJU+KNxG1PodMzF67Is2X07ecw5J2kPpeJwYds=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=sF1lR7ilp2NnBpXhReMmKYro6x2DfNoXT4/cWl54Xh+4nXfZz0Q5W7OminykCadD+
	 zB52Sy8swYbk9BRiy/qT6aAfXSeVF3ikDtbXiJ15YK+hh5KHWRnfbKqTlsQtA6XGu9
	 +eVRuLfW6da7QpqKd3HwwedcNJFEFXgtqldZt2Z1UUyGu4F50ozseYJRamHKU0LnfK
	 Y7gZlSK8XweLHalvb+SJrOaVdEaLmxCJByHRxbdYjWndrzIRgzKi2P4cQbNjmaa5A6
	 1xjzNsvPJhI5OTm1AmPkJMRuY45yOb2oWo7OTOcFmfUFdYs/sW5TrAfG4HSyyLnzeh
	 4+lMKvliJRU+w==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6a45d5a20000>; Thu, 02 Jul 2026 15:06:10 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.39; Thu, 2 Jul 2026 15:06:10 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1748.039; Thu, 2 Jul 2026 15:06:10 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "Takahiro.Kuwano@infineon.com" <Takahiro.Kuwano@infineon.com>, "Ronan
 Dalton" <Ronan.Dalton@alliedtelesis.co.nz>
CC: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
	<richard@nod.at>, "pratyush@kernel.org" <pratyush@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"vigneshr@ti.com" <vigneshr@ti.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "mwalle@kernel.org" <mwalle@kernel.org>,
	Aryan Srivastava <Aryan.Srivastava@alliedtelesis.co.nz>
Subject: Re: [PATCH v2 1/3] Revert "mtd: spi-nor: remove Fujitsu MB85RS1MT
 support"
Thread-Topic: [PATCH v2 1/3] Revert "mtd: spi-nor: remove Fujitsu MB85RS1MT
 support"
Thread-Index: AQHdBRJ8+HvBPYSwmEi4Lf0sk+8LHLZV9jcAgADe8oCAAER1AIAAEDcAgACAk4CAAQSDAIAAFjqAgAAHAgA=
Date: Thu, 2 Jul 2026 03:06:10 +0000
Message-ID: <e946b3c6-304a-4015-a144-285e7f2f4e6a@alliedtelesis.co.nz>
References: <2b8390c0aaae4203af318f9a5edbb0eb@infineon.com>
 <20260701020856.217664-1-ronan.dalton@alliedtelesis.co.nz>
 <490fc98b2996487fba3abd62176bb1dd@infineon.com>
 <8baaf8a603f7f351b4f7acb7a2df4cb60be9f083.camel@alliedtelesis.co.nz>
 <99731a393e5649e692afe57f59d5926b@infineon.com>
In-Reply-To: <99731a393e5649e692afe57f59d5926b@infineon.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.12]
Content-ID: <4058D03F1B4CCA4F9C575DD378C748DC@alliedtelesis.co.nz>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=TI3mSEla c=1 sm=1 tr=0 ts=6a45d5a2 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=drD7vYo3kbIA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=bUQKSiCPAAAA:8 a=QHmzQhJ_PoeJDpgS1uAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=-fHZXUhsFbuwFN3fwQAr:22
X-SEG-SpamProfiler-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_200630_953775_646AB8E0 
X-CRM114-Status: GOOD (  11.24  )
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


On 02/07/2026 14:41, Takahiro.Kuwano@infineon.com wrote:
> Hi Ronan,
>   
>> Hi Takahiro,
>>
>> On Wed, 2026-07-01 at 09:49 +0000, Takahiro.Kuwano@infineon.com wrote:
>>> I didn't mean any kernel features, but we can dump tmpfs contents
>>> from/to FRAM chip (exposed as NVMEM device) by 'dd'. Doesn't it meet
>>> your system's requirement?
>> Do you mean something like creating a tmpfs and then say, using `tar`
>> and copying the data to nvmem with dd and restoring this data at boot?
> Yes, I meant something like that (sorry, my comment was still not clear).
> Hope that's worth considering.

It won't quite work. Because we have requirements involving ensuring 
when a file is erased it is gone ASAP (i.e. shred). It's all a bit of 
security theater because in reality the safest thing would be to keep 
such secrets in a TPM or protected with a key stored in a TPM.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
