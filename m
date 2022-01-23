Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD186C433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jan 2022 22:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SkLLJEUWcCPmE6Z0LqEPTJ5oK4vp4onQh27ol3Gw08U=; b=UiX6K4Qs8J52el
	hUzpXIfdhghgkhrogIh6KRb9vrTctmoc1CnFo5l6xfuQYx+Jj2PNmlL5lWkuOrS4rXkh1ZmsSR3df
	8+Jb2mVYRjpA3tbwuzNra9l+tm10yvFmJMmR1dtsJrFtceeuuDg065EWbQ4CkF3djI0M8lp6jyQiY
	ekI6+M/bnk3+kaH6APrqMs1dL1wtEYR+CAAp4iHzWmygxSKo+OajezBgsJzaA6K20YjtNEt5gTTZ1
	r6ttIx/QJGK+QHfVIzfxikqyDXWOPijTIXjKcyjtilkHaWasX31Du8qoOKWgb6npxW/EvROsJ1Wk8
	43wIeQc6L9z0gr0u8roA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBlax-001sEb-Rz; Sun, 23 Jan 2022 22:44:23 +0000
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBlau-001sDb-FS
 for linux-mtd@lists.infradead.org; Sun, 23 Jan 2022 22:44:22 +0000
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.173])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 8337FD984D66;
 Sun, 23 Jan 2022 23:44:07 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 23 Jan
 2022 23:44:05 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004b7e6303c-d087-4cdd-8e9a-f381c1422b65,
 90EAC8BD64EA4EE21D802F9E5F0AC1C4B4718499) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d4ba6413-57ce-14c1-ed48-d00db2f74bd3@kaod.org>
Date: Sun, 23 Jan 2022 23:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] mtd: aspeed-smc: improve probe resilience
Content-Language: en-US
To: Pratyush Yadav <p.yadav@ti.com>, Patrick Williams <patrick@stwcx.xyz>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <linux-aspeed@lists.ozlabs.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Richard Weinberger
 <richard@nod.at>, Potin Lai <potin.lai@quantatw.com>,
 <linux-kernel@vger.kernel.org>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 <linux-arm-kernel@lists.infradead.org>
References: <20211229143334.297305-1-patrick@stwcx.xyz>
 <20211229173411.l2bipmi4x3arqjoo@ti.com> <Yc3Qav+ULNdF5zRT@heinlein>
 <20211231102623.izaqlzjvracbbgmp@ti.com> <20220103171721.46c8e697@xps13>
 <YdSP6tKyQ2ZRUC+2@heinlein> <20220105063244.lno3xur64uepa7i5@ti.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220105063244.lno3xur64uepa7i5@ti.com>
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 62bc6a40-d1d1-4864-991d-9b803c761a1a
X-Ovh-Tracer-Id: 15724036627872713720
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrvdehgddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_144420_696611_FB51023E 
X-CRM114-Status: GOOD (  23.45  )
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

>> I had an offline discussion with someone who knew more history on this driver.
>> My understanding is that the linux-aspeed team is aware of this being deprecated
>> but that there was some missing support for interface training that nobody has
>> gotten around to write?  If that is the case this really isn't even a "simple"
>> port to a new API at this point.
> 
> Unless the controller needs some unique feature (I don't think it does
> on a quick glance), the conversion should not be too difficult. For any
> experienced developer, even if they are unfamiliar with the SPI MEM API,
> I don't think it should take more than 2-3 days to do the conversion.
> The code to program the registers would stay the same, all that needs to
> change is the API through which it is accessed.

Writing a spimem driver is not a problem, I think people have done
that in house. Aspeed has one for AST2600. We have one for u-boot
I wrote sometime ago. I even have one for Linux but training comes
with ugly hacks to fit in the current stack.

All Aspeed SoCs need training and that has been the problem for the
last 4 years or so because we can not do training without knowing
a minimum about the flash being trained :/ The previous framework
offered a way to do a first scan and tune the delay settings
afterwards. It worked pretty well on AST2400, AST2500 and AST2600
even if more complex.

One alternative was to include the setting in the DT but the flash
modules are not always soldered on the boards, at least on OpenPOWER
systems which have sockets for them. The board are large, the wires
long, the need is real, some chips freak out if not tuned correctly.

spimem needs an extension I think. Sorry I have not been able to
push that forward. Lack of time and other tasks to address on the
host side of the machine. This is really a software problem, we
have the HW procedures ready. If a spimem expert could get involved
to make a few proposals, I would be happy to help and do some testing.
QEMU models are good enough for the software part. We can do the
training validation on real HW when ready.

Thanks,

C.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
