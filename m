Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YhPSn-0005Ph-VA
 for linux-mtd@lists.infradead.org; Sun, 12 Apr 2015 21:30:46 +0000
Date: Sun, 12 Apr 2015 23:30:19 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 4/4] UBI: Implement bitrot checking (linux-mtd Digest,
 Vol 145, Issue 24)
Message-ID: <20150412233019.2b4eac3e@bbrezillon>
In-Reply-To: <552ADD27.6080703@nod.at>
References: <mailman.40253.1428858576.22890.linux-mtd@lists.infradead.org>
 <mailman.40253.1428858576.22890.linux-mtd.{2b889d2f-ba39-4abc-aea3-8920fd29865f}.0@lists.infradead.org>
 <552AA390.3070700@nod.at> <552AD8A6.6000406@dave-tech.it>
 <552ADD27.6080703@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Andrea Scian <rnd4@dave-tech.it>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 12 Apr 2015 23:01:27 +0200
Richard Weinberger <richard@nod.at> wrote:


> >>>>>> +static struct device_attribute dev_trigger_bitrot_check =
> >>>>>> +    __ATTR(trigger_bitrot_check, S_IWUSR, NULL, trigger_bitrot_check);
> >>>>>
> >>>>> How about making this attribute a RW one, so that users could check
> >>>>> if there's a bitrot check in progress.
> >>>>
> >>>> As the check will be initiated only by userspace and writing to the trigger
> >>>> while a check is running will return anyway a EBUSY I don't really see
> >>>> a point why userspace would check for it.
> >>>
> >>> Sometime you just want to know whether something is running or not (in
> >>> this case the bitrot check) without risking to trigger a new action...
> >>
> >> Why would they care?
> > 
> > I think is always useful to give some additional information in userspace, from both debugging and diagnostic point of view.
> 
> The question is, why does userspace care?
> Other UBI operations are also not visible...

Yes, but AFAIK other wear-leveling operations are not directly triggered
by user-space.


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
