Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T6dzn-0001Qn-Bz
 for linux-mtd@lists.infradead.org; Wed, 29 Aug 2012 08:51:32 +0000
Received: by bkcji2 with SMTP id ji2so137734bkc.36
 for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2012 01:51:24 -0700 (PDT)
Date: Wed, 29 Aug 2012 11:51:12 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH v2] mtd: cmdlinepart: fix the wrong partitions number
 when truncating occurs
Message-ID: <20120829115112.389fc40c@halley>
In-Reply-To: <1346228165.2848.432.camel@sauron.fi.intel.com>
References: <1345904767-23011-1-git-send-email-shijie8@gmail.com>
 <20120825120231.73577d6a@halley>
 <CAMiH66HyfNEzEHGyZUcLJ_01PNVHqA44fjAqXsyM2c-HHms8hQ@mail.gmail.com>
 <20120826090603.6b833e54@pixies.home.jungo.com>
 <1346228165.2848.432.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, Huang Shijie <shijie8@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 29 Aug 2012 11:16:05 +0300 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Sun, 2012-08-26 at 09:06 +0300, Shmulik Ladkani wrote:
> > root	100m@0
> > kernel	100m@100m
> > rootfs	800m@200m (truncated)
> > user	0@1g (truncated)
> > rest	0@1g
> 
> Who would benefit from having those 2 0-sized partitions and how? How
> many users/scripts would be confused by this (these 2 ghost partitions
> would be visible in /proc/mtd and sysfs)? How much RAM would we spend
> for creating sysfs files and directories for these ghost partitions
> (note, one sysfs file costs a couple KiB I thing, because 'sizeof
> (struct inode)').
> 
> While you suggestion is clever, do we really benefit from this?

Artem, please note this is just a side effect of what I've suggested
(that its, continue parsing after first truncated partition), not a real
use case I'd expect and intentionally wish to support.

I am used to specify partitions explicitly using size@offset (specifying
offset for all parts, even if sometimes adjacent), and sometimes in an
unsorted fashion.
I never defined some partition that got truncated, so the whole
discussion is theoretical to _my_ usecase.

The only benefit of continuing to parse, is that if there _are_ later
partitions which are defined _explicitly_ with an offset, whose location
is _before_ the truncated partition, these would still be parsed and
registered.

Not so important, and would rarely happen, but simplistic and naive.

And reagrding 0 sized partitions, we can always skip these.

Regards,
Shmulik
