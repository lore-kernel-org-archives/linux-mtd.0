Received: from mail-qa0-f42.google.com ([209.85.216.42])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sw0gK-0002Nr-BY
 for linux-mtd@lists.infradead.org; Tue, 31 Jul 2012 00:51:28 +0000
Received: by qafi31 with SMTP id i31so1259643qaf.15
 for <linux-mtd@lists.infradead.org>; Mon, 30 Jul 2012 17:51:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHeY5Qe2U8sGqMrvd5_uYOiBYu09Y818GUfFhJh3-TnMPnijbA@mail.gmail.com>
References: <CAHeY5Qe2U8sGqMrvd5_uYOiBYu09Y818GUfFhJh3-TnMPnijbA@mail.gmail.com>
Date: Mon, 30 Jul 2012 17:51:26 -0700
Message-ID: <CAN8TOE_PJC8d6VSskn9LhqfiaB=z3+2v1nK6NOw7_7unwN69cw@mail.gmail.com>
Subject: Re: Cortex A9 Ubifs Issues with SMP enable kernel <ubifs recovery
 needed>
From: Brian Norris <computersforpeace@gmail.com>
To: Darshan Nandanwar <dk.manit@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, Mike Dunn <mikedunn@newsguy.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Darshan,

On Thu, Jul 26, 2012 at 11:07 AM, Darshan Nandanwar <dk.manit@gmail.com> wrote:
> Artem/Brian,,
>  I am facing  the issue when try to mount rootfs which inside one of the ubi
> partition .Linux kernel 3.x is being used .All goes perfect when i use it
> uni-processor mode but  when i enable SMP , then  it cribs for *ubifs
> recovery needed*. Does it imply that partition got corrupted?  if it is ,
> then why its not in the case of  non-smp kernel image?  did you guys happen
> to face such kind of issue?
>
> if any recovery is required ubifs has to do by itself..  isn't it? cpu goes
> dead  after popping up s *ubifs recovery needed* message .. but when i used
> nfs ,same  kernel image works fine..
>
> Will appreciate if i get some input from MTD folks...

I'm not very experienced in UBIFS issues, but since nobody has
responded, I can provide some suggestions based on my knowledge of
MTD.

These messages look like UBIFS corruption, and I believe UBIFS should
attempt to self-recover (when it says "recovery needed") or else fail
and print other error messages. Generally, there's no known reason
that UBI/UBIFS should simply "die" in SMP mode vs. uniprocessor.

Now, it makes sense to validate the lower layers of your system to
ensure that the driver + MTD layer are functioning (in both
uniprocessor and SMP mode). For instance, what driver are you using?
Is this NAND or NOR flash? Also, please try the MTD tests[1], noting
that these tests can be destructive to your flash data. Also note
their descriptions; only run the tests that make sense (e.g., you
don't need mtd_speedtest).

If the MTD tests pass, then send a more useful bug report, as described in [2].

Brian

P.S. Please do not send multiple copies of the same email. I received
two with the MTD mailing list on the CC list plus a private message.
It's fine if this was accidental, but in the future, please try to
send only one copy of the message, with the mailing list in the CC so
that anyone can read and respond.

[1] http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests
[2] http://www.linux-mtd.infradead.org/faq/general.html#L_bug_report
