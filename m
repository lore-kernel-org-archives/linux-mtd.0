Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC30C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Mar 2022 09:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUGRIq8TY3FVR6zz3vCWtuSDDjfVc6huwx8zG3Ixwxo=; b=kAkm36iKh1h4bTsTOdTTX/7ZF3
	cVSUSD6fVjorBQa5hP93PpspPOy1NCcgUzWI/C6e1O6p1e4vGEtcvu99ctykjomLjlVg6qZGBO4xG
	sHFRhqX+MECS3k78Bd8aMXhxSIYIP4ePxaUKE3hKMYGeuPl83zIf0CY74BFOgUg4Hm/8ORj4NoikG
	wJrIdjGJmed6x3fzogteclD3N4cs4yVSrRdLGOJ3pvthmafbPBxT5ekmnLkXJ1R0T6uPbssbI0Fyz
	3qh9nJMEb3g+upunNFEMxKMvbfW41eyL8JEyaYtFK4NnWNEqEEDfP7Cx/fm72hLUYfVO6iVUUbg67
	f4h4cQJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUmcI-00FYc8-Gb; Thu, 17 Mar 2022 09:40:22 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUmcF-00FYaB-BC
 for linux-mtd@lists.infradead.org; Thu, 17 Mar 2022 09:40:21 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id B90C922205;
 Thu, 17 Mar 2022 10:40:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1647510012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3YY8iZyql6fnlwbWAZYCthFDHvjrUsi7DJn+/6RWY3U=;
 b=H3UJKxZUkmQV66/WBe2+l30zDYM408fqT/zyOQz7dqX1nFTWMvyn2sgi4jkhi7gSYqEidP
 /hgLJkpKsJQjDMWZdMEyEd9453jaJsq1Cy/cN7Qh9TgNJ+H92fjv/el6jPps+C/HvnTz3z
 2qdnxQeW40yNLFEKKP7sTFETWbpRqbE=
MIME-Version: 1.0
Date: Thu, 17 Mar 2022 10:40:09 +0100
From: Michael Walle <michael@walle.cc>
To: David Laight <David.Laight@aculab.com>
Cc: 'Vignesh Raghavendra' <vigneshr@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, p.yadav@ti.com, broonie@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 nicolas.ferre@microchip.com
Subject: Re: [PATCH v2 0/6] spi-mem: Allow specifying the byte order in DTR
 mode
In-Reply-To: <9bc530d1fdaf4490a00fee150f963ac7@AcuMS.aculab.com>
References: <20220311080147.453483-1-tudor.ambarus@microchip.com>
 <76eb13b6-9263-975f-3196-312259634301@ti.com>
 <b60064231d33581c20279172cf8f765e@walle.cc>
 <0f271365-354b-82e2-02a2-9d69a6ac85b1@ti.com>
 <9bc530d1fdaf4490a00fee150f963ac7@AcuMS.aculab.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <bc2083a8903fdabc65083f7e5232ca2d@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_024019_557203_671F6572 
X-CRM114-Status: GOOD (  22.82  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Am 2022-03-16 14:55, schrieb David Laight:
> Thought...

Thank you for your proposal.

> Can you read the device in STR mode until you get a suitable
> non-palindromic value, then read it in DTR mode and dynamically
> determine the byte order?
> 
> Clearly this won't work if the device is erased to all 0xff.
> But a check could be done on/after the first write.
> 
> I suspect write times are actually dominated by the time spent
> waiting for the write to complete?
> (Never mind the earlier block erase time.)
> So always writing in STR mode probably makes little difference?
> Writes really ought to be uncommon as well.
> 
> Speeding up reads is a different matter - and probably useful.
> 
> Of course, if you've got hardware reading the spi memory in DTR
> mode for config data you might need to byteswap it (compared
> to the STR writes) - but that is probably a 2nd order problem.
> 
> I've got some bespoke logic on an PCIe fpga for accessing spi memory.
> Uses address bits for the control signals and converts a 32bit
> read/write into 8 nibble transfers to the chip.
> (uses byte enables - don't an odd number of clocks.)
> mmapp()ed to userspace for updating the 6MB fpga image.

Our problem is not how to detect that we have to swap it, but
rather what we do when we have to do it.

If we have a controller which can swap the bytes for us on the
fly, we are lucky and can enable swapping if we need it. We are
also lucky when we don't have to swap the flash contents, obviously.

But what do we do when we need to swap it and the controller
doesn't support it. We could do it in software which will slow
things down. So depending on the use case this might or might not
work. We can degrade it to a speed which doesn't have this issue;
which might be 1-1-1 in the worst case. We could also do just
nothing special; but this will lead to inconsistencies between
reading in 1-1-1 and 8d-8d-8d.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
