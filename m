Return-Path: <SRS0=nuHD=DC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1111C4346E
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 03:16:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96C9A2083B
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 03:16:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="scB4o2QO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96C9A2083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hGRzKnIfxR1uLjSLGHypyl7EXlo4bxppBQKhpytXUXI=; b=scB4o2QO8Bg5klW6JalzxrCc4
	5YEyDkbvq+MHMGyUiuiQoFasqvEMiYqud5a+jy0D2zcnpvZap6H9vPybygpJnRfsv9sENTLTnZU0o
	GzpmpN+VOz3/UIyJL+6TdNbMaKA9fcn9OunxAv++q3INl5ZO34ES/L6AH2PrhepZi3XC1/3ZSvGyi
	bA21Y91xppVxdydxrwbWpurt3k/JgkODsjNtsaAdEvBKVX0Z6+oWLxTLCO7+CzVjap3TC/SFM2Xl2
	tPdf91S8azFo5mHKZCwrjY6ZPm5BoDr6N+4nJWMhH/8LuSj+d6Gvk2A+yXnq+YRq6mMTxwudlQvzE
	HQ/GzhTcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLeCq-00084j-6T; Fri, 25 Sep 2020 03:15:32 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLeCm-00084P-NS
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2020 03:15:29 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id E77BF18191041;
 Fri, 25 Sep 2020 05:15:25 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id eXVDJhQ_rOoj; Fri, 25 Sep 2020 05:15:25 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1r1N6oWlxFdi; Fri, 25 Sep 2020 05:15:25 +0200 (CEST)
Subject: Re: [PATCH] mkfs.ubifs: remove OPENSSL_no_config()
To: Bastian Germann <bage@linutronix.de>,
 Richard Weinberger <richard.weinberger@gmail.com>
References: <20200724074705.6376-1-bage@linutronix.de>
 <CAFLxGvxwB3Lq6mnTBFyZ4aR+LPS5hwGPCwG+QqLssuT7FRBy_g@mail.gmail.com>
 <64f36cbd-9ab5-1b37-c4b3-c33b5daf6df8@linutronix.de>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Autocrypt: addr=david.oberhollenzer@sigma-star.at; prefer-encrypt=mutual;
 keydata=
 mQENBFZyf0YBCADHyKhABhxthCC9n48pvsuk5p3IEdYXMs8Apenh1N/Z4cViAz/d/nSCZ+FG
 FX/PSubEzq8AilZLejchAltaORCvA1Y6FgTlpcdJ6gHDfStDbJL/vk5N8aL7YNF7VfjTRntB
 tKbhKcrG05nbdNjIioAm04pt9rx5mV5KMbf22/FdZpOSSsC6/N7b/cFH9+fx8kwi4pNFuJwr
 BkWRuQ7rEtCoSpd22t+Vh9qA7kymW9gWY405258jnN65jBO7ElqU2CCuGRPg6uryAHV3RVCB
 9j9AE3HLacQReFtt5ylyydSQbaK4K9asnd7U2/C11vIuuciXCppX4bPap/pMnGpzw0UNABEB
 AAG0N0RhdmlkIE9iZXJob2xsZW56ZXIgPGRhdmlkLm9iZXJob2xsZW56ZXJAc2lnbWEtc3Rh
 ci5hdD6JATcEEwEIACEFAlZyf0YCGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQvOXc
 PHQaAtFuEAgArXOhaoaVvCMVCa5N25Q/+Q6K1wrVpPmkH89yhQqCmfM6f+2VM5MGFDPfaSJ3
 5fBDH0iwBQwlXIb7NSXWtzdXX9rMvJkJqv45TgeKtJApf/sRhmcN+clrwzP8oZQbxkP1YWzo
 Vwo4lOb3Kv7aY9yeCjqNbdJJ57NpvYOUrzrCpGkrDPBBQOvKF3wbq3oU/o3dT23NDeQ20jXg
 quJf/PCw6WCzRxqg58wH02MdMDQe8vByzVig2bM2e7DErtt+hPK/Dmdsqgns+Z+SrQcOvRa3
 GMAHAuHB0u2LhYO6NyaNCgzdgutorilYcq7FEKr8XqwOnfVmZdCW3qGKmLbn6qMEdLkBDQRW
 cn9GAQgAvugF8cFjv2Zs4BBb44SnxGawBySC1bMRas/MjA9EMHUAx/StcecQmxnl6BzEyGpr
 +TRnXIzcb5xI8SxitBDU5MLvwsHgNvpYp9fscd4kWP7oMir9ta3Q8SvT4OLbO4FZBGaURzGP
 ak8JmjMMtOoOBh4meOjz6GrJe9UIGxT94aB01w7YohfBANzK8xyk4ykKC5Op4XgaaMKOEQUa
 h7wajcojYSlvgOiXqEisMHlRDAW6sXL2sEM7TIpvYhy9txMLllpkYb0Pu1BvUpY/unsybWKA
 FyiTmeiY+nEveUvqX6Ef7BWdClBeCk2UaRvtcoLd22VxMlKTniHQcNMOXlRRawARAQABiQEf
 BBgBCAAJBQJWcn9GAhsMAAoJELzl3Dx0GgLRPtcH/jD6rn2+VIKgrHdt3ao3Abpu2fqYfwbI
 yPAtpXOddDptVq+0A/2arXT1Y8+jNSZpbAg8K+bLaEAcSUEjviKMpfI7ppTUBuGKrpgc5xsi
 UpKkJCb7oB1ZraIBNBPtPPVUhbwLie4uW/LVt+8rBKz3W9KEDOsT0ZCG/pW8Ld+EpDR9l0fm
 qoVHaw8PhLAtez+B7HS7Hv7iJPDtX85kFYpud8kIPENXVn9EjZudyMWgZb2LhYlcavNcszgR
 7In6ift5SNySojCOfAV0iKZb8QUXWktLleY8kQ8jltOsSRTuO4PDfzvtCQDixUw4tQ7WLwDT
 qyUpot0oG03vtSG4LIRCdxI=
Organization: sigma star gmbh
Message-ID: <1bb381ec-1f5f-3844-d904-7dd2af58577d@sigma-star.at>
Date: Fri, 25 Sep 2020 05:15:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <64f36cbd-9ab5-1b37-c4b3-c33b5daf6df8@linutronix.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_231528_965185_F626BFB4 
X-CRM114-Status: GOOD (  12.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 9/24/20 6:40 PM, Bastian Germann wrote:
> Am 25.07.20 um 10:24 schrieb Richard Weinberger:
>> On Fri, Jul 24, 2020 at 10:00 AM <bage@linutronix.de> wrote:
>>>
>>> From: Torben Hohn <torben.hohn@linutronix.de>
>>>
>>> Especially for the pkcs11 engine, a configuration is required
>>> because the provider has to be configured.
>>>
>>> Its not clear why OPENSSL_no_config() is called.
>>
>> My best guess is because on old openssl versions it used to work.
>>
>>> Remove OPENSSL_no_config() and call OPENSSL_config(NULL)
>>> instead.
>>
>> David, can you please check whether this change works with all openssl versions
>> we want to support?
>>
> 
> Are there any news on this?
> 

Sorry for the delay. I did some research on this in August but being busy at
the time eventually forgot about the thread.

The latest changes that I found in the change log dated back to OpenSSL 0.9.7.
Walking through the git log for the implementation seems to confirm that.

However, recent man pages say, that the OPENSSL_config functions are deprecated
since OpenSSL 1.1.0 and OPENSSL_init_crypto should be used now, so the patch
might require an extra #if for newer OpenSSL versions.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
