Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOsBs-0000kK-Q0
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2016 19:25:14 +0000
Received: by mail-wm0-x22f.google.com with SMTP id p63so39343127wmp.1
 for <linux-mtd@lists.infradead.org>; Thu, 28 Jan 2016 11:24:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20160128175905.GA33340@google.com>
References: <1453960307-10181-1-git-send-email-computersforpeace@gmail.com>
 <1453960307-10181-5-git-send-email-computersforpeace@gmail.com>
 <CAAEAJfC6HM6M0ZJuEqj-=QUUs9+kHJB0m5bt2t9a-VYuiMPx4Q@mail.gmail.com>
 <20160128175905.GA33340@google.com>
Date: Thu, 28 Jan 2016 16:24:50 -0300
Message-ID: <CAAEAJfDHRutp1R1nKxih-4CENBsjhmFaaTnqD7S6Vub+pqE05Q@mail.gmail.com>
Subject: Re: [PATCH 4/8] mtd: spi-nor: disallow further writes to SR if WP# is
 low
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Brian Norris <computersforpeace@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bayi Cheng <bayi.cheng@mediatek.com>,
 Marek Vasut <marex@denx.de>, Daniel Kurtz <djkurtz@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 28 January 2016 at 14:59, Brian Norris <computersforpeace@gmail.com> wro=
te:
> Hi Ezequiel,
>
> Thanks for the review.
>
> On Thu, Jan 28, 2016 at 11:36:13AM -0300, Ezequiel Garcia wrote:
>> On 28 January 2016 at 02:51, Brian Norris <computersforpeace@gmail.com> =
wrote:
>> > Locking the flash is most useful if it provides real hardware security=
.
>> > Otherwise, it's little more than a software permission bit.
>> >
>> > A reasonable use case that provides real HW security might be like
>> > follows:
>> >
>> > (1) hardware WP# is deasserted
>> > (2) program flash
>> > (3) flash range is protected via status register
>> > (4) hardware WP# is asserted
>> > (5) flash protection range can no longer be changed, until WP# is
>> >     deasserted
>> >
>> > In this way, flash protection is co-owned by hardware and software.
>> >
>> > Now, one would expect to be able to perform step (3) with
>> > ioctl(MEMLOCK), except that the spi-nor driver does not set the Status
>> > Register Protect bit (a.k.a. Status Register Write Disable (SRWD)), so
>> > even though the range is now locked, it does not satisfy step (5) -- i=
t
>> > can still be changed by a call to ioctl(MEMUNLOCK).
>> >
>> > So, let's enable status register protection after the first lock
>> > command.
>> >
>> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>> > ---
>> >  drivers/mtd/spi-nor/spi-nor.c |    3 +++
>> >  1 file changed, 3 insertions(+)
>> >
>> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-n=
or.c
>> > index 3a08aa53c171..46da6bb706fa 100644
>> > --- a/drivers/mtd/spi-nor/spi-nor.c
>> > +++ b/drivers/mtd/spi-nor/spi-nor.c
>> > @@ -518,6 +518,9 @@ static int stm_lock(struct spi_nor *nor, loff_t of=
s, uint64_t len)
>> >
>> >         status_new =3D (status_old & ~mask) | val;
>> >
>> > +       /* Disallow further writes if WP pin is asserted */
>> > +       status_new |=3D SR_SRWD;
>> > +
>>
>> No need to clear SR_SRWD in stm_unlock?
>
> Good point.
>
> I actually had thought about that earlier, but I didn't come up with a
> great plan, and then I forgot about it when I was preparing this RFC. I
> don't think we want *all* "unlock" operations to unprotect the status
> register. What if we had the whole flash locked, and we're just calling
> unlock on the top half, with the intention of leaving the bottom half
> protected still?
>

Right.

> So, maybe we want to clear SR_SRWD only when we unlock the *entire*
> flash? What do you think?
>

How about this:

1) ioctl(MEMLOCK) the entire flash (SR_SRWD is set)
2) ioctl(MEMUNLOCK) partially (SW_SRWD keeps set)
3) ioctl(MEMLOCK) the entire flash again

Not sure this use case make sense, but would (3)  be allowed given
SW_SRWD is set?
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
