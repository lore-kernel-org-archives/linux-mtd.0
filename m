Received: from mail-yw0-x244.google.com ([2607:f8b0:4002:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPZsU-0006iN-It
 for linux-mtd@lists.infradead.org; Tue, 19 Jul 2016 18:36:23 +0000
Received: by mail-yw0-x244.google.com with SMTP id u134so1714466ywg.3
 for <linux-mtd@lists.infradead.org>; Tue, 19 Jul 2016 11:36:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160719182328.GB85399@google.com>
References: <1468942904-26464-1-git-send-email-andrew.smirnov@gmail.com>
 <578E4AF0.7090507@nod.at> <20160719175912.11277116@bbrezillon>
 <578E4F13.1070100@nod.at> <20160719181248.2a71b5a7@bbrezillon>
 <578E53DD.806@nod.at>
 <CAHQ1cqGN6fbbXoqZaFpDG856EsHAve-Or0M_HT8Zpb-BodC3sA@mail.gmail.com>
 <20160719201611.277dfbff@bbrezillon> <20160719182328.GB85399@google.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 19 Jul 2016 11:36:01 -0700
Message-ID: <CAHQ1cqFFgD+nmrTVC6-RdhXyM4UkSV1Fpze0r2XaT0p8TM85iA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: BUG_ON in case of no select_chip and
 cmd_ctrl
To: Brian Norris <computersforpeace@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 19, 2016 at 11:23 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Tue, Jul 19, 2016 at 08:16:11PM +0200, Boris Brezillon wrote:
>> On Tue, 19 Jul 2016 11:11:54 -0700
>> Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>>
>> > On Tue, Jul 19, 2016 at 9:22 AM, Richard Weinberger <richard@nod.at> wrote:
>> > > Am 19.07.2016 um 18:12 schrieb Boris Brezillon:
>> > >>>> Not sure a BUG_ON() is worst than a NULL-pointer exception ;-).
>> > >>>
>> > >>> When this really just triggers a NULL-pointer exception, we don't need a BUG_ON or WARN_ON at
>> > >>> all since the kernel can tell anyway what went wrong.
>> > >>
>> > >> Hm, that's not entirely true, depending on your debug options you don't
>> > >> have all the information to guess which line triggered the NULL pointer
>> > >> exception, and this makes it harder to debug.
>> > >> And I agree with Andrey here, it's better to complain at registration
>> > >> time than letting the controller register all its NAND devices and
>> > >> generate exceptions when the NAND is really used.
>> > >>
>> > >> BTW, I don't quite understand the rational behind BUG_ON() eradication.
>> > >> I agree that they should not be used when the driver can recover from a
>> > >> specific failure, but that's not really the case here (some NAND
>> > >> controller drivers don't check nand_scan_tail() or nand_scan() return
>> > >> code).
>> > >
>> > > I've been told that new code (except core code) should not BUG()/_ON().
>> > >
>> > >> The best solution would probably be to patch all those drivers and then
>> > >> return an error when one of the mandatory hooks is missing, but in the
>> > >> meantime I don't see any problem in adding BUG_ON() calls.
>> > >
>> > > Yes, definitely.
>> >
>> > I don't have any preferences as far BUG_ON/WARN_ON are concerned and
>> > am more than happy to change one for another.
>> >
>> > The reason I came up with that patch is that I stumbled on that
>> > segfault (by not providing custom select_chip() and not setting up
>> > cmd_ctrl()) and it took me good 20 minutes to figure out the nature of
>> > the problem, whereas, IMHO, having a BUG/WARN statement at the would
>> > have been more self-documenting/explanatory.
>
> Would a normal print statement and error return have helped, like most
> sane drivers? Like:
>
>         if (!chip->cmd_ctrl) {
>                 pr_err("No cmd_ctrl() provided\n");
>                 return -EINVAL;
>         }

Yes, that would've worked perfectly fine.

>
>> > What if I modify the patch to change nand_set_default's signature to
>> > return a error code, add corresponding checking in
>> > nand_get_flash_type()/nand_scan_ident() and replace BUG_ON with
>> > WARN_ON? Would it be more agreeable solution?
>
> Sounds better to me, though I still don't see why even WARN_ON() is
> necessary. I guess we are infected by plenty of those already anyway,
> since I guess that's easier than writing a descriptive error message...

It's not necessary, WARN_ON might be slightly more visible when
skimming through dmesg, but pr_err should work as well. I'll use the
latter in v2 then.

Andrey
