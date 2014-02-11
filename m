Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDFL3-0006j7-16
 for linux-mtd@lists.infradead.org; Tue, 11 Feb 2014 15:33:33 +0000
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: "Wiedemer, Thorsten (Lawo AG)" <Thorsten.Wiedemer@lawo.com>
Subject: Re: AW: UBI leb_write_unlock NULL pointer Oops (continuation)
References: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F1F@Exchange1.lawo.de>
 <CAFLxGvya5WXoKcYmOgeM_SmVVEht1jEzeLG9vHhwFudFU+Ny8A@mail.gmail.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18997F8B@Exchange1.lawo.de>
 <52EF772D.8080207@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18DD7989@Exchange1.lawo.de>
 <52EF9FFE.4020405@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18A7474A@Exchange1.lawo.de>
 <52F1F658.9080701@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A1ECCF6AE@Exchange1.lawo.de>
Date: Tue, 11 Feb 2014 10:25:44 -0500
In-Reply-To: <D7B1B5F4F3F27A4CB073BF422331203F2A1ECCF6AE@Exchange1.lawo.de>
 (Thorsten Wiedemer's message of "Tue, 11 Feb 2014 09:01:50 +0100")
Message-ID: <87zjlxy8lj.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>> Am 04.02.2014 18:01, schrieb Wiedemer, Thorsten (Lawo AG):

>>> I made a "hardcore test" with:
>>>> while [ 1 ]; do cp <file_of_8kByte_size>=20
>>> tmp/<file_of_8kByte_size.1>; sync; done & $ while [ 1 ]; do cp=20
>>> <file_of_8kByte_size> tmp/<file_of_8kByte_size.2>; sync; done & $=20
>>> while [ 1 ]; do cp <file_of_8kByte_size> tmp/<file_of_8kByte_size.3>;
>>> sync; done &

>>> It took about 2-3 hours until I had an error (two times):

>> -----Urspr=C3=BCngliche Nachricht-----
>> Von: Richard Weinberger [mailto:richard@nod.at]=20

>> This test ran the over night without any error on my imx51 board. :-\

>> Thorsten, can you please enable CONFIG_DEBUG_LIST?
>> Also try whether you can trigger the issue with lock debugging
>> enabled.

On 11 Feb 2014, Thorsten.Wiedemer@lawo.com wrote:

> short update (I was out of office the rest of last week).  I compiled
> the kernel with the debug flags for debug list and lock alloc.  The
> kernel compiled with gcc-4.8.2 didn't start (no output on serial
> console and reboot of the system).  I didn't try (yet) to find out
> what happens at startup.

You don't need to enable the 'lock alloc' debugging; Just the 'debug
list' as Richard suggested.  One at a time would work and give clues if
you can reproduce it.

> I compiled the same kernel (and same config) with gcc-4.4.4. The write
> test runs now for over 16 hours without error.  Next step is to find
> out wether this is due to a changed timing because of the debug flags
> or if it's the compiler.

I ran a test as per the above on an IMX25 and mxc_nand has 448179139
interrupts, with about 6 bit flips and one torture test.  It was been
running for about four days.  I am using gcc 4.7.3 (crosstool-ng) and
backports to 2.6.36.=20=20

I think that the issue is not related to an MTD driver and/or UBI/UbiFS
directly.  It is more likely an architecture issue and maybe some API
inconsistency.  It could be compiler related, however, it seems many
people have seen the issue on various ARM926 systems (different Linux
versions, different compilers, and different MTD drivers).

User space tasks running in parallel with the test may play a role.  Did
you turn CONFIG_PREEMPT off?  I think memory pressure and other effect
(not related to UBI/UbiFS) maybe needed to trigger the issue.  We don't
normally see this on our systems.  The one time it happened, an
application developer ran some 'ls -R' or 'find .' in parallel with a
file intensive feature in our application.  I haven't found a test to
reproduce it reliably.

Fwiw,
Bill Pringlemeir.
