Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F1EC021A4
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2025 15:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CcFcaqu3nsWq6qh2VFU6P+RUeMHSZBk/+zHIZNBTcgg=; b=zON0T3rGZsYyp8
	qZTlEVaQSG+sLjgRlZn0Wl1DBCelOhxt+XtzRKMunh4plw//nvaAZIGDjgIYostGBw8cT6L9S3UXt
	gUFZPR7fS3DF2ZFTQhtCZ+Vq56HNSqHkTMaTjQcFfdcuX22n8bK2lBXZgT9elcrafuWzaJEGExZb1
	mWhcNBfRlWWghmhOmiIzYMlQh4o2XKuLeZv+GeWFeXMY5lNTQYG+WFJG1ghzl6y0ZtYCkGR3icEH9
	SGtOoxTKQsU02FPI3G1pXK1kHJihzV29If7JvcgpATXwxCwryiOb3j5TQ8zmmNcLH1O7U7088loPq
	8enFR1XzBbc87q0G0ODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tma4f-0000000EE4s-1W6S;
	Mon, 24 Feb 2025 15:08:49 +0000
Received: from pv50p00im-ztdg10021801.me.com ([17.58.6.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZio-0000000E9uh-0BLu
	for linux-mtd@lists.infradead.org;
	Mon, 24 Feb 2025 14:46:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=SxARc5+mPnL0BjR2iW5rWJ4TF8233iOHpKnJbbHiSqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme;
	b=QlrLaWEdYFkfsu8fuz6nbUdcj79Q8tJSmKk2HA1yeaCmsuHQSOTGqxvHL7yUmSH26
	 akU6WkcZrQNFnHq+BJaLeGPq0iB3wrn9quZ3+XX7TL6W2416KdFvIkp5eq2vQ9b1mC
	 1W3KDPpIj0DisqfGR5RfGhPUGajT30GJk6SpSRctraMh5Bn8xJKesYr+HLgu8FHVrW
	 5Dfwx7CMvdnY4JwcEN6gg2auvHgazI6WEAwJkihz3N6RwdjmSunhSudO5G6dDlNdEp
	 B1QbwPUm6oUVtf0ONAKjCUdMnGgia+x/d6OTzrZdtjaV4ethm0Xnv3yRyjfFnT2Mpt
	 tk5oRw9q9GBwg==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10021801.me.com (Postfix) with ESMTPSA id 01FF82010282;
	Mon, 24 Feb 2025 14:45:49 +0000 (UTC)
Message-ID: <a28f04e5-ccde-4a08-b8fa-a9fa685240b1@icloud.com>
Date: Mon, 24 Feb 2025 22:45:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH *-next 01/18] mm/mmu_gather: Remove needless return in
 void API tlb_remove_page()
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
 <20250221-rmv_return-v1-1-cc8dff275827@quicinc.com>
 <20250221200137.GH7373@noisy.programming.kicks-ass.net>
 <8f36be7c-6052-4c5d-85ff-0eed27cf1456@icloud.com>
 <20250224132354.GC11590@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <20250224132354.GC11590@noisy.programming.kicks-ass.net>
X-Proofpoint-ORIG-GUID: rwcKYw_iCScrLPUxt294xX4BCs8xvrO1
X-Proofpoint-GUID: rwcKYw_iCScrLPUxt294xX4BCs8xvrO1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_06,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=911 mlxscore=0 bulkscore=0
 adultscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2502240105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_064614_099569_69DFFF39 
X-CRM114-Status: GOOD (  11.51  )
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

On 2025/2/24 21:23, Peter Zijlstra wrote:
> On Sat, Feb 22, 2025 at 07:00:28PM +0800, Zijun Hu wrote:
>> On 2025/2/22 04:01, Peter Zijlstra wrote:
>>>>   */
>>>>  static inline void tlb_remove_page(struct mmu_gather *tlb, struct page *page)
>>>>  {
>>>> -	return tlb_remove_page_size(tlb, page, PAGE_SIZE);
>>>> +	tlb_remove_page_size(tlb, page, PAGE_SIZE);
>>>>  }
>>> So I don't mind removing it, but note that that return enforces
>>> tlb_remove_page_size() has void return type.
>>>
>>
>> tlb_remove_page_size() is void function already. (^^)
> 
> Yes, but if you were to change that, the above return would complain.
> 
>>> It might not be your preferred coding style, but it is not completely
>>> pointless.
>>
>> based on below C spec such as C17 description. i guess language C does
>> not like this usage "return void function in void function";
> 
> This is GNU extension IIRC. Note kernel uses GNU11, not C11

any link to share about GNU11's description for this aspect ? (^^)




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
