Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79808C04FFE
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2024 14:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g4cebk6s+WSRbSWQRTuinAtOXSKJWvQB1CKowfiKWvk=; b=qTcYxb7sESC7HO
	IVaB5kRniRMteb5ecYMVrnp5qEYBZ4b23z6sB0YLd+rmpYiaD3zf6XVfSf7AP/3VotEacYkr0WLSb
	xxOjBtLVOJ0qH0FxxTABol2+YZd9bjCYlDB72n2OChhXaj3dKN8cVWxEbOVOT6C+e3pj3n0Bp3k5+
	RJ/7jDGiqftA2CQvNBhOSlpZR09FF1lA6aMQvWThmojlURV7ZI1zFREOZtFTqsZRCvf3lxcK3P06z
	PNBeP5DhMXsVdUfze/I06Ejqm6APcxt5+26nv8jffRpSLduIwh2xFbsVVofUPU5yN0O3wnbVlK301
	NrJ+PNipkxmoDkOcEo5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SDE-00000003A60-2KX6;
	Mon, 29 Apr 2024 14:42:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SDC-00000003A5D-26ty
	for linux-mtd@lists.infradead.org;
	Mon, 29 Apr 2024 14:42:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CE63060DE7;
	Mon, 29 Apr 2024 14:42:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00776C113CD;
	Mon, 29 Apr 2024 14:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714401753;
	bh=T92NaU3ReD2/fnkEdWIwmoqOz2RSZmJeMWeVVAK+yE0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bjWpkTwD4eSDfStdQ1m4FdYpmAfjLkv6d5qNjnFzJ9phi9VYM10Nk//w7uYFzEmn2
	 nisxDg74vLHcvnLH+wPZ+uZs4p4EDLnLsjS2PuecadJQDfocMbY6HEyd01P+9pCHvN
	 aWSKiF8dBZlqMNtn5sq0AgruXic/1Vwps0NUtUH/QyO46vDdr1h6iUD0xPOHBa7dcm
	 V5gdxm/+DxaMdTKU6+E4jLoaRYWSsdOqCZA07pX8SuCfZi3tk7HIbOeOyyymQsiUQq
	 E1DlNmF1c9Mrpv+gl1JfRiPe5IrGdXHzp++RsEEvi4ts7FuR0k5/NxUdG+UZ13r4Ju
	 9EnpLHc8YMOIQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Tudor Ambarus"
 <tudor.ambarus@linaro.org>,  "Miquel Raynal" <miquel.raynal@bootlin.com>,
  "Richard Weinberger" <richard@nod.at>,  "Vignesh Raghavendra"
 <vigneshr@ti.com>,  "Dan Carpenter" <dan.carpenter@linaro.org>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: replace unnecessary div64_u64() with
 div_u64()
In-Reply-To: <D0WNIVK1DBL5.3KQOD1K2O128P@kernel.org> (Michael Walle's message
	of "Mon, 29 Apr 2024 15:47:13 +0200")
References: <20240429121113.803703-1-mwalle@kernel.org>
	<mafs05xw0cn8v.fsf@kernel.org> <D0WNIVK1DBL5.3KQOD1K2O128P@kernel.org>
Date: Mon, 29 Apr 2024 16:42:30 +0200
Message-ID: <mafs0mspcb57t.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_074234_652111_9234DFA4 
X-CRM114-Status: GOOD (  19.54  )
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

On Mon, Apr 29 2024, Michael Walle wrote:

> Hi,
>
> On Mon Apr 29, 2024 at 3:27 PM CEST, Pratyush Yadav wrote:
>> On Mon, Apr 29 2024, Michael Walle wrote:
>>
>> > Both occurences of div64_u64() just have a u8 or u32 divisor. Use
>> > div_u64() instead.
>>
>> Does this improve performance or is this only for correctness?
>
> See function doc for div_u64():
>
>  * This is the most common 64bit divide and should be used if possible,
>  * as many 32bit archs can optimize this variant better than a full 64bit
>  * divide.

Thanks. I think it would be good to add this to the commit message:

    Both occurences of div64_u64() just have a u8 or u32 divisor. Use
    div_u64() instead. Many 32 bit architectures can optimize this
    variant better than a full 64 bit divide.

No need to resend, I can do this when applying.

>
>> Patch LGTM otherwise.
>>
>> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
>>
>> BTW, I also noticed that there is a do_div() call in spi_nor_write()
>> that also uses a u64 dividend and u32 divisor. I was wondering why it
>> uses do_div() and not div_u64() (I am not sure what the difference
>> between the two is) but I suppose it doesn't matter much since your
>> spring cleaning series will delete that code anyway.
>
> do_div() is a macro and is modifying the dividend in place, whereas
> div_u64() will return it. do_div() is using u32 for the divisor
> anyway.
>
> -michael
>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
