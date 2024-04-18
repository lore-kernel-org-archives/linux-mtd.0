Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FF9C4345F
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2024 11:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4BSzo8o+755KHsuVC0aZuBk3efU+yJfSJbJ7ZpSQNNk=; b=m7xxj/bxCdN18w
	zK2me1nL7vy6D9JWbosQLcZkiol9+k4GzvSnMZnav/q1nsNyxbkrubUfO7Se5OYu5nFqC9S2sMxz/
	+HkTsEcLAIcKht8a2l5UpyqHOb7fLT7nlzoEPkzpl6pFuVcXFvv9SDPtYUx+nbXadmS29YGvWHzFF
	jVB83q7rtbd/xevp/hiywiuZgvaENam9DW5u3UbcPvIVKGVoXtkbMCar7in6Ju4DjoFhGfQIJfHas
	GANneRExpO5pXS8rVneUEKWg4MtblfZmYWgHBZlUrTkaV1AeNzu1GbmYAl+RVMCvrq8RASE/ERaEQ
	33XU/QhDhlvxRHb4ampw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxPoJ-00000001yOe-1n4q;
	Thu, 18 Apr 2024 11:20:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxPoG-00000001yO3-1zzW
	for linux-mtd@lists.infradead.org;
	Thu, 18 Apr 2024 11:20:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A6232617DC;
	Thu, 18 Apr 2024 11:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E862DC2BD11;
	Thu, 18 Apr 2024 11:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713439207;
	bh=pTH4AMFIX/a1mvllVA9nEz2QdISSpNcl3msKV0Ms2qE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=skBB0CGxR8U4BMU3oTyatlqb+Ux82gAo1aQ91iF9dBoWU+MxdKF360YJOFinq+Clp
	 09Hr9I3Gx6k8kOiUdpttSRQEZuEwPAff4N2g39HYYsqay39X9GNlwwizN1pVkU/b/T
	 zZdGelMgN5wIyfq9oi92tjVvsNcyr22i+aznxes++L7lPJHUBz4eWEm9AKSl+rFBMA
	 K5YpqSDFXOO+dpnYjnpUIgsJokRR8HlfchHOtjgixQ36yinzCrM79G1+O5k7SDbxdO
	 vcUiQKf1EqcN39oS4XzPtoV4VdKbMak7kJjd2dooXFnX7whHqO9YZ8rkJhPbfzfn2v
	 ewcREo8XVKPog==
From: Pratyush Yadav <pratyush@kernel.org>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Tudor Ambarus"
 <tudor.ambarus@linaro.org>,  "Miquel Raynal" <miquel.raynal@bootlin.com>,
  "Richard Weinberger" <richard@nod.at>,  "Vignesh Raghavendra"
 <vigneshr@ti.com>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>
Subject: Re: [RFC PATCH v1 6/6] mtd: spi-nor: introduce support for
 displaying deprecation message
In-Reply-To: <D0N5QYQMX1X4.831Q9SEANU4S@kernel.org> (Michael Walle's message
	of "Thu, 18 Apr 2024 11:57:27 +0200")
References: <20240412134405.381832-1-mwalle@kernel.org>
	<20240412134405.381832-7-mwalle@kernel.org>
	<mafs0jzkw6oq1.fsf@kernel.org> <D0MHEH8OOS44.2PPBZ3LFU4QG3@kernel.org>
	<mafs0bk686l67.fsf@kernel.org> <D0N5QYQMX1X4.831Q9SEANU4S@kernel.org>
Date: Thu, 18 Apr 2024 13:20:04 +0200
Message-ID: <mafs034ri7w9n.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_042008_583046_CD9C3656 
X-CRM114-Status: GOOD (  13.53  )
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

On Thu, Apr 18 2024, Michael Walle wrote:

> Hi,
>
> On Wed Apr 17, 2024 at 5:52 PM CEST, Pratyush Yadav wrote:
>> On Wed, Apr 17 2024, Michael Walle wrote:
>> > On Wed Apr 17, 2024 at 4:36 PM CEST, Pratyush Yadav wrote:
[...]
>> >> I like the idea in general. Do you think we should also print a rough
>> >> date for the deprecation as well?
>> >
>> > Might make sense, any suggestions?
>>
>> How about a simple string to flash_info?
>
> Ahh, I was rather asking if you already had a time frame in mind.
>
> Besides that, should it be a date or a (future) kernel version?
> Roughly about two/three kernel releases?

I think kernel version is better.

I don't base this on any real data, only on gut feeling, but I think
three kernel releases is a good time. Should add up to about 6-7 months.

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
