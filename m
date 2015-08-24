Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZTlwz-0002IS-0Z
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2015 07:13:49 +0000
Message-ID: <1440400405.15510.29.camel@gmail.com>
Subject: Re: [PATCH 2/2] ubifs: Allow O_DIRECT
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Brian Norris <computersforpeace@gmail.com>, Richard Weinberger
 <richard@nod.at>
Cc: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 24 Aug 2015 10:13:25 +0300
In-Reply-To: <20150820204933.GG74600@google.com>
References: <1440016553-26481-1-git-send-email-richard@nod.at>
 <1440016553-26481-2-git-send-email-richard@nod.at>
 <55D542C5.6040500@cn.fujitsu.com> <1440070300.31419.202.camel@gmail.com>
 <55D5BC92.8050903@nod.at> <20150820204933.GG74600@google.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2015-08-20 at 13:49 -0700, Brian Norris wrote:
> Pardon the innocent bystander's comment, but:
> 
> On Thu, Aug 20, 2015 at 01:40:02PM +0200, Richard Weinberger wrote:
> > Am 20.08.2015 um 13:31 schrieb Artem Bityutskiy:
> > > On Thu, 2015-08-20 at 11:00 +0800, Dongsheng Yang wrote:
> > > > On 08/20/2015 04:35 AM, Richard Weinberger wrote:
> > > > > Currently UBIFS does not support direct IO, but some
> > > > > applications
> > > > > blindly use the O_DIRECT flag.
> > > > > Instead of failing upon open() we can do better and fall back
> > > > > to buffered IO.
> > > > 
> > > > Hmmmm, to be honest, I am not sure we have to do it as Dave
> > > > suggested. I think that's just a work-around for current
> > > > fstests.
> > > > 
> > > > IMHO, perform a buffered IO when user request direct IO without
> > > > any warning sounds not a good idea. Maybe adding a warning
> > > > would
> > > > make it better.
> > > > 
> > > > I think we need more discussion about AIO&DIO in ubifs, and
> > > > actually
> > > > I have a plan for it. But I have not listed the all cons and
> > > > pros of
> > > > it so far.
> > > > 
> > > > Artem, what's your opinion?
> > > 
> > > Yes, this is my worry too.
> > > 
> > > Basically, we need to see what is the "common practice" here, and
> > > follow it. This requires a small research. What would be the most
> > > popular Linux FS which does not support direct I/O? Can we check
> > > what
> > > it does?
> > 
> > All popular filesystems seem to support direct IO.
> > That's the problem, application do not expect O_DIRECT to fail.
> 
> Why can't we just suggest fixing the applications? The man pages for
> O_DIRECT clearly document the EINVAL return code:
> 
>   EINVAL The filesystem does not support the O_DIRECT flag. See NOTES
>   for more information.
> 
> and under NOTES:
> 
>   O_DIRECT  support  was added under Linux in kernel version 2.4.10.
>   Older Linux kernels simply ignore this flag.  Some filesystems may
> not
>   implement the flag and open() will fail with EINVAL if it is used.

That's an option.

When writing the code, we were defensive and preferred to error out for
everything we do not support. This is generally a good SW engineering
practice.

Now, some user-space fails when direct I/O is not supported. We can
chose to fake direct I/O or fix user-space. The latter seems to be the
preferred course of actions, and you are correctly pointing the man
page.

However, if

1. we are the only FS erroring out on O_DIRECT
2. other file-systems not supporting direct IO just fake it

we may just follow the crowd and fake it too.

I am kind of trusting Richard here - I assume he did the research and
the above is the case, this is why I am fine with his patch.

Does this logic seem acceptable to you? Other folk's opinion would be
great to hear.

Artem.
