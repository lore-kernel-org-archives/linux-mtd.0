Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A47CC4345F
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2024 15:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sv7/En7LWvhNLRzfGC9lDC3qa4x3lSZiqw60U51AgTA=; b=ZJJ0a8lTMKfTnL
	zgSaYMrkd90s6E7BQDd10QvyJicXdxsMZ4IbqPHQxQT7tTI0Zx0wz6kukWfDiIJWZYfTD1LDXDerR
	fGxNzVegJA2bZY74Q05A/y3IOHdq6BmpK8/HPJkKwRRNyXT7zTqHLr2JrSUhkau8X6VrZtbMtx5IQ
	FaRwK13Yb6P+ytX5ytZOj0vOV0y7uoQmYlbCskMRxWEtCN+MJ1jOrDDm6Q616Dygyxef4hGP9Czzo
	d6tbo8nE311+H+HBLMNJlAUBPOoSoHWJp/X1TW1LlYUu57vV73l9+W9hNOE5BuqiCDCoF9GWFClu0
	yy0ciD0oNW6uKqq1U/SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx7MM-0000000GdWo-3t8q;
	Wed, 17 Apr 2024 15:38:06 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx7MK-0000000GdUr-10bh
	for linux-mtd@lists.infradead.org;
	Wed, 17 Apr 2024 15:38:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D6E9CCE13D2;
	Wed, 17 Apr 2024 15:38:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC56C072AA;
	Wed, 17 Apr 2024 15:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713368279;
	bh=mh2+5wpHchabfjbCTzG60AEhghAUqGqsxHVVQfQv3e8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mbkUZ1SS5u1kbyTwSgUOP9zj+xdYEzY/cTAOi0OJ1TkcG0MlHdReTLJSp7mVWQFWc
	 Vp2khz55PEh0uWXJV5vpI5kW9IY8zjQSY7M8onw5UhB2Uo12JIOWHCe/I0vwXIFtAw
	 0ttP+cyFVHPQ8kw00TKum3NX1J236sK0myUoxCWELqjxZHBoDthG7mjIRdsSXXwNqq
	 u5cLPKqo6iSxgH2n1shXWYS8F0KwbAppqJR1FhDXygWCqTw5axbbCjcerQmqRxAI1U
	 AE0EfhmaXbu5Fv0l3o/mOONbRK231SLmVKOqDqB+pyAqKrTZqZJCJ0og5q0gTvk0Vy
	 eFR7Jd1bnDabA==
From: Pratyush Yadav <pratyush@kernel.org>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Tudor Ambarus"
 <tudor.ambarus@linaro.org>,  "Miquel Raynal" <miquel.raynal@bootlin.com>,
  "Richard Weinberger" <richard@nod.at>,  "Vignesh Raghavendra"
 <vigneshr@ti.com>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v1 3/6] mtd: spi-nor: get rid of SPI_NOR_NO_FR
In-Reply-To: <D0MH78KYG87L.ETRH24X6MK6X@kernel.org> (Michael Walle's message
	of "Wed, 17 Apr 2024 16:43:15 +0200")
References: <20240412134405.381832-1-mwalle@kernel.org>
	<20240412134405.381832-4-mwalle@kernel.org>
	<mafs0sezk6rcr.fsf@kernel.org> <D0MH78KYG87L.ETRH24X6MK6X@kernel.org>
Date: Wed, 17 Apr 2024 17:37:57 +0200
Message-ID: <mafs0frvk6luy.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_083804_683528_58DA345F 
X-CRM114-Status: GOOD (  31.83  )
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

On Wed, Apr 17 2024, Michael Walle wrote:

> Hi,
>
> On Wed Apr 17, 2024 at 3:39 PM CEST, Pratyush Yadav wrote:
>> On Fri, Apr 12 2024, Michael Walle wrote:
>>
>> > The evervision FRAM devices are the only user of the NO_FR flag. Drop
>> > the global flag and instead use a manufacturer fixup for the evervision
>> > flashes to drop the fast read support.
>> >
>> > Signed-off-by: Michael Walle <mwalle@kernel.org>
>> > ---
>> > Please note, that the fast read opcode will still be set in
>> > spi_nor_init_default_params(), but the selection of the read opcodes
>> > just depends on the mask.
>>
>> Since that is the case now, might as well drop the
>>
>>     if (params->hwcaps.mask & SNOR_HWCAPS_READ_FAST)
>>
>> in spi_nor_init_default_params().
>
> I want to address that in another patch where I'll do that for all
> the opcodes. Just doing it for the fast read looks odd.

Okay.

[...]
>> > diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>> > index 072c69b0d06c..9aa7d6399c8a 100644
>> > --- a/drivers/mtd/spi-nor/core.h
>> > +++ b/drivers/mtd/spi-nor/core.h
>> > @@ -479,7 +479,6 @@ struct spi_nor_id {
>> >   *                            Usually these will power-up in a write-protected
>> >   *                            state.
>> >   *   SPI_NOR_NO_ERASE:        no erase command needed.
>> > - *   SPI_NOR_NO_FR:           can't do fastread.
>> >   *   SPI_NOR_QUAD_PP:         flash supports Quad Input Page Program.
>> >   *   SPI_NOR_RWW:             flash supports reads while write.
>> >   *
>> > @@ -528,7 +527,6 @@ struct flash_info {
>> >  #define SPI_NOR_BP3_SR_BIT6		BIT(4)
>> >  #define SPI_NOR_SWP_IS_VOLATILE		BIT(5)
>> >  #define SPI_NOR_NO_ERASE		BIT(6)
>> > -#define SPI_NOR_NO_FR			BIT(7)
>> >  #define SPI_NOR_QUAD_PP			BIT(8)
>> >  #define SPI_NOR_RWW			BIT(9)
>>
>> Move the other bits up since the slot is now free.
>
> Mhh can't decide what's better here. On one hand I'd really like to
> avoid too much code churn because it's already hard enough to follow
> the development using git blame. OTOH, a new flag would need to be
> added in between the existing flags. Not sure.. Or we if we run out
> of free spots at the end we might get rid of the free slots.

Filling this slot with the new deprecated flag should do the trick then.

BTW, -M and -C options for git-blame can help you a bit. They can detect
moved and copied lines, and look for the original one to blame. From man
git-blame:

        -M[<num>]
           Detect moved or copied lines within a file. When a commit
           moves or copies a block of lines (e.g. the original file has
           A and then B, and the commit changes it to B and then A), the
           traditional blame algorithm notices only half of the movement
           and typically blames the lines that were moved up (i.e. B) to
           the parent and assigns blame to the lines that were moved
           down (i.e. A) to the child commit. With this option, both
           groups of lines are blamed on the parent by running extra
           passes of inspection.

           <num> is optional but it is the lower bound on the number of
           alphanumeric characters that Git must detect as
           moving/copying within a file for it to associate those lines
           with the parent commit. The default value is 20.

       -C[<num>]
           In addition to -M, detect lines moved or copied from other
           files that were modified in the same commit. This is useful
           when you reorganize your program and move code around across
           files. When this option is given twice, the command
           additionally looks for copies from other files in the commit
           that creates the file. When this option is given three times,
           the command additionally looks for copies from other files in
           any commit.

           <num> is optional but it is the lower bound on the number of
           alphanumeric characters that Git must detect as
           moving/copying between files for it to associate those lines
           with the parent commit. And the default value is 40. If there
           are more than one -C options given, the <num> argument of the
           last -C will take effect.

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
