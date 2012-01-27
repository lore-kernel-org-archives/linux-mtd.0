Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqqXm-0007zD-DZ
 for linux-mtd@lists.infradead.org; Fri, 27 Jan 2012 18:29:03 +0000
Received: by wico1 with SMTP id o1so1940589wic.36
 for <linux-mtd@lists.infradead.org>; Fri, 27 Jan 2012 10:28:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <201201260953.04349.brian.foster@maxim-ic.com>
References: <1327563110-23966-1-git-send-email-computersforpeace@gmail.com>
 <1327563110-23966-2-git-send-email-computersforpeace@gmail.com>
 <201201260953.04349.brian.foster@maxim-ic.com>
Date: Fri, 27 Jan 2012 10:28:59 -0800
Message-ID: <CAN8TOE9hvxBGG40P9RV=-1r9m3wrYGOnBUFvBmZk3nn-8=RAnw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ubinfo: fix `--all' for non-consecutive device numbers
From: Brian Norris <computersforpeace@gmail.com>
To: Brian Foster <brian.foster@maxim-ic.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 26, 2012 at 12:53 AM, Brian Foster
<brian.foster@maxim-ic.com> wrote:
> On Thursday 26 January 2012 08:31:50 Brian Norris wrote:
>> When we have assigned non-consecutive device numbers to our UBI devices =
[...]
>> This patch adds a check to first see if device is present, then continue
>> to the next ID if it doesn't exist.
>>[ ... ]
>
> =A0Looks Ok to me (when used with part 1).
>
> =A0However, looking at the mtd-utils v1.4.6 =91mtdinfo.c=92,
> =A0is there a similar issue there? =A0But I have no idea
> =A0how you could get non-consecutive MTD device numbers?

Yeah, there is a problem there. It's a little more difficult to see,
but it can happen.

Suppose you have /dev/mtd0 on your system, then you can get an error
with the following sequence:

# modprobe mtdram
# modprobe nandsim
# rmmod mtdram
# mtdinfo --all
...
mtdinfo: error!: mtd1 does not correspond to any existing MTD device

I'm sending a quick patch set for this.

Brian
