Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aP90r-0004bo-4Y
 for linux-mtd@lists.infradead.org; Fri, 29 Jan 2016 13:23:00 +0000
Received: by mail-wm0-x232.google.com with SMTP id p63so68337488wmp.1
 for <linux-mtd@lists.infradead.org>; Fri, 29 Jan 2016 05:22:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20160128194836.GA63180@google.com>
References: <1453960307-10181-1-git-send-email-computersforpeace@gmail.com>
 <1453960307-10181-5-git-send-email-computersforpeace@gmail.com>
 <CAAEAJfC6HM6M0ZJuEqj-=QUUs9+kHJB0m5bt2t9a-VYuiMPx4Q@mail.gmail.com>
 <20160128175905.GA33340@google.com>
 <CAAEAJfDHRutp1R1nKxih-4CENBsjhmFaaTnqD7S6Vub+pqE05Q@mail.gmail.com>
 <20160128194836.GA63180@google.com>
Date: Fri, 29 Jan 2016 10:22:34 -0300
Message-ID: <CAAEAJfAPbLX9_OOWoUEsVOdUh2DOD+k425u7JkAanjUQxm8MWA@mail.gmail.com>
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

On 28 January 2016 at 16:48, Brian Norris <computersforpeace@gmail.com> wro=
te:
> On Thu, Jan 28, 2016 at 04:24:50PM -0300, Ezequiel Garcia wrote:
>> On 28 January 2016 at 14:59, Brian Norris <computersforpeace@gmail.com> =
wrote:
>> > So, maybe we want to clear SR_SRWD only when we unlock the *entire*
>> > flash? What do you think?
>
> I'll paste in the relevant datasheet details from w25q32fw, to make sure
> we're on the same page here, noting that 'SRP0' is our 'SR_SRWD', and
> we're not touching SRP1 (i.e., SRP1=3D0):
>
>  "SRP1=3D0, SRP0=3D0, /WP=3DX: Software Protection
>     /WP pin has no control. The Status register can be written to after
>     a Write Enable instruction, WEL=3D1. [Factory Default]
>   SRP1=3D0, SRP0=3D1, /WP=3D0: Hardware Protected
>     When /WP pin is low the Status Register locked [sic] and cannot be
>     written to.
>   SRP1=3D0, SRP0=3D1, /WP=3D1: Hardware Unprotected
>     When /WP pin is high the Status register is unlocked and can be
>     written to after a Write Enable instruction, WEL=3D1."
>

Yes, we are on the same page.

>> How about this:
>>
>> 1) ioctl(MEMLOCK) the entire flash (SR_SRWD is set)
>> 2) ioctl(MEMUNLOCK) partially (SW_SRWD keeps set)
>> 3) ioctl(MEMLOCK) the entire flash again
>
> I might be confused; are you making a suggestion of a new behavior, or
> are you just trying to clarify my proposal? Because this sounds like it
> matches my proposal.
>

I was trying to clarify how the SRWD would work in that case, but I
forgot about /WP when I asked that!

>> Not sure this use case make sense,
>
> I suppose it could make sense, if you (e.g.) have some intermediate
> steps toward determining the locked regions during factory programming.
> Maybe a process would start by doing #1 and #2, then decide
> conditionally whether to do #3. And only after the whole process is done
> does something assert /WP=3D0 (in my case, a factory process would tie /W=
P
> low).
>
>> but would (3)  be allowed given
>> SW_SRWD is set?
>
> Yes, if /WP=3D1 (high).
>

Right. So, after giving some more thought do this, I'd say it might
make sense to clear SRWD only when unlocking the entire flash. If
anything else, it would allow a path to disable hardware protection on
the lock range?

--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
