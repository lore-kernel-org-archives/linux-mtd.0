Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2C8C021B3
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Feb 2025 19:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nTO1nSJH4O4nI/ktVbzfZMnJQeYMUoGHZJJwofOsLRg=; b=sptUTbowwfOz+d
	0gUkzECusAPYGRKq18Sf/NwZDdyJTLM/ffwxZF88AtFQtDhJz2BZzJerjEnQ4KYNwt2WGdj4jEXWC
	n1tjIVHIwrLb1l1zCQo2NbVd8K/zVHAc1gIEeRDCOC1AZvOGuMXSzHS3QW8QHvck9RqUufVG7XUEe
	A9Op5wjAUxZg+3V4fbWvvT3pCaWEep+pv0ch0wAD64V82TstEJHJbTD8bFbgr00Pm7XxtehD27KJO
	xm5jz5WYQcRaRTxnhb0v+PvdC6DzlF2/YU3j3kpjk7RIuTSIVfeJ8UWJwzxI9xFGPu6m5Q38sL91F
	7R8tJgh47ioBdEg6dfrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYqa-00000006fTm-3uZ4;
	Fri, 21 Feb 2025 19:38:04 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYpO-00000006fDr-1iHK;
	Fri, 21 Feb 2025 19:36:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=zDxTSXduPQXA4xHKPlyHXnfxQxWR7o6zkvl4FTCCsPY=;
	t=1740166606; x=1741376206; b=AdYcG0+G6Hdhm1STihV6VoaZERPM7Y+ANJDI3y4abwA1819
	rWvceLA2HB4jraSwHt/hmKMaRPT1rq7pPOmHXQsuLuWvOArVoDGj9vnDDTzF59CHeF3E23PEsq5sR
	vRbTYkTu/9QQ6BQSkMXqeccS2HSDb6oHF/J5wE9YiEv2RRCu7GIzmmi3Ggkum4Slbz6EUJV5q3TPR
	+cm1pwvLtw31wQrYQoNHCRKFqgoLxFzWCsGAXCiKwHhnWI3rmlU5bN7CCifX2PEvfgG0dZnNi5XCH
	5AttYJ4sRMQMHW/qX+lIL3cbR0z+QR61aq1rmUmv7EWJkwsFMuOArHzTz0FuzO9A==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1tlYp2-00000005Y57-49wJ;
	Fri, 21 Feb 2025 20:36:29 +0100
Message-ID: <9af9413b7ab41c6b2db5f862d0fa50e9de279d67.camel@sipsolutions.net>
Subject: Re: [PATCH *-next 00/18] Remove weird and needless 'return' for
 void APIs
From: Johannes Berg <johannes@sipsolutions.net>
To: Stephen Hemminger <stephen@networkplumber.org>, Zijun Hu
	 <quic_zijuhu@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Will Deacon	
 <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Andrew
 Morton	 <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>, Peter
 Zijlstra	 <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Thomas
 Gleixner	 <tglx@linutronix.de>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich	 <dakr@kernel.org>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski	 <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman	 <horms@kernel.org>, Jamal Hadi Salim
 <jhs@mojatatu.com>, Cong Wang	 <xiyou.wangcong@gmail.com>, Jiri Pirko
 <jiri@resnulli.us>, Jason Gunthorpe	 <jgg@ziepe.ca>, Leon Romanovsky
 <leon@kernel.org>, Linus Walleij	 <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Lee Jones	 <lee@kernel.org>, Thomas Graf
 <tgraf@suug.ch>, Christoph Hellwig <hch@lst.de>,  Marek Szyprowski
 <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Miquel
 Raynal	 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Zijun Hu <zijun_hu@icloud.com>,
 linux-arch@vger.kernel.org, 	linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, 	iommu@lists.linux.dev,
 linux-mtd@lists.infradead.org
Date: Fri, 21 Feb 2025 20:36:26 +0100
In-Reply-To: <20250221110042.2ec3c276@hermes.local>
References: <20250221-rmv_return-v1-0-cc8dff275827@quicinc.com>
	 <20250221110042.2ec3c276@hermes.local>
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_113650_451425_85302C2E 
X-CRM114-Status: GOOD (  10.69  )
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

On Fri, 2025-02-21 at 11:00 -0800, Stephen Hemminger wrote:
> 
> Is this something that could be done with a coccinelle script?
> 

Almost enough to do this:

@@
identifier fn;
expression E;
@@
void fn(...)
{
...
-return
E;
}


It takes a long time to run though, and does some wrong things as well:
if the return is in the middle of the function, it still matches and
removes it erroneously.

johannes

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
