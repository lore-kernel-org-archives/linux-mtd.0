Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EBBC3DA42
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jul 2024 13:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJTuEbMrb759jDUvJRQcyB0pXZs8rLuGtR41wJLl17A=; b=DiYQnHl8yAFQzB
	ZuJUPGiG7HDMjQ7RoKjmSIlHiANINboCzjnjuyRSaggnnBjLR1Bhd0+Zn8lK+8T6BlKuI1s6u33oS
	1NXW88JsANo0PL4Ins6Z6WjBNl2+O+Sz0GvEOTSjIds0/BHCavC+ldkID2CtBQaDeLZ8uF6ZvVSef
	GPYswNu+EzRM08sJ2QeofXypc56FVEsOQIZDSJnAitvmylw+FNqTUrBmgL8IqykU2X1dDMoqmuVnM
	+DTdwfbksxm5KirMZiWWRo3r7a76jkuHthXjRPbO/tnFSTiPt2ZcBqz2Pij3qeoRKRd0pl8PFOrKD
	kaa9hrXOEWa/RInEWR7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRXU2-0000000Afuc-3Tk4;
	Wed, 10 Jul 2024 13:35:46 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRXU0-0000000Afti-1zAJ
	for linux-mtd@lists.infradead.org;
	Wed, 10 Jul 2024 13:35:46 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 5D155A0E1D;
	Wed, 10 Jul 2024 15:35:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=ONej5SCahqjBap2i9K2K
	IncrdXGPjQBpSHbxrdrxP3Y=; b=iPEZVz/abMEJGGpAe6Cuv2vorbbtMmrBp8Vq
	V6jMk82ycMpNG/QzGCJ/MIiHcK1UICR5RQZHPWAsn3ABoRY99uk3ZN2uukhSbZ76
	d7bae7RjviGwkja4TEHc09HO3hWp2X/YnVlSLdqFus5gc7U06pB+usOBuKxv66UM
	Ke7jKQFBYIEwJMeKZSYd7BWKNsgKnrXx5L7RmkJtwY6/qE3vqoBnMKO6yix5VE7I
	hExaoLUwScjgBMlIrvdUw8RfL3yr5cW4VZGR4mcKAO5QSkSZUI+SYUwIoucc5K7W
	/UEH6w+BZLLcrDDyC6QUhjSpyfSSdBdPaPYu2UzVcLj+pSBgmsrp0g/He6WOTUJ9
	mlP0CzCYLK27cxfxyjDWvPx/weAT7ybCg3Mq+QmtY6IdrngTBKy3ZUPKUkV/Tjpf
	RgPMF7WsjydUSxWIgMBINSxweCzG3a6AJ/IVBHbfCD0ttNeCr/kP80tWQ54E7PTn
	8bvGx9Q9B+PsW4GO38yfNsvVtAtWSlJrpiWRlg5T26MSwLImnrIjcX/uKHv5xTqX
	0+hSANTZZaUXd3QKjF9PTNHkkmrNdcUG0+vgCSN1rOCs4vX22CI44eatTBfyo2ig
	w8bH9oFJ9gSseG3BKJsQc4Kd7hInM2W1t6gTKFLQ+B/8m8+nZAJ7kOfhERHiIIO7
	Hb8MCGY=
Message-ID: <5fe0e312-0844-4de7-8096-eae24361c0a4@prolan.hu>
Date: Wed, 10 Jul 2024 15:35:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: sst: Factor out common write operation to
 `sst_nor_write_data()`
To: Pratyush Yadav <pratyush@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, Michael Walle <mwalle@kernel.org>,
	"Miquel Raynal" <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20240710091401.1282824-1-csokas.bence@prolan.hu>
 <mafs07cdto0t9.fsf@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <mafs07cdto0t9.fsf@kernel.org>
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94854647461
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_063545_011272_D55C19EF 
X-CRM114-Status: GOOD (  20.29  )
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

Hi!

On 7/10/24 15:04, Pratyush Yadav wrote:
>> Notes:
>>      RFC: I'm thinking of removing SPINOR_OP_BP in favor of
>>      SPINOR_OP_PP (they have the same value). SPINOR_OP_PP
>>      is the "standard" name for the elementary unit-sized
>>      (1 byte, in the case of NOR) write operation. I find it
>>      confusing to have two names for the same operation,
>>      so in a followup I plan to remove the vendor-specific
>>      name in favor of the standard one.
> 
> Even though the operations have the same opcode, I see them as different
> operations. One is a byte program: it can only write one byte at a time.
> The other is a page program: it can write up to one page (256 bytes
> usually) at a time.
> 
> So I would actually find it more confusing if you use page program in a
> situation where the operation is actually a byte program, and attempting
> to program the whole page will fail.

Yes, SST engineers took some _unconventional_ steps when designing this 
family... However, there are no 256 byte pages in these chips. You 
either program it one byte at a time, or as a sequence of two byte 
values. So, in my eyes, that makes it a Flash where the page size is 1 
byte, and the vendor-specific write is something extra added on (and 
mind you, that's not a page program either, you just feed it an 
*arbitrary* even number of bytes, there really are no pages here at all, 
only erase sectors).

> Not directly related to this patch, but when reviewing this patch I
> noticed another small improvement you can make. [...]
> Here, we do a write disable. Then if a one-byte write is needed, do a
> write enable again, write the data and write disable.
> 
> Do we really need to toggle write enable between these? If not, it can
> be simplified to only do the write disable after all bytes have been
> written.

Honestly, I'm not sure, I was too afraid to touch that part. However, 
from the datasheet of SST25VF040B I presume that if we did not toggle 
it, then the Flash chip would interpret the 0x02 opcode and its argument 
as another 2 bytes of data to write at the end. Byte Program takes 
exactly 1 argument, so it can be followed by another command, but AAI WP 
goes on until ~CS goes high.

 > Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

Thanks!

Bence


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
