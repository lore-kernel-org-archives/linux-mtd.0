Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512A0C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Dec 2022 14:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CpR8gZZIMbhPaVZjykVWZii7oPoyLHZnnvaR55lJByI=; b=am8r3sJwFpoVYM
	8y35Q/AHHN5XpgFRkvtythlomDVgs2ZUDgLARMV/FBoFI1BJDMl2poZt+Uqx2FjgTqxqtY46I+mUO
	XuGiwdO35HFqM7YZOVaKiy3wrp+zQzox+frTfmQChvhM3SyawxhJ7FqsHF4YFaEMDV/97PEk5ZcTY
	x42EIpg4J1P1YWDiC58cgy4Q91/w0XaUhYRcdf5LxuT9zuTyvGe5D7OsMk2BYkUuElrC1UBeWcS44
	60LSqQOC7un7QsykTmf9jTzleIcLJnNt+dD5ekMhOcFQKZBeaDkcn4r2rW4OpTu2VbUfQkIax+Zln
	zoiUeLfFd280TAJkqo0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6BlX-00Ffrv-Oz; Fri, 16 Dec 2022 14:32:47 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6BlL-00Ffp6-KB; Fri, 16 Dec 2022 14:32:38 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 399DE85098;
	Fri, 16 Dec 2022 15:32:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1671201150;
	bh=YcZLu+PifMn6/LIs0eaXk/f/5yxHO5tGvNL/baVZmM8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jAdo0ae+D/tgrS7aMSIRbVQTQwA5TrltVH/OoPMpkOn3oF2ajFc+6pcHfGtLtLMvD
	 tZHhP9VIQJyqUE14DiYyhtIAI8YzszTLiMapqN+MzbMoySfntfI/eaVHc7L1Rnbw8a
	 M9TYA6qs6DgWLoA66u0/nAARWlGWLAevEi7lfiXrH+p3uhmWZOANgKMdWVVWAge8nv
	 Wn85qaBJb2E6I2DtRNOnzmJDfQzlsSDYugOTBQm/jj4Hq+g54qh1j17iDovtpHy2LV
	 H7/FYJJF2ntK9zetJqmBOVzM61rFJ+fud6V0Zys5lRzC3J1SCY9qEwZX9DMKVMXwOZ
	 bmsHguusLgzcQ==
Message-ID: <fb55a784-eda3-8916-1413-581b9436b3f2@denx.de>
Date: Fri, 16 Dec 2022 15:32:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is 0
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Francesco Dolcini <francesco@dolcini.it>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org, u-boot@lists.denx.de
References: <Y5wiAPvPU+YY39oX@francesco-nb.int.toradex.com>
 <6f5f5b32-d7fe-13cc-b52d-83a27bd9f53e@denx.de>
 <20221216120155.4b78e5cf@xps-13>
 <Y5xmi62hR6JeYUt1@francesco-nb.int.toradex.com>
 <20221216143720.3c8923d8@xps-13>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221216143720.3c8923d8@xps-13>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_063236_093249_484CD727 
X-CRM114-Status: GOOD (  23.29  )
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

On 12/16/22 14:37, Miquel Raynal wrote:

Hi,

[...]

>>> What?
>>
>> Let me rephrase, I was not clear enough.
>>
>>> Since when my proposal is breaking boards? My proposal leads to a
>>> situation where:
>>> - If you have a board that has an inconsistent description but worked,
>>>    it will still work.
>>> - If you have a board that has a consistent description and worked, it
>>>    will still work.
>>> - If your have a board that has an inconsistent description and got
>>>    broken *recently* by another change (typically you "fix" the DT in
>>>    Linux to comply with the bindings), then you get a warning that leads
>>>    you on the right path, you then update your bootloader if you can,
>>>    but either way you add your machine compatible to the list of devices
>>>    which need the early fix and your boot is fixed.
>>
>> This implies that we can proactively catch all the affected boards. I do
>> not believe this is reasonable and because of that my comment before
>> about creating regression to the users.
> 
> I really don't understand the reasoning here.
> 
> What I say is: let's fix the boards known to be incorrectly described
> when we break them so they continue working with a broken firmware.

The second part of the message, as far as I understand it, is "ignore 
problems this will cause to users of boards we do not know about, let 
them run into unbootable systems after some linux kernel update, and 
once they suffer through system recovery, make them add compatible 
string to the arch-side workaround".

> What regression could this possibly bring? I don't care about catching
> the 2k boards out there which work but wrongly describe their
> partitions. If they work, they will continue working.

Those boards would start failing once the Linux-side DT size-cells is 
corrected.

Also, this got missed in the previous discussion. If you use only board 
compatible string in arch-side workaround, the workaround would be 
applied even on systems with updated bootloaders, which is likely not 
what we want.

> You and Marek say: let's blindly always change a property in the DT, no
> matter if the board is broken, even if we don't know if this is the
> right thing to do, and apply this to the entire world.

As far as I can tell, if we have partitions in the NAND controller node 
and size-cells=0, then the right thing to do is to override size-cells 
to 1 , because partitions with size-cells=0 make no sense.

If the heuristics here needs to be improved somehow, let's discuss that.

> But with this approach you're not worried about regressions.
> 
> I am sorry it does not stand.

[...]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
