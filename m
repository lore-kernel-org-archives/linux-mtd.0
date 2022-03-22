Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA3D6C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Mar 2022 02:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lFvmf9/VQvaPyYaSbC4fGajDrdnOmJ+xTVc6TXbd2FQ=; b=cl/CNP0ZuyM59w
	ra2SLFB4ztmSnDQxaOcDEM4ULCwkiuK6GlM7gy5VY2U5oNNDDHLXYJiV6WwoRIPjHh/kZ6I3jnkqT
	EijL+2c15gzeyveielk42NaZYtWZitK/pRn8GK+7Eik3vMsg094W36us4M2ygi+QUmpQp2iQMvT00
	rg5gAgHP9pdEyPlOoJEfcToX3eWXPikw/LPDrBmB2eYOijtjbmkQfrgep3lclYCrONnM5s/UPikCt
	sJe/WxAYF527KwqdmIZ/Z0CVku0J+wIineMbmX31xfAwOHi/18zfYpd/TmbjYRthLG5q2jg+awFj5
	W7vLbbhjsirOSG1Q2Eug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWUcz-009mt3-DE; Tue, 22 Mar 2022 02:52:09 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWUcu-009mrw-Oa
 for linux-mtd@lists.infradead.org; Tue, 22 Mar 2022 02:52:07 +0000
Received: by mail-pl1-x62d.google.com with SMTP id q11so14303821pln.11
 for <linux-mtd@lists.infradead.org>; Mon, 21 Mar 2022 19:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=O/lcliIRAqwQlRYKUGRfUd2XRkTPCUiR7gECDUV4FEY=;
 b=YU6zU9YL37l1mwH4e94vDklKtGIzfYQj1Qyd7OcP8FDDEfeK1UlFvhnpzzWr2bMN0V
 aMHGonYaQ0WSXqrf8zQmYKUmWvujaIV7bDjAAUJeZsnCv3LEbsXLwklhnB/7oiDNROsp
 rlmN4dgSzCOA/wOK9D8+UfCF4rehc0LV+U2mFIRAAtdiV3seGQFDmEaEKdxpjYgMq1vg
 VL1k7xtndU0g7Zeod/xuavXy5KimAnkk2Bk6MCc8y/W2sh5hsK1hHxpyk6sUwN1hTuSa
 6AAOGxyKSDzqWx5tQkxYHnrEUQ3If5oq2yqCy1T7x+G8RmOaIyJm1kz+sTlHSuShRbDo
 NUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=O/lcliIRAqwQlRYKUGRfUd2XRkTPCUiR7gECDUV4FEY=;
 b=CewLRB92Fjom7JvAtvyazwpdK7Ak+EAWMRY7NhIWiY7jmOthfyw8MsnyXFkl3dZmBw
 UE7/ImBcDGi01hF2K+CuBpkSZvZHeQdcILnJkG/jrad7aYTJuEQjhtABJIOhTNe+6Zn5
 CIqILwm/Un3mNlSpQutaAB4B3cC367Z0Kt0djagW40bTyW17/NkUSy82/dVlflvpZ/8u
 vQsg37qUhHNVlGrrwMxtxBjHGFiyk8od0xRnmUf0dRtf6fBZq8ZjEHhsXcOmMkueSKmi
 +ZJlBFSqoo3hfgRiS2cCSTNWseqIXj8/eJ7CLB7E1RMyEbD3rbgbWFUrbgagfU0LePFA
 dfYA==
X-Gm-Message-State: AOAM5304RChJlxgUfwKUgBBEarwqc+Sck0/ltjfeeUoT46uFuptF1xhQ
 z86evBZsFUOT6cAQHGi0TX0=
X-Google-Smtp-Source: ABdhPJx3wOJp9DkyyA89b1K7+IrRu4MUUX81x9Ii3WbvZ7L3hCGwXNb6YssjWsdgytfK94v/6kw7zg==
X-Received: by 2002:a17:902:c286:b0:154:25ae:d6c7 with SMTP id
 i6-20020a170902c28600b0015425aed6c7mr15887226pld.44.1647917524059; 
 Mon, 21 Mar 2022 19:52:04 -0700 (PDT)
Received: from [192.168.122.100] (133-175-21-116.tokyo.ap.gmo-isp.jp.
 [133.175.21.116]) by smtp.gmail.com with ESMTPSA id
 f14-20020a056a0022ce00b004fabe9fac23sm2191pfj.151.2022.03.21.19.52.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 19:52:03 -0700 (PDT)
Message-ID: <c433b909-aa41-d5f6-4cf6-20a84dad5cd7@gmail.com>
Date: Tue, 22 Mar 2022 11:51:59 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 2/3] mtd: cfi_cmdset_0002: Use chip_ready() for write
 on S29GL064N
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 stable@vger.kernel.org
References: <20220316155455.162362-1-ikegami.t@gmail.com>
 <20220316155455.162362-3-ikegami.t@gmail.com>
 <db755852-effe-c4ca-726c-200d28b0b8a5@leemhuis.info>
 <20220321133529.2d3addaf@xps13>
 <f950bfe4-9c8d-199d-120f-cc8c1ecca8e3@leemhuis.info>
 <20220321144134.3076a2ba@xps13>
 <3ed10e7e-1c73-6464-b1df-6c6e086fa162@leemhuis.info>
 <20220321155618.7bfa214e@xps13>
 <09be42ec-9eee-8237-83e9-054956381aab@leemhuis.info>
