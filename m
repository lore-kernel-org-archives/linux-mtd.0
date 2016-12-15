Received: from mail-vk0-x244.google.com ([2607:f8b0:400c:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cHQAW-0007fY-9I
 for linux-mtd@lists.infradead.org; Thu, 15 Dec 2016 07:09:33 +0000
Received: by mail-vk0-x244.google.com with SMTP id w194so6997582vkw.3
 for <linux-mtd@lists.infradead.org>; Wed, 14 Dec 2016 23:09:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161214210935.GA135941@google.com>
References: <cover.1474450295.git.dwalter@sigma-star.at>
 <984fd8eb53b742bd46e7b42605ae4e0ceaf5ba08.1474450295.git.dwalter@sigma-star.at>
 <20160921121531.7786ee9b@bbrezillon> <20160928201611.GB142302@google.com>
 <CACYmx9P8LgpZFu8yZR0UqAi52D2Sn6Ht+A6h-qygeAz8AsULwA@mail.gmail.com>
 <20161214210935.GA135941@google.com>
From: Karl Beldan <karl.beldan@gmail.com>
Date: Thu, 15 Dec 2016 07:09:10 +0000
Message-ID: <CACYmx9Oh6z84HggiWw+zou9Zy9cFerrm8Krpd-Y2Rk8oVDP1kg@mail.gmail.com>
Subject: Re: [PATCH v2 01/46] mtdpart: Propagate _get/put_device()
To: Brian Norris <computersforpeace@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Daniel Walter <dwalter@sigma-star.at>, Stable <stable@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 14, 2016 at 9:09 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Wed, Dec 14, 2016 at 07:24:46PM +0000, Karl Beldan wrote:
>> On Wed, Sep 28, 2016 at 8:16 PM, Brian Norris
>> <computersforpeace@gmail.com> wrote:
>> > On Wed, Sep 21, 2016 at 12:15:31PM +0200, Boris Brezillon wrote:
>> >> On Wed, 21 Sep 2016 11:43:56 +0200
>> >> Daniel Walter <dwalter@sigma-star.at> wrote:
>> >>
>> >> > From: Richard Weinberger <richard@nod.at>
>> >> >
>> >> > If the master device has callbacks for _get/put_device()
>> >> > and this MTD has slaves a get_mtd_device() call on paritions
>> >> > will never issue the registered callbacks.
>> >> > Fix this by propagating _get/put_device() down.
>> >>
>> >> Brian, can we have this one queued for 4.9? I can't take it in my tree
>> >> if you want, but it's probably better if it's in the mtd tree.
>> >
>> > Applied this patch to l2-mtd.git
>> >
>>
>> I think this should also go into -stable.
>
> Why? Do you have real use cases that are broken by this? I understand

I do, some code adding partitions on a gluebi master.

> this is a problem, but I'm curious on how this satisfies the stable
> rules.
>
> Also, note that this isn't a regression; it's been broken forever and
> apparently no one noticed. IMO that raises the bar a bit (but not
> impossibly so) for -stable.
>

I just encountered the bug yesterday and yes it is obvious it has been
broken forever.
I don't have strong opinion about these things so no worries.

Karl

> Anyway, if we decide to do this, you'll also want to include the git
> hash and applicable kernel versions, per Option 2 [1].
>
> Brian
>
> [1] Documentation/stable_kernel_rules.txt.
