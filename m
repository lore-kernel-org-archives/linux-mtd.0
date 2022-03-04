Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB35C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Mar 2022 11:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0TACerEg4+WWAsgP2scbi2I6btVaZvw0P0HGQM7MTys=; b=O+sJWCoHxWdcar
	xx1C6oDCt3bZ6Kz36/PWAiDYyc1SjopPSGDxZn8/gmpcI05jPNWU6I4DyTMLQi4hahxltzmFznWHG
	5e2DPuJCVB2rt8dIGVYI+jO6xBhA4ZeN4x1PuOHP4VSKNlFoQPUdnN7alHDC94qa1AQ3hfOq6bTVn
	LPZecVIxAtDvMSXP9AcIGDLZV7/aFroaI8sDAYnvx7jkxcT7U4FeXAtHasQVYg3d84JV1UiTimYlZ
	Xy8w/jDY08fGlTDo/XxuSf51NC2GWSbKYitSdLefKFjZF4VOYOgIyJOGWx9hFVK53/4VKzgNESOqN
	tNpM7QB71sf+DbccJ2Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ5qi-009jBG-ED; Fri, 04 Mar 2022 11:11:52 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ5qb-009j81-FS
 for linux-mtd@lists.infradead.org; Fri, 04 Mar 2022 11:11:47 +0000
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1nQ5qW-0000S2-O5; Fri, 04 Mar 2022 12:11:40 +0100
Message-ID: <f9e46b61-37e5-a280-edb0-27f8e81a8680@pengutronix.de>
Date: Fri, 4 Mar 2022 12:11:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [BUG] mtd: cfi_cmdset_0002: write regression since v4.17-rc1
Content-Language: en-US
To: Tokunori Ikegami <ikegami.t@gmail.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 linux-mtd@lists.infradead.org, Joakim.Tjernlund@infinera.com,
 miquel.raynal@bootlin.com, vigneshr@ti.com, richard@nod.at,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linuxppc-dev@lists.ozlabs.org
References: <b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de>
 <dff2abcc-5813-2f2c-35ba-f03cd1f35ac3@leemhuis.info>
 <e11b76dc-5539-fb7e-da1c-a5005713d6b0@gmail.com>
 <3dbbcee5-81fc-cdf5-9f8b-b6ccb95beddc@pengutronix.de>
 <0f2cfcac-83ca-51a9-f92c-ff6495dca1d7@gmail.com>
 <b231b498-c8d2-28af-ce66-db8c168047f7@pengutronix.de>
 <66ee55d9-4f20-6722-6097-e53c2108ea07@gmail.com>
 <579eab10-594c-d6b2-0ddb-ea6ab8e02856@pengutronix.de>
 <cedb1604-e024-2738-5b33-15703a653803@gmail.com>
 <117facba-ba33-349d-1085-25315cc1ae92@gmail.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <117facba-ba33-349d-1085-25315cc1ae92@gmail.com>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_031145_612055_51A3FD2D 
X-CRM114-Status: GOOD (  28.11  )
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

Hello Tokunori-san,

On 20.02.22 13:22, Tokunori Ikegami wrote:
> Hi Ahmad-san,
> 
> Could you please try the version 2 patch attached for the error case?
> This version is to check the DQ true data 0xFF by chip_good().

I had a similar patch locally as well at first. I just tested yours
and I can't reproduce the issue.

> But I am not sure if this works or not since the error is possible to be caused by Hi-Z 0xff on floating bus or etc.

That it works for me could be because of Hi-Z 0xff, which is why
decided against it.

>>>>> What seems to work for me is checking if chip_good or chip_ready
>>>>> and map_word is equal to 0xFF. I can't justify why this is ok though.
>>>>> (Worst case bus is floating at this point of time and Hi-Z is read
>>>>> as 0xff on CPU data lines...)
>>>> Sorry I am not sure about this.
>>>> I thought the chip_ready() itself is correct as implemented as the data sheet in the past.
>>>> But it did not work correctly so changed to use chip_good() instead as it is also correct.
>>> What exactly in the datasheet makes you believe chip_good is not appropriate?
>> I just mentioned about the actual issue behaviors as not worked chip_good() on S29GL964N and not worked chip_ready() on MX29GL512FHT2I-11G before etc.
>> Anyway let me recheck the data sheet details as just checked it again quickly but needed more investigation to understand.
> 
> As far as I checked still both chip_good() and chip_ready() seem correct but still the root cause is unknown.
> If as you mentioned the issue was cased by the DQ true data 0xFF I am not sure why the read work without any error after the write operation.
> Also if the error was caused by the Hi-Z 0xff on floating bus as mentioned I am not sure why the read work without any error after the write operation with chip_ready().
> Sorry anyway the root cause is also unknown when the write operation was changed to use chip_good() instead of chip_ready().

I've be ok with v1 then. Restores working behavior for me and shouldn't break others.

Cheers and thanks again,
Ahmad

> 
> Regards,
> Ikegami
> 
>>
>> Regards,
>> Ikegami
>>
>>>
>>> Cheers,
>>> Ahmad
>>>
>>>


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
