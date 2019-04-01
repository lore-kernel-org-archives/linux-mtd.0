Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B86C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 06:40:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94FF420896
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 06:40:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KQgWvKR9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94FF420896
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=43OR7lskcsF9Ew4LQp53q6gyQNKYZBrC5dyM3kN9qhM=; b=KQgWvKR9AOnefmzevhqK89JnIY
	K2Ed0DLzW4BQpdZpdbVu/VaT5b3VIgge8+jFUfRPP0ptTG28ISWzQLuogJ/vOBS5Iw30Q/HIBmfn2
	NIf4YCLHKupRBIYSR2RGw7JQ1u7M4nvFKMTCXefwZCVsorMqBbPNiEChWaE6xBHHmk4ueiVxD92SI
	j9ksJY5cb/Pt75uMtuZPxLZYzCYorZJ2uEIFUL9O/TvGsQ6ricEng0MSjMsRH/Zqc4CFuqAdrTg8j
	hH/V9QHULKj8ENZFjO29vKID/pljifiV1Sjsg3p91OktybfWoVOQ6LL31SILK5IwrNgqgYPZFy7vu
	/+qA/ksw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAqco-0006Ug-Do; Mon, 01 Apr 2019 06:40:54 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAqck-0006IC-RH
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2019 06:40:52 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id A5CD318011A69;
 Mon,  1 Apr 2019 08:40:46 +0200 (CEST)
Subject: Re: mkfs.ubifs issues with mtd-utils 2.1.0
To: Markus Mayer <markus.mayer@broadcom.com>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>
References: <CAGt4E5tYNVD5n7QmYOpCQs3SOG7w0qJrk9LikQ9NDR5G3QoyCQ@mail.gmail.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Openpgp: preference=signencrypt
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
Message-ID: <f6ee3da1-0f1a-fa36-c2b7-438c7f1b7d26@sigma-star.at>
Date: Mon, 1 Apr 2019 08:40:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <CAGt4E5tYNVD5n7QmYOpCQs3SOG7w0qJrk9LikQ9NDR5G3QoyCQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190331_234051_174245_04842173 
X-CRM114-Status: GOOD (  15.70  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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

Hi,

On 3/30/19 4:43 AM, Markus Mayer wrote:
> The code that's complaining:
> 
> ./ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
> 1533         if (data_len) {
> 1534                 if (!S_ISLNK(st->st_mode))
> 1535                         return err_msg("Expected symlink");
> 
> Clearly, checking just for symlinks at this points seems to be too
> restrictive. /dev/console is a character device, and there is no
> reason why mkfs.ubifs should refuse to create it. After all, it has
> always worked in the past.

This check was introduced in "a767dd30 mkfs.ubifs: Add encrypted symlink support".

This commit is part of the fscrypt patch set. A few lines below, the extra data is
encrypted with the path encryption functions if there is an fscrypt context.

Given that having device files on disk outside an initramfs is a rather rare thing
nowadays (devtmpfs), it appears we unfortunately didn't think of that case and
tests subsequently didn't cover it either.

> Since I am not entirely sure of the purpose of the check, I am also
> unsure what solution to propose. Would
>     if (S_ISREG(st->st_mode)) /* error here */
> or
>     if (S_ISREG(st->st_mode) || S_ISDIR(st->st_mode)) /* error here */
> be sufficient? This would allow links, character & block devices, sockets, etc.

A quick and dirty fix would be to move the check into the branch where the data
is actually encrypted.

However, the question remains what the fscrypt branch should actually do with
a device number in this case.

If the user space tooling made the implicit assumption that it must be a symlink
if it has extra data, chances are that the corresponding UBIFS kernel patch set
makes the same assumption.

Thanks for reporting this,

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
