Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696AFC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Apr 2022 10:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oefnHdiUv+fomBVwJp++WHy/82CLcoxEtmsc3L0ox6c=; b=2ezErQto2o/lSx2kdhIoiYRgik
	H5dpDkLCp0shtZ/nD5SluD3Ob9L8sUgjkCeuUJ+C3WQQyGamS95HCLmUEe05aIZNOkmE9MzNF8bTo
	lY3GHR8lnUik/SpP9k3WIRcyHUN832z6q3ckZ1TucA8eezElIMNgPVtAd+KOW+HVjQFnoH4puAjnO
	bQFEJJQGIDzjDZ5RX3zL2HaDhnpIZoSTs5wYp2+Dzfjuxp5hAUrCQeOrItMtFmkBP3Geh3VpuzcpC
	L3GtisE3gnJ70B7lViF66DB3IFaRQfiXRKoq4lAVHvOSqgnHlXwl8hLs4E4RHVV6eEqppjOuxdocJ
	oUIyH9rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc34X-005SMV-9z; Wed, 06 Apr 2022 10:39:33 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc2wk-005Ojq-2r
 for linux-mtd@lists.infradead.org; Wed, 06 Apr 2022 10:31:32 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 9A43922238;
 Wed,  6 Apr 2022 12:31:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1649241082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=teRjar+QxUq3g1wf45P3zQIoOzFA3FHoJkTKj33N6VI=;
 b=B3ohjPB3uUOpuA+Cx2WNqILMHe80lLNb4or7/isCZTcTXr0NobDkMaYjPWcXcb+zG7wA29
 U5/VwKQuSBZRMpZbVh4Qle3XWk4EToIwtV9E6G6CjL59OTpPS8zOlb5DJnE5zjxVKqwxYL
 Tq93ygyKkXDSYCpfnmFTllqKPDat3Fo=
MIME-Version: 1.0
Date: Wed, 06 Apr 2022 12:31:22 +0200
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Tudor.Ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Nicolas.Ferre@microchip.com
Subject: Re: [PATCH v2 4/4] mtd: spi-nor: sfdp: Keep SFDP definitions private
In-Reply-To: <20220405193111.pnekaivbsj7hronp@ti.com>
References: <20220309144215.179449-1-tudor.ambarus@microchip.com>
 <20220309144215.179449-5-tudor.ambarus@microchip.com>
 <20220401200133.gyyvoe7xdbsww7cv@ti.com>
 <ed093fa5-b514-b0a6-166f-ecf117582b0b@microchip.com>
 <20220405193111.pnekaivbsj7hronp@ti.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <1fa079c4a0341ffe6ad7bdebd3cb8958@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_033130_353252_6B0FBE6B 
X-CRM114-Status: GOOD (  21.39  )
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

I didn't follow the series closely, so I might miss something.

Am 2022-04-05 21:31, schrieb Pratyush Yadav:
> On 04/04/22 06:19AM, Tudor.Ambarus@microchip.com wrote:
>> On 4/1/22 23:01, Pratyush Yadav wrote:
>> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>> >
>> > On 09/03/22 04:42PM, Tudor Ambarus wrote:
>> >> Keep the SFDP definitions private and expose just the definitions that are
>> >> required by the core and manufacturer drivers.
>> >
>> > I am not so sure about this. Since the post_bfpt hook passes in the bfpt
>> > table to flash drivers, they might end up wanting to use these for some
>> > checks like issi.c does for DWORD 1. They would have to move them back
>> > to sfdp.h for that, which just causes extra churn, and also puts some
>> > BFPT related defines in sfdp.h and some in sfdp.c.
>> >

It's not the extra churn, but also git blame doesn't really work. In
fact, it is already really hard to follow all the commits in spi-nor/
with all the code moving around. So what is the actual adavantage of
having this stuff private? One clear disadvantage is that you need to
move it from sfdp.c to sfdp.h once you need it. And potentially, you
might need all the defines.

Also, if you pass the SFDP data to any fixups, the drivers are expected
to use them.

>> That's correct, but I think exposing just the public defines in sfdp.h 
>> is
>> the path to follow. We should keep private all the definitions that we 
>> can
>> private in sfdp.c and expose publicly in sfdp.h just the ones that are 
>> shared.
>> Flash collisions, and implicitly the need of public SFDP definitions, 
>> should be
>> an exception, so I expect sfdp.h to be short in size.
> 
> I disagree. I think we should keep everything in the same place. And
> since we need to expose this to manufacturer drivers, that place is
> sfdp.h. Who is going to cast the tiebreaking vote here? ;-)

I'm leaning towards Pratyush opinion unless there is a clear advantage
to move the defines.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
