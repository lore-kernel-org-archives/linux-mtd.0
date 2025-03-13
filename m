Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306B2C282DE
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 13:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LX/Crj9cm7CZS22sXobrYh32DBiNlV8Fbiz7WgyAZ1M=; b=c7UsmO8Lfr5NQV
	woLInC9NJ0QVQKKjHl/zlNXNeD+KfSP7Uk5ddsSJSDMMeI5zjGFOze1w8LDOUQ/u5etUj1zMZ5Vpp
	+nADBdsnr9Vg/XuATmR0P2qrOJ9SpmiSgVCFjB0hsv9RGEIjOoS/1JRfB8oOcXvu+X8O34VokXB3I
	6is/XgW6QclE/7f/ZkHmELVX+dL+XcpWoy/gxJurv6jBFFFj9NL2bmbK1VctXRE5CXjnkAj8e0B2D
	UK5QIV6RTFX73fNtgYlj7QlQKBThX2NQlofmrJq5kmd9N1AjaIZWAsl6Hrv364tHFi3XGRO/f/vwI
	cunRhUy9xncodbNTHAXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiE4-0000000BJqc-1Uam;
	Thu, 13 Mar 2025 13:03:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiE2-0000000BJqH-4AiM
	for linux-mtd@bombadil.infradead.org;
	Thu, 13 Mar 2025 13:03:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lyl8DYOTUal+4vCgW1HreHqXPEyZ5R/QJMsgXnCWI9I=; b=E5BKeBxgG0SG/2FVjj0DDmz6iE
	5hKuwO7kwY8cSYYhZGOgZDCrtb0vFeJSQOGB8ElSGnfO9Hddvi5za5cmkU1aOgVEd/xq/Oy9HVMrR
	tcIxNjY603dIUYkLx4BPHf41b0KEONSq2uT4SG9XM/jhI3rXwnd+t2Y8Yoi+D+GMUXhvcfk09VgMW
	c7XQEuRu4pBLPQwV7PFVRXxrozicnX3mleoDu5UBt9/jR4vBT3rNPkOud/++nYygnE3Dk/tkCTsy5
	/mZVElD8ResPc2GqEnN3+MhSnwMiDQqDNtAnMszih4L8yQuA2SOZriBdelD+ZHqNguNeSl30aFTAQ
	eSmgZ+pg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiDz-00000002cuK-43mM
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 13:03:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 62C425C5E29;
	Thu, 13 Mar 2025 13:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D6E8C4CEDD;
	Thu, 13 Mar 2025 13:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741871024;
	bh=cSyffy+PWmVQesGeNOfjRD3854cMxOy2XIo3+guxtEk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=W3n7WI2+kNBRhRstzjeL3M06/rCnf1LzWx2YyBLD01j8VmFJANn56CrImwA8yW2+T
	 S0sch8ELktEv1lgKKdJE8batVk23w+yl7Go8YUO4NPYFP3oR+x6ZlO7uJb/jlanFvX
	 S7ZjZTXv/idYIrZSik396jx+G+Yrzt4aKXk/agPeTHfga4jUvCgUIBaYVPj9qEB7u9
	 zFE7QK8bZEplyvWlCoOpYD10A3xrxtVXiRkIZRvB6lxI7GnFZqr67QFT9R/jWP/dS4
	 BRO2/qxom67N+cLtVTodyDfZllKLzMgiaZThXp0n9imUIQcuY7xDNHmMOvwHFRcqNF
	 SCzy9gFfTB/iA==
From: Lee Jones <lee@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>, 
 Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
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
 Zijun Hu <quic_zijuhu@quicinc.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-arch@vger.kernel.org, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org, 
 linux-wireless@vger.kernel.org, linux-rdma@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
 linux-mtd@lists.infradead.org
In-Reply-To: <20250221-rmv_return-v1-15-cc8dff275827@quicinc.com>
References: <20250221-rmv_return-v1-0-cc8dff275827@quicinc.com>
 <20250221-rmv_return-v1-15-cc8dff275827@quicinc.com>
Subject: Re: (subset) [PATCH *-next 15/18] mfd: db8500-prcmu: Remove
 needless return in three void APIs
Message-Id: <174187101580.3629935.6842247156301298100.b4-ty@kernel.org>
Date: Thu, 13 Mar 2025 13:03:35 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-510f9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_130348_334532_A4EFFFAB 
X-CRM114-Status: UNSURE (   7.62  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyMSBGZWIgMjAyNSAwNTowMjoyMCAtMDgwMCwgWmlqdW4gSHUgd3JvdGU6Cj4gUmVt
b3ZlIG5lZWRsZXNzICdyZXR1cm4nIGluIHRoZSBmb2xsb3dpbmcgdm9pZCBBUElzOgo+IAo+ICBw
cmNtdV9lYXJseV9pbml0KCkKPiAgcHJjbXVfc3lzdGVtX3Jlc2V0KCkKPiAgcHJjbXVfbW9kZW1f
cmVzZXQoKQo+IAo+IFNpbmNlIGJvdGggdGhlIEFQSSBhbmQgY2FsbGVlIGludm9sdmVkIGFyZSB2
b2lkIGZ1bmN0aW9ucy4KPiAKPiBbLi4uXQoKQXBwbGllZCwgdGhhbmtzIQoKWzE1LzE4XSBtZmQ6
IGRiODUwMC1wcmNtdTogUmVtb3ZlIG5lZWRsZXNzIHJldHVybiBpbiB0aHJlZSB2b2lkIEFQSXMK
ICAgICAgICBjb21taXQ6IGNjZjVjN2E4ZTViOWZlN2MzNmQ4YzM4NGY4ZjdjNDk1ZjQ1YzYzYTAK
Ci0tCkxlZSBKb25lcyBb5p2O55C85pavXQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
