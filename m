Received: from mail-ve0-x234.google.com ([2607:f8b0:400c:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZksC-0001Vg-4L
 for linux-mtd@lists.infradead.org; Fri, 25 Oct 2013 17:08:32 +0000
Received: by mail-ve0-f180.google.com with SMTP id oy12so766391veb.39
 for <linux-mtd@lists.infradead.org>; Fri, 25 Oct 2013 10:08:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1382710092.8395.3.camel@shinybook.infradead.org>
References: <1382602484-12023-1-git-send-email-b32955@freescale.com>
 <1382702607.8522.110.camel@shinybook.infradead.org>
 <1382703654.8522.114.camel@shinybook.infradead.org>
 <20131026013258.GA3195@gmail.com>
 <1382707782.8522.140.camel@shinybook.infradead.org>
 <20131026014115.GB3195@gmail.com>
 <1382710092.8395.3.camel@shinybook.infradead.org>
Date: Fri, 25 Oct 2013 10:08:06 -0700
Message-ID: <CAN8TOE9VtpJfvTQdYW-POJXOshoQPNsE0gHiNkG4v5-E2=EkkQ@mail.gmail.com>
Subject: Re: [PATCH V2] mtd: gpmi: fix the ecc regression
From: Brian Norris <computersforpeace@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Marek Vasut <marex@denx.de>, Artem Bityutskiy <dedekind1@gmail.com>,
 Tim Harvey <tharvey@gateworks.com>, stable@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 25, 2013 at 7:08 AM, David Woodhouse <dwmw2@infradead.org> wrote:
> On Fri, 2013-10-25 at 21:41 -0400, Huang Shijie wrote:
>> On Fri, Oct 25, 2013 at 02:29:42PM +0100, David Woodhouse wrote:
>> > On Fri, 2013-10-25 at 21:33 -0400, Huang Shijie wrote:
>> > >
>> > >   I am ok with your patch. but we will meet a compiler warning, since
>> > >   the set_geometry_by_ecc_info() is not referenced.
>> >
>> > Yeah, I predicted that but at this stage with *hours* to catch Linux and
>> > get it into 3.12, I think that's the better option. I'll note it in the
>> > commit comment.
>>
>> ok. Please add my ack for your formal patch:
>> Acked-by: Huang Shijie <shijie8@gmail.com>
>
> I've just pushed this to the tip of the tree, replacing the version that
> Brian had put there.

A tiny comment on the description. You say:

"The "legacy" ECC layout used until 3.11 uses all the OOB area by
computing the ECC strength and ECC step size ourselves."

This phrase "until 3.11" sounds like the layout changed in 3.11 (which
it did not). The rest of the commit message might clear that up, but
still...

> Brian, are you still happy to send the pull request to Linus or do you
> want me to?

I'm happy either way, as long as the fixes go in. I'll send it, since
I still have the day ahead of me in my timezone.

Thanks,
Brian
