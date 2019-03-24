Return-Path: <SRS0=La3s=R3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 095BFC43381
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Mar 2019 19:25:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBAE22082F
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Mar 2019 19:25:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DqpFlOFn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="I6jCsDTR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBAE22082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CYYiaF4hXhAlTfonL+MvdFMvSTxaixmSNEYXRBiym4k=; b=DqpFlOFnBJBPzm
	nN7TETP6B+5Aqfvz/IxEoE4YmoEiw6zIjCZTHMgECmalFt9aZWn9W+DwBFJeUXBJnUpoe0MIAk9Ei
	U4Iyux0dTpxJVDgZUatkYlkPkjEUrdyCwsqdoJVZpxWkyVV9DaffBrYwEqB2qPcTeqQBh6kgU711e
	dy9omr4jbWXmzuEoxlPpHWEz09gZu9BaB8SdXwpECyy9uSlguo0zfN91q9or70EIk8RdmcmglS5N7
	T/Iq/s2nG9KTTxT2fYjrWj3T1Ub6OiG8J2QIMJSUrA0I4eP+TK8rQN4AXQqh9YpePhwCxNr4HqSOG
	V1uZkQHBJoSOGDXHfv6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h88k5-0000o8-4S; Sun, 24 Mar 2019 19:25:13 +0000
Received: from mo6-p01-ob.smtp.rzone.de ([2a01:238:20a:202:5301::11])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h88k0-00081x-CN; Sun, 24 Mar 2019 19:25:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1553455495;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=dQpcJP7nbmXkv0hXgpaBl53aoMKq+rqyM784zpn+Aok=;
 b=I6jCsDTRh8oJY1JB22hUjejR2g9xcXiFksibda/xtTcPwzNd7GUnuzCAP49sQWISFT
 aRrX+JrTD13KAqOoB/XNHkVdCZZrNn6VGYQZTUREhOyNySkqVNRVO0RA/Roj4wt4Er/8
 CseNr4SJp4tUUWABwaSqFQHPhFzp3Er0LnsEgC8+kySqIoyYDcgIfW5gBHlYcMIjqdw5
 WvSN03WUuQPtiwsQ7DSoPn+hPMHp2X9baYDUt2TUHWq8CjPLVJyiGsAFmsXx0tHvhNC0
 3I6sq1bxSXd/sBLJeEJEYIvGe9Btz99Ve1KCc2PYCQhC8SkSrcIxC4lHJCeT606haZQf
 3AHw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qOxWRk4dCz0tZcku5gKwXbfhDpgJ3gm7d6hM8dy3p83sn1i"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2001:16b8:26a9:3300:bc12:60ce:f8a1:9f77]
 by smtp.strato.de (RZmta 44.16 AUTH) with ESMTPSA id h04075v2OJOn2rG
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH
 bits, eq. 15360 bits RSA)) (Client did not present a certificate);
 Sun, 24 Mar 2019 20:24:49 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH] mtd: rawnand: ams-delta: Drop board specific partition
 info
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20190324185932.GA24594@darkstar.musicnaut.iki.fi>
Date: Sun, 24 Mar 2019 20:24:48 +0100
Message-Id: <454BF5C9-478A-4E2A-BF00-D2A2AFE25C45@goldelico.com>
References: <20190319223718.26131-1-jmkrzyszt@gmail.com>
 <20190320011630.GB7872@darkstar.musicnaut.iki.fi> <2631901.52Nzq63B5o@z50>
 <20190324185932.GA24594@darkstar.musicnaut.iki.fi>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>
X-Mailer: Apple Mail (2.3124)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_122508_577504_3F659CA0 
X-CRM114-Status: GOOD (  15.12  )
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
Cc: linux-omap <linux-omap@vger.kernel.org>,
 Boris Brezillon <bbrezillon@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

> Am 24.03.2019 um 19:59 schrieb Aaro Koskinen <aaro.koskinen@iki.fi>:
> 
> Hi,
> 
> On Sun, Mar 24, 2019 at 05:48:22PM +0100, Janusz Krzysztofik wrote:
>> Hi Aaro,
>> 
>> Thanks for your review.
>> 
>> On Wednesday, March 20, 2019 2:16:30 AM CET Aaro Koskinen wrote:
>>> On Tue, Mar 19, 2019 at 11:37:18PM +0100, Janusz Krzysztofik wrote:
>>>> After recent modifications, only a hardcoded partition info makes
>>>> the driver device specific.  Other than that, the driver uses GPIO
>>>> exclusively and can be used on any hardware.
>>>> 
>>>> Drop the partition info and use MTD partition parser with default
>>>> list of partition types instead.
>>>> 
>>>> Amstrad Delta users should append the followig partition info to their
>>>                                        ^^^^^^^^
>>> Should be "following".
>>> 
>>>> kernel command line, possibly by embedding it in CONFIG_CMDLINE:
>>>> mtdparts=ams-delta-nand:3584k(Kernel),256k(u-boot),256k(u-boot_params),\
>>>> 256k(Amstrad_LDR),27m(File_system),768k(PBL_reserved).  For their
>>>> convenience, select CONFIG_MTD_CMDLINE_PARTS  symbol from that board
>>>> Kconfig automatically if this NAND driver is also selected.
>>>> 
>>>> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
>>>> Cc: Tony Lindgren <tony@atomide.com>
>>> 
>>> Could we move the fixed partition setup to the board file
>>> instead? Otherwise this kind of change is not really nice for the users,
>>> as it will likely break existing setups. The default partition layout
>>> should remain the same.
>> 
>> I'm wondering if it would be acceptable to pass partition info from a .dts 
>> file.  I think that would be a better, more modern approach than adding a new 
>> header under include/linux/platform_data.
> 
> Hmm, I thought there was some generic way to define partitions without
> adding any new headers. But if that is not possible, then I guess your
> CMDLINE proposal is the preferred one..

I am not sure what you exactly need, but partitions can be defined in
the DTS as children of some NAND drivers. Example:
arch/arm/boot/dts/omap3-beagle.dts
So this design pattern could be copied instead of using CMDLINE.




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
