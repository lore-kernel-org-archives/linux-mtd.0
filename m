Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSWmc-000553-Bz
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 20:49:58 +0000
Received: by pdob1 with SMTP id b1so18100597pdo.2
 for <linux-mtd@lists.infradead.org>; Thu, 20 Aug 2015 13:49:37 -0700 (PDT)
Date: Thu, 20 Aug 2015 13:49:33 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: dedekind1@gmail.com, Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ubifs: Allow O_DIRECT
Message-ID: <20150820204933.GG74600@google.com>
References: <1440016553-26481-1-git-send-email-richard@nod.at>
 <1440016553-26481-2-git-send-email-richard@nod.at>
 <55D542C5.6040500@cn.fujitsu.com>
 <1440070300.31419.202.camel@gmail.com> <55D5BC92.8050903@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55D5BC92.8050903@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pardon the innocent bystander's comment, but:

On Thu, Aug 20, 2015 at 01:40:02PM +0200, Richard Weinberger wrote:
> Am 20.08.2015 um 13:31 schrieb Artem Bityutskiy:
> > On Thu, 2015-08-20 at 11:00 +0800, Dongsheng Yang wrote:
> >> On 08/20/2015 04:35 AM, Richard Weinberger wrote:
> >>> Currently UBIFS does not support direct IO, but some applications
> >>> blindly use the O_DIRECT flag.
> >>> Instead of failing upon open() we can do better and fall back
> >>> to buffered IO.
> >>
> >> Hmmmm, to be honest, I am not sure we have to do it as Dave
> >> suggested. I think that's just a work-around for current fstests.
> >>
> >> IMHO, perform a buffered IO when user request direct IO without
> >> any warning sounds not a good idea. Maybe adding a warning would
> >> make it better.
> >>
> >> I think we need more discussion about AIO&DIO in ubifs, and actually
> >> I have a plan for it. But I have not listed the all cons and pros of
> >> it so far.
> >>
> >> Artem, what's your opinion?
> > 
> > Yes, this is my worry too.
> > 
> > Basically, we need to see what is the "common practice" here, and
> > follow it. This requires a small research. What would be the most
> > popular Linux FS which does not support direct I/O? Can we check what
> > it does?
> 
> All popular filesystems seem to support direct IO.
> That's the problem, application do not expect O_DIRECT to fail.

Why can't we just suggest fixing the applications? The man pages for
O_DIRECT clearly document the EINVAL return code:

  EINVAL The filesystem does not support the O_DIRECT flag. See NOTES
  for more information.

and under NOTES:

  O_DIRECT  support  was added under Linux in kernel version 2.4.10.
  Older Linux kernels simply ignore this flag.  Some filesystems may not
  implement the flag and open() will fail with EINVAL if it is used.

Brian
