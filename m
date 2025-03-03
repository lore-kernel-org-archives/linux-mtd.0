Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26AFC282CD
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Mar 2025 12:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oigdkTksD4w5zXeVAZ1xOkG0rdFFEwksHzCNDIhiQ4k=; b=YKdglyClhbCMKp
	Rliz775Si11SrAJXmUnZPmf7cd8fHS1F7AZ+eRudo9tf7Z/aEL3mCMa3/FL8zYn16xW5szx229YRY
	EqswXmphIjAPeARTquOP63XrHaUf54A++VMV5q0oEXZT79xOSIaTuf8sQtn8+IVWO5zM/gwn1oCsL
	qsnnF7PoHduUj8BBkz6HouentQ7KT7iNIJzW9TQRrdh/mMfMsd0AotSisp4oAoOJs/VuXFEELn43T
	QLOAnPDIPtr6nHHYNwI2PPkIUadeN7pe89C6AWERzSFeC1x1/mKgzwi4rWTNMfdKf/qomcWgqK9Fu
	C5iBXJveL2WcUb1315tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4gO-00000000hvl-1yF7;
	Mon, 03 Mar 2025 12:14:04 +0000
Received: from mr85p00im-hyfv06021401.me.com ([17.58.23.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp40N-00000000ZOD-0nCt
	for linux-mtd@lists.infradead.org;
	Mon, 03 Mar 2025 11:30:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=OZOLugLSboUaxk503olOimdjHThkYZSt/rnUocHx7qo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme;
	b=M9LNaQQMBVnDvn7O9dkyxfqENe+n3CTiJTPQ2UQFIHq6HOYn5yqN3iDQ3RVhMcn23
	 RYbgEyO7lbqW+H+rJi6eLqXyW0ofbGlb2TozfcwQt+N3LDxfRINewpBQO64R70O6JP
	 Fj4pbqb3B74JtNoj/kfZRb0TgXmhRDVBpuDr2nHUHUnQnsoslms9i4lxHUEqE597f0
	 dsKBFbP0qhEmAOCAG72w3Jw4tGGCdcmaS+BdhFHar4cmpTgkAp9kjNy3bhZerCy1fm
	 yb4VLYz3eRYNRP0qJgIXtuCQgNCwAPfOp2U/Lehb0PDMMPAW6dfU3J1HAJf8t1L7ga
	 V8U2HDDNFoYsA==
Received: from [192.168.1.26] (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
	by mr85p00im-hyfv06021401.me.com (Postfix) with ESMTPSA id D31F830384C0;
	Mon,  3 Mar 2025 11:30:17 +0000 (UTC)
Message-ID: <ca719ca0-ee14-4022-bf61-5794d7ec8d3a@icloud.com>
Date: Mon, 3 Mar 2025 19:30:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH *-next 00/18] Remove weird and needless 'return' for void
 APIs
To: Peter Zijlstra <peterz@infradead.org>
Cc: Zijun Hu <quic_zijuhu@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>,
 Jiri Pirko <jiri@resnulli.us>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
 Thomas Graf <tgraf@suug.ch>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-arch@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, iommu@lists.linux.dev,
 linux-mtd@lists.infradead.org
References: <20250221-rmv_return-v1-0-cc8dff275827@quicinc.com>
 <46d17d84-5298-4460-96b0-9c62672167a0@icloud.com>
 <20250227130347.GA5880@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <20250227130347.GA5880@noisy.programming.kicks-ass.net>
X-Proofpoint-ORIG-GUID: VRiK2BwrsvBlqf3istvRC36nkjOjRITT
X-Proofpoint-GUID: VRiK2BwrsvBlqf3istvRC36nkjOjRITT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_07,2025-03-03_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 adultscore=0 clxscore=1015 mlxlogscore=855 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2503030088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_033039_227717_D73BD4CB 
X-CRM114-Status: GOOD (  14.48  )
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

On 2025/2/27 21:03, Peter Zijlstra wrote:
>> C) perhaps, most ordinary developers don't known the function mentioned
>>    by B), and also feel strange for the usage
> It is quite common to do kernel wide updates using scripts / cocinelle.
> 
> If you have a specialization that wraps a function to fill out a default
> value, then you want the return types to keep matching.
> 
> Ex.
> 
> return_type foo(type1 a1, type2 a2);
> 
> return_type my_foo(type1 a1)
> {
> 	return foo(a1, value);
> }
> 
> is a normal thing to do. The whole STD C cannot return void bollocks
> breaks that when return_type := void, so in that regards I would call
> this a STD C defect.

The usage is a GCC extension.
but the usage is prone to be used within *inappropriate* context, take
this patch series for an example:

1)  both foo() and my_foo() are in the same module
2)  or it seems return type void is the best type for foo(). so no good
reason to track its type.



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
