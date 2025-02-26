Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98660C021BF
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2025 13:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JkDO5tpt/S9q+J9QzlWOuDLYW2LTL9AnfmYarDrcEVw=; b=wk6u+cIsnlLkdE
	0GKL6QtErMGG/ay22sA2dV8WR+wQITCTuiL46SJWVgioCPydA0T+p6y7MDcL2Hrw3BD5Iy3tE2/n5
	gvA6X3VcySBj6z6dSyMYtt4tSRsBSMZ1X1qL9TMit5DBjmhGZmopFKK1L1RXEBmhXhLZ6GvZsAj3p
	Xbw6wutS0mD9dJUWKmdjG+ZTkQ1MG8+L+1EKr6rzjhw8Pp/k9EO/k5LoKA1Z8fCVMpVjRohSokbag
	u/upOcpdyobi6syWpikA/5JwAcGOZ1yD/K9Dv5zwZ4LD5dgDKQlnXX+m4FU7gfV1Zu8mwbReDhxNa
	VJ6ZgpSiTjmwM0ImgBRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHPZ-00000003qBj-2GIr;
	Wed, 26 Feb 2025 13:25:17 +0000
Received: from pv50p00im-ztdg10011301.me.com ([17.58.6.40])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnFcm-00000003U06-38bc
	for linux-mtd@lists.infradead.org;
	Wed, 26 Feb 2025 11:30:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=SOdlXl7RXO630hj2D8KbTA/iuYN0f3n9ChpjV2oMRbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme;
	b=rWtw35VN5C7ebUryxGYabBiGNkfRxevNXaKu3lmmbcfRwCfqvGmsARTKGVlEDc3vJ
	 IUw+i/jF2/O7wPykYL7GtrScwR7YHPk2KZArZBlYEByVg4HG2euMsCf4SLAhxqqINe
	 T4aLRNRVMNlFJyn+/hO3Lmf6LkZiGLt8eWLCMvUUCNYIgCuhqhS16/5+FYQBrqDBv9
	 cTNT5EvlskIwUWEEZthrUNkKMbaMBoPHtGY9C1f3/Wkj+mhDFLP1F1CqAqbIZvoN+x
	 V8XpPNLsrc2QkugOEEdKPXC0Zg7dBaQpmDQ+gMVmCM7ShlzUTzFJzMqx6xBRgIBMy+
	 ioIbkere3zE9w==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10011301.me.com (Postfix) with ESMTPSA id EAC1C18036A;
	Wed, 26 Feb 2025 11:30:23 +0000 (UTC)
Message-ID: <d70d059e-37aa-431d-986c-5666f006d610@icloud.com>
Date: Wed, 26 Feb 2025 19:30:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH *-next 01/18] mm/mmu_gather: Remove needless return in
 void API tlb_remove_page()
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: Zijun Hu <quic_zijuhu@quicinc.com>, Peter Zijlstra
 <peterz@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
 <a28f04e5-ccde-4a08-b8fa-a9fa685240b1@icloud.com>
 <15c121c7-aeed-480e-8b1a-8ff23b4a3654@intel.com>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <15c121c7-aeed-480e-8b1a-8ff23b4a3654@intel.com>
X-Proofpoint-GUID: BXt7ADwYEBiuzX8MsPltF1M0d6Q_8HN4
X-Proofpoint-ORIG-GUID: BXt7ADwYEBiuzX8MsPltF1M0d6Q_8HN4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 phishscore=0
 clxscore=1015 suspectscore=0 mlxscore=0 adultscore=0 mlxlogscore=993
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2502260092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_033048_793504_9563742E 
X-CRM114-Status: GOOD (  12.61  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAyNS8yLzI2IDAxOjI3LCBQcnplbWVrIEtpdHN6ZWwgd3JvdGU6Cj4+Pj4+IEl0IG1pZ2h0
IG5vdCBiZSB5b3VyIHByZWZlcnJlZCBjb2Rpbmcgc3R5bGUsIGJ1dCBpdCBpcyBub3QgY29tcGxl
dGVseQo+Pj4+PiBwb2ludGxlc3MuCj4+Pj4KPj4+PiBiYXNlZCBvbiBiZWxvdyBDIHNwZWMgc3Vj
aCBhcyBDMTcgZGVzY3JpcHRpb24uIGkgZ3Vlc3MgbGFuZ3VhZ2UgQyBkb2VzCj4+Pj4gbm90IGxp
a2UgdGhpcyB1c2FnZSAicmV0dXJuIHZvaWQgZnVuY3Rpb24gaW4gdm9pZCBmdW5jdGlvbiI7Cj4+
Pgo+Pj4gVGhpcyBpcyBHTlUgZXh0ZW5zaW9uIElJUkMuIE5vdGUga2VybmVsIHVzZXMgR05VMTEs
IG5vdCBDMTEKPj4KPj4gYW55IGxpbmsgdG8gc2hhcmUgYWJvdXQgR05VMTEncyBkZXNjcmlwdGlv
biBmb3IgdGhpcyBhc3BlY3QgPyAoXl4pCj4gdGhpcyBpcyBuZXcgZm9yIEMxNyBvciB3YXMgdGhl
cmUgZm9yIGxvbmcgdGltZT8KPiAKClN0YW5kYXJkIEMgc3BlYyBoYXMgdGhhdCBkZXNjcmlwdGlv
biBmb3IgbG9uZyB0aW1lLgpTdGFuZGFyZCBDMTEgc3BlYyBhbHNvIGhhcyB0aGF0IGRlc2NyaXB0
aW9uLgoKPiBldmVuIGlmIHRoaXMgaXMgYW4gZXh0ZW5zaW9uLCBpdCBpcyB2ZXJ5IG5pY2UgZm9y
IGdlbmVyYXRpbmcgbG9ja2VkCj4gd3JhcHBlcnMsIHNvIHlvdSBkb24ndCBoYXZlIHRvIGhhbmRs
ZSB2b2lkIGNhc2Ugc3BlY2lhbGx5Cj4gCj4gdm9pZCBmb29fYmFyKC4uLikKPiB7Cj4gwqDCoMKg
wqBsb2NrZGVwX2Fzc2VydF9oZWxkKCZhX2xvY2spOwo+IMKgwqDCoMKgLy8vIC4uLgo+IH0KPiAK
PiAvLyBnZW5lcmF0ZWQKPiB2b2lkIGZvb19iYXJfbG9jayguLi4pCj4gewo+IMKgwqDCoMKgc2Nv
cGVkX2d1YXJkKG11dGV4LCAmYV9sb2NrKQo+IMKgwqDCoMKgwqDCoMKgIHJldHVybiBmb29fYmFy
KC4uLik7CgphYm92ZSBpcyBhYmxlIHRvIGJlIHdyaXR0ZW4gYXMgYmVsb3c6CiAgICAgIHNjb3Bl
ZF9ndWFyZChtdXRleCwgJmFfbG9jaykgewoJZm9vX2JhciguLi4pOwoJcmV0dXJuOwogICAgICB9
Cj4gfQppIHdpbGwgbGlzdCBteSByZWFzb25zIHdoeSB0aGlzIHVzYWdlICJyZXR1cm4gdm9pZCBm
dW5jdGlvbiBpbiB2b2lkCmZ1bmN0aW9uIiBpcyBub3QgZ29vZCBpbiBjb3ZlciBsZXR0ZXIgWzAw
LzE4XSBvZiB0aGlzIHNlcmllcy4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
