Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCnty-0005On-01
 for linux-mtd@lists.infradead.org; Fri, 02 Dec 2016 13:29:23 +0000
Subject: Re: [GIT PULL] mtd: spi-nor: updates for 4.10
To: Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marex@denx.de>
References: <2bdf6239-d998-825c-cd22-db6ac09d3391@atmel.com>
 <20161201022238.GA3973@google.com>
 <a16b5d6e-2fcf-be61-f41d-788a08c23177@denx.de>
 <20161201174156.GA66143@google.com>
 <0914d553-20e2-b7e5-f16d-fb562601a4aa@denx.de>
 <20161201185015.GA69517@google.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
CC: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, MTD Maling List <linux-mtd@lists.infradead.org>,
 "Boris BREZILLON" <boris.brezillon@free-electrons.com>
Message-ID: <ab652681-1f8f-0edd-17c7-93117648e000@atmel.com>
Date: Fri, 2 Dec 2016 14:28:58 +0100
MIME-Version: 1.0
In-Reply-To: <20161201185015.GA69517@google.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Le 01/12/2016 à 19:50, Brian Norris a écrit :
> On Thu, Dec 01, 2016 at 07:06:38PM +0100, Marek Vasut wrote:
>> On 12/01/2016 06:41 PM, Brian Norris wrote:
>>> On Thu, Dec 01, 2016 at 03:36:35PM +0100, Marek Vasut wrote:
>>>> On 12/01/2016 03:22 AM, Brian Norris wrote:
>>>>> BTW, does Marek have access to your repo, or are you planning on doing
>>>>> all the merging?
>>>>
>>>> I'm not a big github fan, but I have access, yep.
>>>
>>> Not even as a dumb git server? I can understand not appreciating the
>>> web interface.
>>
>> Well, it doesn't really feel right to keep kernel stuff outside of
>> kernel.org , or is that OK now ? And I don't really like the EULA
>> they have.
> 
> There's nothing magical about kernel.org. I see 63 github entries and 7
> infradead entries in MAINTAINERS, and 12 github trees and 14 infradead
> trees in linux-next.git, to name a few. There's also stuff at
> freedesktop.org and probably other places. As with anything
> kernel-related, it's a very distributed process, and the key is just to
> have some kind of chain of trust, regardless of the storage location.
> 
>>> Anyway, nothing (except MAINTAINERS, which can be changed) requires we
>>> use github. We could probably set up a shared infradead.org repo or
>>> maybe even kernel.org if you'd prefer.
>>
>> I have a k.org account, but then, I also don't want to cause too much fuss.
> 
> I mean, a shared one between all SPI NOR maintainers. i.e., Cyrille
> would need access. I don't really know anything about kernel.org access
> permissions, but if he can get on there, then by all means.
> 
> I won't bug much more about this either, but if you would rather pick
> something like infradead.org, I'm sure David can help us out.
> 
> Brian
> 

I'm fine with moving to infradead.org or kernel.org if you think it's more
suited. Boris had advised me to use github just because it is what he uses
for the nand subsystem hence I've chosen github so I could be ready quickly.
No other particular reason.

I don't have a kernel.org account yet, I guess now I have some public
contributions to the Linux kernel it should be easy to create one. I've made
my GPG public key signed by few kernel.org members.
So if needed, we can move to kernel.org. I'm not familiar with it but as long
as both Marek and I can share a tree.

Otherwise we can move to infradead.org or stay with github.
About sharing a git tree, Boris'd suggested that for each release Marek and I
should decide who will be responsible for merging patches in the spi-nor tree
and for sending PR to Brian. Only one of us per release just to avoid
conflicts if instead we would both merge patches at the same time in the
spi-nor tree. However we can still choose this 2nd solution, being cautious.

Of course, whatever model we choose, both Marek and I will review spi-nor
patches for each release.


Best regards,

Cyrille
