Return-Path: <SRS0=OH0o=DZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A91C433DF
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Oct 2020 20:44:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3E6022277
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Oct 2020 20:44:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="crcxtsJS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3E6022277
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j3s2TwEaeUGkslojTbhqXKMGvuP1ZgSQT32ibGKjWjU=; b=crcxtsJS6SAk5daXZvsGLhAi5
	Xdh2x05cv48/MG/dsE+B2u3nw5fhArmiHvZ9kGEtpTGsvoKNN5nxlsIifpkF915CEP4B5jMNNjxVl
	S/54FZpXP5ypI3PpVsvJ5Hegxx6Ig1W0l9fveQnzR3M8PsVHXJSM9x7jmiFKningd5TVrd8+1aosX
	46d+zNcdJVc8BBnXFa38V335Wlwa4vQBCFPNO25pfAeRFHZgevD4dnZVvJj/MIChU2J+l1K5NGVc1
	QUO7ngP5DAXFf6AacLYRZU9gYpqG9x+XjzSQcgJZQ4bfCdhOiSbCIljpJK3PU1ocvSL8wg5arkEVE
	iOAb13Njw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUFXG-0003fu-QJ; Sun, 18 Oct 2020 20:44:10 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUFXF-0003fT-0z
 for linux-mtd@lists.infradead.org; Sun, 18 Oct 2020 20:44:09 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id EF3B91816C70F;
 Sun, 18 Oct 2020 22:44:07 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id BJNZa_rm4FSq; Sun, 18 Oct 2020 22:44:07 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id zxikGKfwrBKK; Sun, 18 Oct 2020 22:44:07 +0200 (CEST)
To: Bastian Germann <bage@linutronix.de>,
 Richard Weinberger <richard.weinberger@gmail.com>
References: <20200724074705.6376-1-bage@linutronix.de>
 <CAFLxGvxwB3Lq6mnTBFyZ4aR+LPS5hwGPCwG+QqLssuT7FRBy_g@mail.gmail.com>
 <64f36cbd-9ab5-1b37-c4b3-c33b5daf6df8@linutronix.de>
 <1bb381ec-1f5f-3844-d904-7dd2af58577d@sigma-star.at>
 <5efdb785-cd31-1bb1-b1cb-9d213b4d622f@linutronix.de>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Organization: sigma star gmbh
Subject: Re: [PATCH] mkfs.ubifs: remove OPENSSL_no_config()
Message-ID: <cd253730-5742-6449-036a-debdece3d85c@sigma-star.at>
Date: Sun, 18 Oct 2020 22:44:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <5efdb785-cd31-1bb1-b1cb-9d213b4d622f@linutronix.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201018_164409_171235_6AE50DFE 
X-CRM114-Status: GOOD (  10.76  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 9/29/20 4:05 PM, Bastian Germann wrote:
>> However, recent man pages say, that the OPENSSL_config functions are deprecated
>> since OpenSSL 1.1.0 and OPENSSL_init_crypto should be used now, so the patch
>> might require an extra #if for newer OpenSSL versions.
>>
> 
> That would be another patch but does not invalidate this one. mtd-utils
> also uses other functions which are deprecated in OpenSSL >= 1.1.0:
> 
> OPENSSL_no_config
> OpenSSL_add_all_digests
> OpenSSL_add_all_algorithms
> EVP_cleanup
> ERR_free_strings
> ERR_load_crypto_strings
> 
> You can yield this list via compiling with -DOPENSSL_API_COMPAT=0x10100000L.
> 

I agree. Given that there is a longer list of other things to take care of anyway
and since it builds just fine with recent OpenSSL on my end as well, I'll just
apply the patch upstream for now.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
