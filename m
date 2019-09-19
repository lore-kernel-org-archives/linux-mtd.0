Return-Path: <SRS0=PkFq=XO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2AF8C3A5A6
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 13:08:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CED121907
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 13:08:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="khFXBTHH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CED121907
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m7uShtZtdh22SKWURbU6Z3f4ZRCP/Y3c/4wcGU6sN+E=; b=khFXBTHH3LBeVI
	khbxsCZFG96ZBkef7YVPuEfmfQH/PXG1KUrg4MO4RKxRGoBCEwvrXEHCfL9RR+H8YgV7DpIBxoghY
	Vsik8sDYu5j1hc3Ux4BWNBa5l/Pm4eQCdyhMMMaBZdhn0Giumi2jpZMRyN5oHNMzEEb+DNxAiiHsd
	UCklOu/Q51MVSUCMZBnSCTlxKnbKwzkgqXiXIl9uildMP9TFVQ7OZ+3dCs2EMgWkauh9gn9U+lofW
	XNJNFUXHMDyAJzOxZwbBtWbmragWyI8ImpwUrxk/BicplT4zMr7Pi0sqz6qPm1eIcOduRxgX5SNU1
	KpvsJC2HgRzAegBwkrSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAwB4-00071z-03; Thu, 19 Sep 2019 13:08:54 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAwAf-0006oy-En
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2019 13:08:32 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id AC91718013A6F;
 Thu, 19 Sep 2019 15:08:27 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ju2Orax80o1h; Thu, 19 Sep 2019 15:08:27 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id onUqM0_kN6bP; Thu, 19 Sep 2019 15:08:26 +0200 (CEST)
Subject: Re: cannot ubiupdatevol squashfs image
To: Boris Stein <boris.stein@gmail.com>
References: <CAFkQurKLwUdGSPNPLYLTrV7-fkWaL5RuP9up0nrN62L4pr-ivg@mail.gmail.com>
 <CAFLxGvz5JipAzu1x_0EPX6v-SZgxtu6n3-gZZ=DQS4FLMH0XSg@mail.gmail.com>
 <bddc36a0-647d-e0d8-e1ca-501fd6522315@sigma-star.at>
 <CAFkQurLSN2XqRscBxONXyTYngbszRe3q8eFEtvB7qS+dtpG-YA@mail.gmail.com>
 <314ca09e-8fce-dc68-c159-58ab3cd29efe@sigma-star.at>
 <CAFkQurJnE5rFOHQ7fZHt-Cuz9j76_wYLo3tFrmv6r9rOD=6D2w@mail.gmail.com>
 <CAFkQurKgW7-2UnS7NTNH4j3MkjTBW3AoT3mBuuyYQP6BcUqe0g@mail.gmail.com>
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
Message-ID: <66b982ef-c446-e0e7-9d44-41597695dc72@sigma-star.at>
Date: Thu, 19 Sep 2019 15:08:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFkQurKgW7-2UnS7NTNH4j3MkjTBW3AoT3mBuuyYQP6BcUqe0g@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_060830_088661_8EF261CA 
X-CRM114-Status: GOOD (  13.51  )
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
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 9/19/19 1:54 PM, Boris Stein wrote:
> Hi,
> below are errors of unsquashfs for ubiblock.
> 
From your logs you seem to be getting the same errors as for mounting
the image.

> Is there anything else that can help debug this?
> 

Browsing through the last mail, saw that you generate the image with
the -noI option, which means that inodes are uncompressed. So they
could in theory be corrupted but still partially readable, leading to
accessing the data area at off locations or trying to access non existent
fragments.

Can you try it without the -noI option? If the meta data gets corrupted,
you should get an error about that before the kernel tries to access the


Could you try out the following, to check if UBI causes the damages to
your SquashFS image:

 - Create a fresh SquashFS image
 - Verify that you can also unpack the original image again without errors
 - Write it to ubiblock
 - Dump it back from the ubiblock
 - Check again on the dumped image
 - compare checksums of the original and the dumped image


Again, there are a bunch of non-standard messages in your kernel boot log.
Do you use any 3rd party out-of tree modules that could potentially be
interfering?


Regards,

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
