Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FA9C021B2
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Feb 2025 10:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GzyZ1SZOY/hFZXUYhmIOXDzfaXPuIWL7nDp3ILsvDl8=; b=rnIGjCfg6ki5nF
	AxGz6tMSvAcrzuzzq1aQyvry0okhxzARNZMbbAcgkBoFE4b/rVgYtt7dyrsUKOmdrSPpBkZUjtcTG
	lLLQx0KowAxRuUr4LUGCAEfhskYUYhhBdeNVlDdfHVirpBLZE28q5xiUiHkJhlIfFvbhHq9B3Qf/m
	poX6Evezy/b8jmxdhEoMEG/1rGwPCEwp/QXVUcuiPP14/rK7WKfuHet+QwRMot4LYYGsLi5NGuYL6
	HPXizseb8xjnKRi3HfKX5LpgbWLBJNaqQt573s9y4h4dhAWSba81N13HbxGOHAq/VBjkhb+zzZDlu
	9Zxb+TlinuCS+rX2rVtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlmvK-00000007pnY-2qoF;
	Sat, 22 Feb 2025 10:39:54 +0000
Received: from pv50p00im-ztdg10012001.me.com ([17.58.6.51])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlmvH-00000007pmq-05Bd
	for linux-mtd@lists.infradead.org;
	Sat, 22 Feb 2025 10:39:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=mbxficQPTzs09LWwBbFhdunStNbxz1Db5LUu+U2NlSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme;
	b=yYDN+E04f3AdizaUiroUuQGY41SPVVZcRqALdOpH6NFQhX3QCjWpHGcmHdHvZgXyw
	 lY1ddO0XjuI5jwoyQLYS2xsXRa555rOew3qMgB02ajNFY2naY0JiMg3EzOtw/vDBsm
	 rNcbU3RkjyAdmQBUnnLpBha3Hg45RvWSCLNO8oK0o5dE+ouOgYdV9O7OaddprvalcC
	 F7e6FcKQyQxquf6C4CR09WnXr4uHh4OXsP+wDyxaBcn55oVkRsljjd3IOmoDXx5njY
	 kMIwNWVp9xmRX9kyVkPTFuHEolnlCaw5jRp5Hj9sFk69BnUaESstfS78tB+JnoKuuq
	 DJolzLt315u8g==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10012001.me.com (Postfix) with ESMTPSA id 00694A0092;
	Sat, 22 Feb 2025 10:38:11 +0000 (UTC)
Message-ID: <732f9f29-f794-4491-b942-45ad01b01db5@icloud.com>
Date: Sat, 22 Feb 2025 18:38:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH *-next 00/18] Remove weird and needless 'return' for void
 APIs
To: Arnd Bergmann <arnd@arndb.de>, Zijun Hu <quic_zijuhu@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nicholas Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Johannes Berg <johannes@sipsolutions.net>,
 Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>,
 Jiri Pirko <jiri@resnulli.us>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
 Thomas Graf <tgraf@suug.ch>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Netdev <netdev@vger.kernel.org>, linux-wireless@vger.kernel.org,
 linux-rdma@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-pm@vger.kernel.org, iommu@lists.linux.dev,
 linux-mtd@lists.infradead.org
References: <20250221-rmv_return-v1-0-cc8dff275827@quicinc.com>
 <5d662c4c-76f7-4e5c-82f3-2aeeaf9e3311@app.fastmail.com>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <5d662c4c-76f7-4e5c-82f3-2aeeaf9e3311@app.fastmail.com>
X-Proofpoint-GUID: 5BaBpFy7OfeZq74ITSrzTheUfV5JFE1_
X-Proofpoint-ORIG-GUID: 5BaBpFy7OfeZq74ITSrzTheUfV5JFE1_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-22_04,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 clxscore=1011 phishscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2502220085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_023951_063086_306189D4 
X-CRM114-Status: GOOD (  15.71  )
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

On 2025/2/21 23:40, Arnd Bergmann wrote:
>> This patch series is to remove weird and needless 'return' for
>> void APIs under include/ with the following pattern:
>>
>> api_header.h:
>>
>> void api_func_a(...);
>>
>> static inline void api_func_b(...)
>> {
>> 	return api_func_a(...);
>> }
>>
>> Remove the needless 'return' in api_func_b().
>>
>> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> I have no objection to the changes, but I think you should
> describe the motivation for them beyond them being 'weird'.
> 

yes. C spec such as C17 have this description about return
statement:

6.8.6.4:
A return statement with an expression shall not appear in a function
whose return type is void. A return statement without an expression
shall only appear in a function whose return type is void.

do we need to treat below return statement as bad code style ?

void api_func_a(...);
void api_func_b(...) {
...
	return api_func_a(...); // return void function in void func
...
}

> Do these 'return' statements get in the way of some other
> work you are doing? Is there a compiler warning you want
> to enable to ensure they don't come back? Is this all of
> the instances in the kernel or just the ones you found by
> inspection?

actually, i find this weird return usage by reading code by accident
in driver core firstly:
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?h=driver-core-testing&id=a44073c28bc6d4118891d61e31c9fa9dc4333dc0

then i check folder include/ and work out this patch series.

not sure if there are still such instances in current kernel tree.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
