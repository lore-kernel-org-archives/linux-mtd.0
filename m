Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bwaQS-0001Dl-LY
 for linux-mtd@lists.infradead.org; Tue, 18 Oct 2016 19:51:53 +0000
Subject: Re: [PATCH 1/1] MAINTAINERS: add a maintainer for the SPI NOR
 subsystem
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <0a3eaa21fb0f38743308c9cc9fc5d2373f4877de.1476802288.git.cyrille.pitchen@atmel.com>
 <d4e954c1-0bbb-fc16-4e9a-46c25ec4fb9e@denx.de>
 <CAFLxGvy9okx1cHnRhq2U-u574PzAk=Tampw1Fmvp4KzY8vnDnw@mail.gmail.com>
 <3d45f698-08e9-e672-d405-1ab9bfec1222@atmel.com>
 <cf010a6c-b642-0994-bbfd-c86d5ab24e6e@nod.at>
 <20161018184651.GA71760@google.com>
 <23317635-426e-fbf8-f0b2-b59dde75900a@denx.de>
 <20161018214153.69c95a06@bbrezillon>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 nicolas.ferre@atmel.com, LKML <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <0c6e5a80-3f34-0e76-088a-35dad443ca2f@denx.de>
Date: Tue, 18 Oct 2016 21:51:28 +0200
MIME-Version: 1.0
In-Reply-To: <20161018214153.69c95a06@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/18/2016 09:41 PM, Boris Brezillon wrote:

[...]

>> Patchwork is nice, it helps keeping track of the patch status real well.
>> But there is always the problem of keeping the patchwork up-to-date when
>> the status of patch changes, esp. if one is offline (or maybe I didn't
>> look hard enough).
> 
> I use git notes + a pre-push hook to help mark a patch as 'Accepted' in
> patchwork, but still, it does not automate moving patches to the
> 'Superseeded' state (which IMO should be directly handled in patchwork)
> and those who are rejected. This is why the backlog tend to grow until
> I decide to do some cleanup.
> 
> We also have all those patches which are over 1 year old, but that we
> keep just in case someone wants to revive them.
> 
> Anyway, I think patchwork is very useful if it's well maintained, so
> maybe we should cleanup things after each release.

You've very much nailed it. Those are all my complaints about patchwork
and problems we had in U-Boot. Cleaning it up took a while.

One just has to keep an eye on patchwork so it doesn't get out of
control, otherwise the mountain of patches you have no clue about
anymore becomes the source of utter frustration.

>>> I think Boris and I have been sort of
>>>  using it, but it's still got a pretty good backlog (partly real --
>>>  i.e., the cause for this thread; and partly artificial, due to
>>>  accounting).
>>>
>>>  What to do about mtd-utils.git? That's been languishing a bit, and it
>>>  has no release schedule. Maybe we want a plan for that too.
>>>
>>> BTW, will anybody be at Linux Plumbers? I plan to be there in a few
>>> weeks. And something tells me dwmw2 will be there.
>>>
>>> Brian
>>>   
>>
>>
> 


-- 
Best regards,
Marek Vasut
