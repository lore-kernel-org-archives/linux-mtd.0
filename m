Received: from mail-vk0-x244.google.com ([2607:f8b0:400c:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cHFAq-0000tr-G4
 for linux-mtd@lists.infradead.org; Wed, 14 Dec 2016 19:25:09 +0000
Received: by mail-vk0-x244.google.com with SMTP id l126so4881750vkh.0
 for <linux-mtd@lists.infradead.org>; Wed, 14 Dec 2016 11:24:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20160928201611.GB142302@google.com>
References: <cover.1474450295.git.dwalter@sigma-star.at>
 <984fd8eb53b742bd46e7b42605ae4e0ceaf5ba08.1474450295.git.dwalter@sigma-star.at>
 <20160921121531.7786ee9b@bbrezillon> <20160928201611.GB142302@google.com>
From: Karl Beldan <karl.beldan@gmail.com>
Date: Wed, 14 Dec 2016 19:24:46 +0000
Message-ID: <CACYmx9P8LgpZFu8yZR0UqAi52D2Sn6Ht+A6h-qygeAz8AsULwA@mail.gmail.com>
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

On Wed, Sep 28, 2016 at 8:16 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Wed, Sep 21, 2016 at 12:15:31PM +0200, Boris Brezillon wrote:
>> On Wed, 21 Sep 2016 11:43:56 +0200
>> Daniel Walter <dwalter@sigma-star.at> wrote:
>>
>> > From: Richard Weinberger <richard@nod.at>
>> >
>> > If the master device has callbacks for _get/put_device()
>> > and this MTD has slaves a get_mtd_device() call on paritions
>> > will never issue the registered callbacks.
>> > Fix this by propagating _get/put_device() down.
>>
>> Brian, can we have this one queued for 4.9? I can't take it in my tree
>> if you want, but it's probably better if it's in the mtd tree.
>
> Applied this patch to l2-mtd.git
>

I think this should also go into -stable.
