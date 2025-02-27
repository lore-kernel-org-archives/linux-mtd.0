Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47F7C1B0FF
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2025 14:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LvSAu6M4sNNtkIXqADe1tvphLgi4HwPYdeRuXXxy764=; b=tTxPUAHhnbRb2n
	XoGNgBvTd3z3h4A2IuehWSRXv+du6OyaeeAyEXDVSuLAISbkEmifQYUwvoNuShMZyHaOnksSYDc9+
	J8+TokNfZCyeIBgoUtxvNksxQGr3KLohrOZEgdWjqmnfhd+VyTn9S/Oy1ljRVCSzqv/k3WguiptNb
	Mu6z+S1yDd9cEdFl8UL2Tn0eLRdit9FSxH0lmRgK0Y6K4N6qCXPbjT9mZrxcq74P6NTxfvW7j6tDI
	9DE8EKPXEYcA5jK6f8gcIbj+tbrG7GMhMfISNIj9HdyeP1HyzdgC/+ykLK1oe+jh4kh9PooAu0p3B
	3Lm2tvRTVTuzsPzQJoig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf1k-00000007lWP-1xIG;
	Thu, 27 Feb 2025 14:38:16 +0000
Received: from pv50p00im-ztdg10022001.me.com ([17.58.6.58])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tndJu-00000007QLn-3CCL
	for linux-mtd@lists.infradead.org;
	Thu, 27 Feb 2025 12:48:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=3a4gDmWNcm/PN/PkyXMAH7J982HJ/SWLRPrRdcNbL0I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type:x-icloud-hme;
	b=GLbbhl50/6s4XSz2hWsI2pBZw9mNkyoy4mfVS3ceyWFxtT2IXAgPw4vR2c4niyC8z
	 Cn2HmQiD1m50m37YfMI08jjxHRfhEn42+FHcXSScomZlHKDtu+Wp54dOblB3imAZgA
	 8Sh5FnBSf63pOv7KKwz4PnuK53+FcygvCr7GQVeYyjKkuNNU3G7hg7+mVfYTDQsuYn
	 V/LofsjZFEnKZpfyRxF2x9XD81VAonZ5IWIEsKoP+zCePc8L+vIyjsVPd78Yr1B3dG
	 y7y+n4035LJBFthLQyoBxgdJQehrL+qDmYWtQI5x+p4yNMchSmlhXEXKe5LinKs/Im
	 ZmDofqUPOnkdw==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10022001.me.com (Postfix) with ESMTPSA id 9DDEC3E1E07;
	Thu, 27 Feb 2025 12:48:23 +0000 (UTC)
Message-ID: <46d17d84-5298-4460-96b0-9c62672167a0@icloud.com>
Date: Thu, 27 Feb 2025 20:48:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Zijun Hu <zijun_hu@icloud.com>
Subject: Re: [PATCH *-next 00/18] Remove weird and needless 'return' for void
 APIs
To: Zijun Hu <quic_zijuhu@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Thomas Gleixner <tglx@linutronix.de>,
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
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-arch@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, iommu@lists.linux.dev,
 linux-mtd@lists.infradead.org
References: <20250221-rmv_return-v1-0-cc8dff275827@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250221-rmv_return-v1-0-cc8dff275827@quicinc.com>
X-Proofpoint-GUID: dWcj_ItTiibsX6WGOwhQtepLygIMQOy8
X-Proofpoint-ORIG-GUID: dWcj_ItTiibsX6WGOwhQtepLygIMQOy8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_06,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2502270097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_044854_816247_B8032657 
X-CRM114-Status: GOOD (  12.28  )
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

On 2025/2/21 21:02, Zijun Hu wrote:
> void api_func_a(...);
> 
> static inline void api_func_b(...)
> {
> 	return api_func_a(...);
> }

The Usage : Return void function in void function

IMO, perhaps, the usage is not good since:

A) STD C does not like the usage, and i find GCC has no description
about the usage.
   C11/C17: 6.8.6.4 The return statement
   "A return statement with an expression shall not appear in a
function whose return type is void"

B) According to discussion, the usage have function that return type
   of the callee api_func_a() is monitored. but this function has below
shortcoming as well:

the monitor is not needed if the caller api_func_b() is in the same
module with the callee api_func_a(), otherwise, provided the callee is
a API and provided by author of other module. the author needs to clean
up lot of usages of the API if he/she changes the API's return type from
void to any other type, so it is not nice to API provider.

C) perhaps, most ordinary developers don't known the function mentioned
   by B), and also feel strange for the usage

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