From: Tokunori Ikegami <ikegami.t@gmail.com>
In-Reply-To: <09be42ec-9eee-8237-83e9-054956381aab@leemhuis.info>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_195204_845795_9AB01528 
X-CRM114-Status: GOOD (  24.62  )
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

On 2022/03/22 0:16, Thorsten Leemhuis wrote:
> On 21.03.22 15:56, Miquel Raynal wrote:
>> regressions@leemhuis.info wrote on Mon, 21 Mar 2022 15:17:50 +0100:
>>> On 21.03.22 14:41, Miquel Raynal wrote:
>>>> regressions@leemhuis.info wrote on Mon, 21 Mar 2022 13:51:10 +0100:
>>>>> On 21.03.22 13:35, Miquel Raynal wrote:
>>>>>> regressions@leemhuis.info wrote on Mon, 21 Mar 2022 12:48:11 +0100:
>>>>>>   
>>>>>>> On 16.03.22 16:54, Tokunori Ikegami wrote:
>>>>>>>> As pointed out by this bug report [1], buffered writes are now broken on
>>>>>>>> S29GL064N. This issue comes from a rework which switched from using chip_good()
>>>>>>>> to chip_ready(), because DQ true data 0xFF is read on S29GL064N and an error
>>>>>>>> returned by chip_good(). One way to solve the issue is to revert the change
>>>>>>>> partially to use chip_ready for S29GL064N.
>>>>>>>>
>>>>>>>> [1] https://lore.kernel.org/r/b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de/
>>>>>>> Why did you switch from the documented format for links you added on my
>>>>>>> request (see
>>>>>>> https://lore.kernel.org/stable/f1b44e87-e457-7783-d46e-0d577cea3b72@leemhuis.info/
>>>>>>>
>>>>>>> ) to v2 to something else that is not recognized by tools and scripts
>>>>>>> that rely on proper link tags? You are making my and maybe other peoples
>>>>>>> life unnecessary hard. :-((
>>>>>>>
>>>>>>> FWIW, the proper style should support footnote style like this:
>>>>>>>
>>>>>>> Link:
>>>>>>> https://lore.kernel.org/r/b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de/
>>>>>>>   [1]
>>>>>>>
>>>>>>> Ciao, Thorsten
>>>>>>>
>>>>>>> #regzbot ^backmonitor:
>>>>>>> https://lore.kernel.org/r/b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de/
>>>>>>>   
>>>>>> Because today's requirement from maintainers is to provide a Link
>>>>>> tag that points to the mail discussion of the patch being applied.
>>>>> That can be an additional Link tag, that is done all the time.
>>>>>   
>>>>>> I
>>>>>> then asked to use the above form instead to point to the bug report
>>>>>> because I don't see the point of having a "Link" tag for it?
>>>> Perhaps I should emphasize that I don't remember your initial request
>>>> regarding the use of a Link tag
>>> Happen, no worries.
>>>
>>>> and my original idea was to help this
>>>> contributor, not kill your tools which I actually know very little
>>>> about.
>>>>>> But it's not your own project, we are all working with thousands of
>>>>> people together on this project on various different fronts. That needs
>>>>> coordination, as some things otherwise become hard or impossible. That's
>>>>> why we have documentation that explains how to do some things. Not
>>>>> following it just because you don't like it is not helpful and in this
>>>>> case makes my life as a volunteer a lot harder.
>>>> Let's be honest, you are referring to a Documentation patch that *you*
>>>> wrote
>>> Correct, but in case of submitting-patches it was just a clarification
>>> how to place links; why the whole aspect was missing in the other is
>>> kinda odd and likely lost in history...
>>>
>>>> and was merged into Linus' tree mid January. How often do you
>>>> think people used to the contribution workflow monitor these files?
>>> Not often, that's why I have no problem pointing it out, even if that's
>>> slightly annoying. But you can imagine that it felt kinda odd on my side
>>> when asking someone to set the links (with references to the docs
>>> explaining how to set them) and seeing them added then in v2, just so
>>> see they vanished again in v3 of the same patch. :-/
>> I fully understand. I actually learned that these tags had to be used
>> for this purpose, so I will actually enforce their use in my next
>> reviews.
>>
>> Just a side question, should the Documentation also mention how
>> to refer to links for people not used to it? Something like
>> [5.Posting.rst]:
>>
>> 	"Link: <link> [1]
>> 	 Link: <link> [2]"
> Maybe. But I think the better approach would be: introduce more specify
> tags like "Reported:" (and maybe drop "Reported-by" at the same time?)
> or "BugLink" (some people use that already!) would be better -- and then
> maybe "Posted:", "Reviewposting", or something like that for the link to
> the patch that is being applied; and leave "Link" for the rest. I
> proposed that a while ago, but that didn't get any traction.

Fixed to use Link tag as before by the version 5 patches instead of [1].

Regards,
Ikegami

>
>> My original point was that maintainers would almost always add
>> a Link tag at the end, containing the mailing-list thread about the
>> patch being applied. Just saying in the commit log "see the link below"
>> then becomes misleading.
> Maybe, but OTOH that link is normally at the end, which kinda makes it
> obvious.
>
>> [...]
> Ciao, Thorsten

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
