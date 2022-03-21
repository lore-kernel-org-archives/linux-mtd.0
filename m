Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E24C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Mar 2022 14:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a0xNw5ekixEXInYh+1dSk7qnoE1+aKUQDgh92+J3sqU=; b=DUzkqQFhESP2lY
	p9VjWJRSXYqDsIcGTQa5kiHAaNaPli7Fjmp+tZ3QFD9Kwl/d/AEPj/khCXM54MiX7+5vFF+nacmyT
	5jQ0d8quMR2hx/6w94vSUEko/GpEi0WlHqKf4Pq9G46EUSAQGjjIE78h8kc3Kz4+zOqcIgMiyozCD
	qiO6HTaXzyS2mXMw7/Uz7qMOIUzKPq3nbpyO5eIUeZ0XDwKcXikoIWiuICGVweluDR1d3d8LY3DVt
	XvqrwNGxo/JPLWRgBoJ2GOmY27h9WPD+eyd16e/dw/Gn/QV0x17kuGARJy6StmUSxRTjF+Da0//Sx
	8rl1qQQ5TJjzL7WM+JXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWIr8-0081Ng-NI; Mon, 21 Mar 2022 14:17:58 +0000
Received: from wp530.webpack.hosteurope.de ([2a01:488:42:1000:50ed:8234::])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWIr5-0081Mj-Dd
 for linux-mtd@lists.infradead.org; Mon, 21 Mar 2022 14:17:57 +0000
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1nWIr1-0005oJ-1R; Mon, 21 Mar 2022 15:17:51 +0100
Message-ID: <3ed10e7e-1c73-6464-b1df-6c6e086fa162@leemhuis.info>
Date: Mon, 21 Mar 2022 15:17:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 2/3] mtd: cfi_cmdset_0002: Use chip_ready() for write
 on S29GL064N
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tokunori Ikegami <ikegami.t@gmail.com>, linux-mtd@lists.infradead.org,
 Ahmad Fatoum <a.fatoum@pengutronix.de>, stable@vger.kernel.org
References: <20220316155455.162362-1-ikegami.t@gmail.com>
 <20220316155455.162362-3-ikegami.t@gmail.com>
 <db755852-effe-c4ca-726c-200d28b0b8a5@leemhuis.info>
 <20220321133529.2d3addaf@xps13>
 <f950bfe4-9c8d-199d-120f-cc8c1ecca8e3@leemhuis.info>
 <20220321144134.3076a2ba@xps13>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20220321144134.3076a2ba@xps13>
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1647872275;
 9eb2e6e9; 
X-HE-SMSGID: 1nWIr1-0005oJ-1R
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_071755_643383_BEE16BAA 
X-CRM114-Status: GOOD (  24.20  )
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

On 21.03.22 14:41, Miquel Raynal wrote:
> regressions@leemhuis.info wrote on Mon, 21 Mar 2022 13:51:10 +0100:
>> On 21.03.22 13:35, Miquel Raynal wrote:
>>> regressions@leemhuis.info wrote on Mon, 21 Mar 2022 12:48:11 +0100:
>>>
>>>> On 16.03.22 16:54, Tokunori Ikegami wrote:
>>>>> As pointed out by this bug report [1], buffered writes are now broken on
>>>>> S29GL064N. This issue comes from a rework which switched from using chip_good()
>>>>> to chip_ready(), because DQ true data 0xFF is read on S29GL064N and an error
>>>>> returned by chip_good(). One way to solve the issue is to revert the change
>>>>> partially to use chip_ready for S29GL064N.
>>>>>
>>>>> [1] https://lore.kernel.org/r/b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de/  
>>>>
>>>> Why did you switch from the documented format for links you added on my
>>>> request (see
>>>> https://lore.kernel.org/stable/f1b44e87-e457-7783-d46e-0d577cea3b72@leemhuis.info/
>>>>
>>>> ) to v2 to something else that is not recognized by tools and scripts
>>>> that rely on proper link tags? You are making my and maybe other peoples
>>>> life unnecessary hard. :-((
>>>>
>>>> FWIW, the proper style should support footnote style like this:
>>>>
>>>> Link:
>>>> https://lore.kernel.org/r/b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de/
>>>>  [1]
>>>>
>>>> Ciao, Thorsten
>>>>
>>>> #regzbot ^backmonitor:
>>>> https://lore.kernel.org/r/b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de/
>>>>
>>>
>>> Because today's requirement from maintainers is to provide a Link
>>> tag that points to the mail discussion of the patch being applied.
>>
>> That can be an additional Link tag, that is done all the time.
>>
>>> I
>>> then asked to use the above form instead to point to the bug report
>>> because I don't see the point of having a "Link" tag for it?
> 
> Perhaps I should emphasize that I don't remember your initial request
> regarding the use of a Link tag

Happen, no worries.

> and my original idea was to help this
> contributor, not kill your tools which I actually know very little
> about.
>>> But it's not your own project, we are all working with thousands of
>> people together on this project on various different fronts. That needs
>> coordination, as some things otherwise become hard or impossible. That's
>> why we have documentation that explains how to do some things. Not
>> following it just because you don't like it is not helpful and in this
>> case makes my life as a volunteer a lot harder.
> 
> Let's be honest, you are referring to a Documentation patch that *you*
> wrote

Correct, but in case of submitting-patches it was just a clarification
how to place links; why the whole aspect was missing in the other is
kinda odd and likely lost in history...

> and was merged into Linus' tree mid January. How often do you
> think people used to the contribution workflow monitor these files?

Not often, that's why I have no problem pointing it out, even if that's
slightly annoying. But you can imagine that it felt kinda odd on my side
when asking someone to set the links (with references to the docs
explaining how to set them) and seeing them added then in v2, just so
see they vanished again in v3 of the same patch. :-/

> I am totally fine enforcing the use of Link: tags if this is what has
> been decided, just don't expect everybody to switch to a style rather
> than another over a night.

I don't.

>> If you don't like the approach explained by the documentation, submit a
>> patch adjusting the documentation and then we can talk about this. But
>> until that is applied please stick to the format explained by the
>> documentation.
> This is uselessly condescending.

I apologize, it wasn't meant that way. I had to many discussions already
where people were not setting any links and it seems the topic is slowly
hitting a nerve here. Sorry.

Ciao, Thorsten

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
