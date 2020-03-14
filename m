Return-Path: <SRS0=TiS6=47=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8836C0044D
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Mar 2020 14:49:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F1A32076A
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Mar 2020 14:49:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PYFrjhxA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F1A32076A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:Subject:From:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=elnxEGOv3ish7WMt89jgaLKlbXTH32xDtVm9XSM7sYU=; b=PYFrjhxAhSfQ9Q
	Pc1krL2yVz6n4fOOOh7UAmADOtN19KUw+jpdQi7jzRyT4bpCswHN2BwVaxMfvlRqXih9DANzpHm1V
	D8UMSzX6AZ8J38DuBWEKVkwJ1HJO3C+CdfLr7BCDiQNuclot/02qq7InOwPuATUxEtGeU6/dsU02N
	g+IoMvT/yUGMQ+Sl/ZhLGzGFQHKrym6zy72nb9PBf7hfmFvS+9i5WboJwgcZy+1tM2bM39UZPYavF
	vXNVHQvcFzT6cAFUvsv0vLPLOuizGCpPhK78U8teidfua+bwE2x/ehxhewJnpRodQTGjpAQ0EfbZE
	9R8eN1CnA1NQzSHHvX7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jD86h-0007Ng-Pb; Sat, 14 Mar 2020 14:49:43 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jD86e-0007N2-Kj
 for linux-mtd@lists.infradead.org; Sat, 14 Mar 2020 14:49:42 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48flp70pdNz1qrf4;
 Sat, 14 Mar 2020 15:49:34 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48flp66QYhz1qs9S;
 Sat, 14 Mar 2020 15:49:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id tJEY-46AaVFc; Sat, 14 Mar 2020 15:49:33 +0100 (CET)
X-Auth-Info: Yz+HJBIg/H0sxK32O27DNWS3rrwJ+pmURdtz/Yah8L4=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sat, 14 Mar 2020 15:49:33 +0100 (CET)
From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] Revert "mtd: rawnand: denali: get
 ->setup_data_interface() working again"
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20200205070834.3087104-1-marex@denx.de>
 <20200211170707.2183625e@xps13>
 <b1a10583-e110-9568-4007-aa2b3f38a7be@denx.de>
 <CAK7LNARqYDh4AJ+N-PTHui0H89-humECskJVUxW4cTf6edEBMQ@mail.gmail.com>
 <f4e2deeb-cc0e-fb06-46fa-d6cf4f2a73ad@denx.de>
 <CAK7LNAR4MU+Rfmpz99iwLuEbD4jMwUdh91uz3zyQdvjyLEQcMQ@mail.gmail.com>
 <29cce21c-2214-7238-0bc5-db2c1a54576f@denx.de>
 <CAK7LNASckTZO-9uVjtQH8iKhU0HH9WiMK-CzMxjESQOOUM0cKA@mail.gmail.com>
 <CAK7LNAT3EG0XocC0xT0f=6MBpXLga3FehOjEYbRyP6AJUbqb2Q@mail.gmail.com>
 <311cdc3c-59b5-a46b-62f0-e78fc970134a@denx.de>
 <CAK7LNAT1Bzs68X8PiWQHg4g2bpPGd-WM9D4vwf59XfwwLVuVQQ@mail.gmail.com>
 <e86925d0-805c-d364-57ca-6400b77cffd7@denx.de>
 <CAK7LNARDp1Zru3_XAQyBZHwsRov-QWOnrrwodS8pjszsKy2ysw@mail.gmail.com>
 <d4b4abf4-1af9-d57c-5b93-2d56a5dc456b@denx.de>
 <20200311140807.6f56baf3@xps13>
 <5fa809a3-cd2b-74de-3615-387232051ae2@denx.de>
 <20200311143302.309bf468@xps13>
 <aaec50bb-05da-8d4e-3e15-17fbfeb52f68@denx.de>
 <20200311153923.443f3e64@xps13>
