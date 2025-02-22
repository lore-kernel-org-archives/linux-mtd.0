Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B154DC021B2
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Feb 2025 11:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rFBsq7s0ZRNS8OecLMTsZJ1YrPzNT+EVmq0pwtSNquc=; b=epTw79vlcioSpF
	CLVql7qJeyjr8FqvuR9dV52+gKor5OORpD0NejWUGFpAteaobpqmIBx209AU/+9Nz04njcwY9kpYo
	OH0il81HucQen8ldP34Z9OmShRCBr+m2szgdGtBm+8Y0XOs8TcZXShDHQ5i//zFh+C8DxFJeqO91b
	zjXszpxobWeAY+UtHlnmgzmaMevv+zKXkSqXYSXdP/Xp8SYnOiaAIS1eQbWSA06kr3U1Obp/6i9BJ
	lLQv/8dQpSmwpRTsyryMOh+gA2ASZMkxC3q7vn1CLxCwJ1iKpZ2PwoJZBOb5dGwvT0oAi3Rol+Wr/
	Gto6CYAJBG1D8+eHQk2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlnOP-00000007t5P-3Lym;
	Sat, 22 Feb 2025 11:09:57 +0000
Received: from pv50p00im-ztdg10021801.me.com ([17.58.6.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlnFj-00000007sFE-0Fev
	for linux-mtd@lists.infradead.org;
	Sat, 22 Feb 2025 11:01:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=UhO/oKP5iMw5fHjgaGRWOOpphrslB5BPutH1Bqw2Dkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme;
	b=HhStBCZN3rVcd9EC6oBRvG6abifGqlnPtcBVpdm6i/PmmBuQa0QJPHyLR1FLsYmXk
	 MvvGwxnVyjgIAQUePoznfvb7VEqM2/2CzwoYBfpUQAlvZbnYih/hmf83Ex5BvNFrdQ
	 PbfYoJ6GNXR9EuX2Q1IkypReed+wxDFG/c9O7uFQFsKRQdeX9qYk5H4Dvd9QURFidN
	 MaOu/D4ITgbWB/BaBzseWqBas93vN7EeBu7C7tTfSVogYryn4akeV915HBecUZbsev
	 T9vaSLH2CkX0yMcrX7poOXKdwAfoNE9h2RgWTSTlng3BI8SOCu2qBQQAo94LS+WVDT
	 77yqa5YwGC84Q==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10021801.me.com (Postfix) with ESMTPSA id C1B66201011A;
	Sat, 22 Feb 2025 11:00:33 +0000 (UTC)
Message-ID: <8f36be7c-6052-4c5d-85ff-0eed27cf1456@icloud.com>
Date: Sat, 22 Feb 2025 19:00:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH *-next 01/18] mm/mmu_gather: Remove needless return in
 void API tlb_remove_page()
To: Peter Zijlstra <peterz@infradead.org>, Zijun Hu <quic_zijuhu@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <20250221200137.GH7373@noisy.programming.kicks-ass.net>
X-Proofpoint-GUID: xYMDZO87E-9u-9wzotp6QmCV6S-rGtqV
X-Proofpoint-ORIG-GUID: xYMDZO87E-9u-9wzotp6QmCV6S-rGtqV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-22_04,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 phishscore=0 mlxlogscore=885
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2502220088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_030059_104195_42EDF696 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

On 2025/2/22 04:01, Peter Zijlstra wrote:
>>   */
>>  static inline void tlb_remove_page(struct mmu_gather *tlb, struct page *page)
>>  {
>> -	return tlb_remove_page_size(tlb, page, PAGE_SIZE);
>> +	tlb_remove_page_size(tlb, page, PAGE_SIZE);
>>  }
> So I don't mind removing it, but note that that return enforces
> tlb_remove_page_size() has void return type.
>

tlb_remove_page_size() is void function already. (^^)

> It might not be your preferred coding style, but it is not completely
> pointless.

based on below C spec such as C17 description. i guess language C does
not like this usage "return void function in void function";

C spec such as C17 have this description about return
statement:
6.8.6.4:
A return statement with an expression shall not appear in a function
whose return type is void. A return statement without an expression
shall only appear in a function whose return type is void.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
