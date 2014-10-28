Received: from mail-qc0-x234.google.com ([2607:f8b0:400d:c01::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjAhW-0005z1-7I
 for linux-mtd@lists.infradead.org; Tue, 28 Oct 2014 17:36:59 +0000
Received: by mail-qc0-f180.google.com with SMTP id o8so932517qcw.25
 for <linux-mtd@lists.infradead.org>; Tue, 28 Oct 2014 10:36:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20141028133253.223e47f7@gandalf.local.home>
References: <20140929124246.3e39dac8@gandalf.local.home>
 <cover.1412031505.git.joe@perches.com>
 <c1a1138f1b05e87a3fbd8737af2f2c0be6e2724b.1412031505.git.joe@perches.com>
 <20141022082916.GD16128@brian-ubuntu>
 <20141028111301.22481f2a@gandalf.local.home>
 <1414511877.6643.12.camel@perches.com>
 <20141028120552.63c2324c@gandalf.local.home>
 <1414517260.6643.21.camel@perches.com>
 <20141028133253.223e47f7@gandalf.local.home>
Date: Tue, 28 Oct 2014 10:36:36 -0700
Message-ID: <CAN8TOE-q7pDsT2+DxCQowtY2_ExekAzBjjkA5S5EA_9gjoqaOg@mail.gmail.com>
Subject: Re: [PATCH 7/7] docg3: Fix miuse of seq_printf return value
From: Brian Norris <computersforpeace@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset=UTF-8
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Petr Mladek <pmladek@suse.cz>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Joe Perches <joe@perches.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 28, 2014 at 10:32 AM, Steven Rostedt <rostedt@goodmis.org> wrote:
> On Tue, 28 Oct 2014 10:27:40 -0700
> Joe Perches <joe@perches.com> wrote:
>> On Tue, 2014-10-28 at 12:05 -0400, Steven Rostedt wrote:
>> > On Tue, 28 Oct 2014 08:57:57 -0700
>> > Joe Perches <joe@perches.com> wrote:
>> >
>> > > On Tue, 2014-10-28 at 11:13 -0400, Steven Rostedt wrote:
>> > > > I'm going to be working on changes to remove the return value of
>> > > > seq_printf() and friends.
>> > >
>> > > I'm sure you know all of this, but for anyone else:
>> > >
>> > > This doesn't need to be done in a single pass.
>> >
>> > Yeah, I took a look at all the places, and I've decided to take it off
>> > in chunks. I'm starting with the ones you posted, and will try to get
>> > acks for them. And then go after other chunks as I have time.
>> >
>> > I would like to get this done before I do my merge of trace_seq and
>> > seq_file, but I'm thinking I may have to do that in parallel.
>>
>> I think the most important thing is to get the
>> seq_is_overflown (or seq_has_overflowed or whatever
>> other name is chosen) function added then the rest
>> of the patches can be applied whenever maintainers
>> (or Andrew or trivial or ...) pick them up.
>
> I can get that in without much of an issue. But the merge of trace_seq
> and seq_file would be easier if I didn't have to worry about return
> values. Which is why I want to get this in quickly.

Whatever you'd like. Please, have my ack and keep the patch in your own branch!

Acked-by: Brian Norris <computersforpeace@gmail.com>

It's no problem if we both have the patch, is it? Or if I see it in
linux-next, then I may drop it from my tree.

Regards,
Brian