Message-ID: <45157038-8309-3c00-3019-a1c7afc059c0@denx.de>
Date: Sat, 14 Mar 2020 15:48:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200311153923.443f3e64@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200314_074940_983109_2A9F1E4E 
X-CRM114-Status: GOOD (  28.97  )
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
Cc: Dinh Nguyen <dinguyen@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Tim Sander <tim@krieglstein.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 3/11/20 3:39 PM, Miquel Raynal wrote:
> Hi Marek,

Hello Miquel,

[...]

>>> I checked the denali driver and indeed u-boot should not be much clever
>>> than Linux. Are the differences significant? The code is so close, you
>>> can probably check why you have differences. Also verify that the same
>>> ONFI mode is used.  
>>
>> It might've made sense to check those driver differences before making
>> such an statement ;-)
>> That said, I don't think either U-Boot or Linux uses the ONFI
>> information for this NAND, but I might be wrong.
> 
> I don't know what is the exact device but most of the time, even for
> non ONFI-compliant chips, the core starts talking at the lowest ONFI
> speed (mode 0) and then negotiate with the NAND chip the actual timings
> to use. This works if get/set_features is supported, otherwise you
> might have a default mode somewhere. Is it the same in both cases? Does
> the core tries to apply the same timings? Is the calculation the same?
> 
> These are pointers but I am sure you can figure all that out.

The calculation is obviously not the same anymore, due to the recent
changes in the Linux driver, which seems to have broken it (in Linux).

>>>>> and
>>>>> may optimize better the timings depending on the selected mode ([0-5])
>>>>> (hence the different calls to ->setup_data_interface().    
>>>>
>>>> I would expect those two should produce identical timing parameters,
>>>> period, otherwise one or the other is wrong. Thus far, it was Linux that
>>>> produced non-working results.  
>>>
>>> Again, we define minimum and maximum delays. If the right thing is to
>>> not wait more than 5us and you wait up to 6, it does not mean you
>>> wrote "bad timings". 4us would be a bad timing though. It depends on
>>> what you are looking at.  
>>
>> I am look at for example
>>
>>  denali->reg + TCWAW_AND_ADDR_2_DATA = 0x0000143f -> 0x00001432
>>
>> Register was 0x143f before, now is 0x1432 , which is less.
>> I guess that would be the "bad timing" then ?
> 
> Well, is it a minimum or a maximum ? How do you know U-Boot value is
> straight on the edge? If you want to know if timings are valid, open
> the part datasheet, do the math with a paper and compare. This is the
> scientific way to declare timings valid or invalid.

If the value were straight at the edge, I would expect this would
trigger errors over the years, when those values were used, or maybe it
would trigger an error in the thermal chamber tests ? If neither of that
happens, then the values are probably not at the edge enough to matter.

That said, timing calculations do not factor in only the datasheet
values, but also signal propagation delays and other details of the data
path on the PCB and in the SOC, so it's not as simple as you claim it
is. Moreover, while the NAND datasheet is available in public, the
Denali IP datasheet is not, so "do the math with a paper and compare" is
inapplicable here either way, sorry.

>>>>> Run a stress test, if it passes, you should be good :)    
>>>>
>>>> Thank you for the hint, I think the stress test thus far could be
>>>> considered sufficient. I guess we can agree on that ?  
>>>
>>> Oh yeah absolutely :)  
> 
> Just to be sure, we are talking about the new timings derived with
> Masahiro's patch in Linux here, right?

The timings which went through extensive testing are the original ones.

The ones coming out of Masahiro's patch at least do not trigger those
massive UBI errors, however they were tested only very lightly. And I
feel like adding +1/-1 somewhere into the patch is rather iffy, so I
would hope the Denali datasheet has something about this and why this is
needed.

> Because "perfect timings" => "work in the oven" but let be clear on
> the fact that "work in the oven" does not imply "perfect timings".

Let's be clear that I still prefer "practically working and possibly
imperfect" over "theoretically perfect and practically not working".

Also, correction, thermal chamber is not an owen, it does testing over
the entire temperature range of the device.

-- 
Best regards,
Marek Vasut

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
