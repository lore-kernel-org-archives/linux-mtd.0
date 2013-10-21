Received: from mail-oa0-x235.google.com ([2607:f8b0:4003:c02::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYJab-0000hw-0P
 for linux-mtd@lists.infradead.org; Mon, 21 Oct 2013 17:48:25 +0000
Received: by mail-oa0-f53.google.com with SMTP id n12so4008183oag.12
 for <linux-mtd@lists.infradead.org>; Mon, 21 Oct 2013 10:48:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20131020105359.GA2465@localhost>
References: <1382077253-21709-1-git-send-email-b32955@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA2866E@DBDE04.ent.ti.com>
 <20131019130846.GB2470@localhost>
 <20980858CB6D3A4BAE95CA194937D5E73EA28EB9@DBDE04.ent.ti.com>
 <20131020105359.GA2465@localhost>
Date: Mon, 21 Oct 2013 10:48:03 -0700
Message-ID: <CAN8TOE8btxKEhKGX-wVD5Bo2UcsouHSWSLZjYPqn+R-jiXj5Zw@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: use a local variable to simplify the
 nand_scan_tail
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Cc: Huang Shijie <b32955@freescale.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "Gupta, Pekon" <pekon@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Oct 20, 2013 at 3:54 AM, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:
> On Sun, Oct 20, 2013 at 07:01:11AM +0000, Gupta, Pekon wrote:
>> > From: Ezequiel Garcia [mailto:ezequiel.garcia@free-electrons.com]
>> > > On Fri, Oct 18, 2013 at 02:11:19PM +0000, Gupta, Pekon wrote:
>> > > Personally I won't prefer such stand-alone cleanup  _unless_ there i=
s
>> > > major driver re-write of the code, because this breaks the traceabil=
ity
>> > > via 'git blame'. And even in that case, this change should be applie=
d first,
>> > > and the other functional updates later.
>> > >
>> >
>> > Hm.. I'm not sure I agree here. I like this patch and I like the effec=
t
>> > it has on nand_scan_tail().
>> >
>> > On a personal note, I hardly ever use git blame at all (because it's d=
ead
>> > slow). Instead, I just run git log ${file} and get the latest changes =
on
>> > that file.
>> >
>> Its rather difficult to use 'git log' especially when you are tracing or=
 debugging
>> a generic driver, and want to know why this piece of code was introduced=
,
>> and the idea behind it. 'git log' won=92t show line by line commit detai=
ls.
>
> Quite the opposite 'git log --patch' shows the commit details.
> Or maybe you need something that I'm not aware of?
>
> I really don't think we should dis-encourage cleanups -in what ever form
> and time they might come- just to preserve the last 'major' author of a f=
ile.

I'm fairly neutral regarding the value of this particular patch (it
doesn't add a lot of value to me) but I agree with Ezequiel's
sentiment. Unless we have a stronger reason for avoiding this change,
I will probably take it.

Brian
