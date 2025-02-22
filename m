Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB70AC021B2
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Feb 2025 10:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xjsMaR72fPuAkDHPk4zr/XwDbZCf9O/YHO2n6/KUgSM=; b=t6edqlb+xG2oOP
	sbAq/PJ1bjjhdYTs2xigRN1ZPPIwqumx9kBYMROqyKEnAU83t72+EKaJJ3IW7Z81YWBHrQidP2CSl
	jNfYv/7hqALlS2xHn7vptCN74zT8D/EKMJO2Dkev3UHLrEPeV7kzr7/xhlYbhO4K6E9Yy+xMppwEk
	TH5km9YGkL0ntvMYYExfDpRORf497HPQtp0ORxqoF/juZ4h79exB2uXngiOTbPLVdgSwg+fVt+Cnj
	LHGSMAsAHrEcdHOhWRA49uxbi1XCBxaeni+pmkaW5J57I/grie6+tB9swYbVCaj+CXfZ3LwlZQRYJ
	twmUIVt4vnHhKWPr+unw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tln8F-00000007rBE-4234;
	Sat, 22 Feb 2025 10:53:15 +0000
Received: from pv50p00im-ztdg10011301.me.com ([17.58.6.40])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tln7B-00000007r4A-2qOD
	for linux-mtd@lists.infradead.org;
	Sat, 22 Feb 2025 10:52:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=rgvQfOLC7f+M02f6hvzxNZIZUkpYeai7A7dWzk8uoIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme;
	b=Ao4p1n4TrSRRxXxkSH05UqzT/HgGCVsxu62sY49QJR1PuEtvfkjoljG6DYIsPV1Jo
	 Uoed4vqcpZcyby4LnXmShg/OPtqYjLumfWHHUDlYfNqQ6dQN22Ftnqmx6O36rZw4pn
	 Zow40fUE1JPdJ6sCCjY/WYjE+FPhsJ3Qn3uALPQJvHkyeXkgHkQYcEmil8PulKL+fJ
	 fUkhds+oHSvwMCTYtsOSOPQcBSN/J5AwXkpjyTyw6eT8WOu4oEaeNQASEoQIT4MOfi
	 C0yQ4S9F9AXSKb3ZkHgdSRi1KtFKXciIEp5TNHrDn78nvw5GkDRlcaWTiJS2gmJ4GI
	 tcmo7WXp+ddNA==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10011301.me.com (Postfix) with ESMTPSA id 56304180100;
	Sat, 22 Feb 2025 10:51:42 +0000 (UTC)
Message-ID: <a2cf1f09-83d7-402b-94c1-88feec10a513@icloud.com>
Date: Sat, 22 Feb 2025 18:51:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH *-next 00/18] Remove weird and needless 'return' for void
 APIs
To: Johannes Berg <johannes@sipsolutions.net>,
 Stephen Hemminger <stephen@networkplumber.org>,
 Zijun Hu <quic_zijuhu@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
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
 <20250221110042.2ec3c276@hermes.local>
 <9af9413b7ab41c6b2db5f862d0fa50e9de279d67.camel@sipsolutions.net>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <9af9413b7ab41c6b2db5f862d0fa50e9de279d67.camel@sipsolutions.net>
X-Proofpoint-ORIG-GUID: f652v4ma64Vm3Io7f6-KRKFfH-wFIu9m
X-Proofpoint-GUID: f652v4ma64Vm3Io7f6-KRKFfH-wFIu9m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-22_04,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 suspectscore=0 mlxscore=0 spamscore=0 clxscore=1011 bulkscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2502220087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_025209_722034_91838470 
X-CRM114-Status: GOOD (  15.10  )
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

On 2025/2/22 03:36, Johannes Berg wrote:
> On Fri, 2025-02-21 at 11:00 -0800, Stephen Hemminger wrote:
>> Is this something that could be done with a coccinelle script?
>>
> Almost enough to do this:
> 
> @@
> identifier fn;
> expression E;
> @@
> void fn(...)
> {
> ...
> -return
> E;
> }
> 
> 
> It takes a long time to run though, and does some wrong things as well:
> if the return is in the middle of the function, it still matches and
> removes it erroneously.

if return is in the middle, we may need to convert the return statement
in to two statement as [PATCH 18/18] does:
https://lore.kernel.org/all/20250221-rmv_return-v1-18-cc8dff275827@quicinc.com/

namely, Convert  "return func(...);" to "func(...); return;"

C spec such as C17 have this description about return
statement:
6.8.6.4:
A return statement with an expression shall not appear in a function
whose return type is void. A return statement without an expression
shall only appear in a function whose return type is void.


so, do we need to treat "return void function in void function" as
bad code style and make coccinelle script check this bad usage?






______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
