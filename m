Received: from va3ehsobe005.messaging.microsoft.com ([216.32.180.31]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TxDnL-0006LF-7q
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2013 09:36:00 +0000
Message-ID: <50FD0BE9.3020506@freescale.com>
Date: Mon, 21 Jan 2013 17:35:37 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: question: Why the nand_wait() wait for 20ms for nand program.
References: <50F9023D.5040408@freescale.com> <50F93F65.90805@parrot.com>
 <50FCB75D.1000200@freescale.com> <50FD02EA.5050209@parrot.com>
 <50FD0554.8030108@freescale.com> <50FD073C.8050209@parrot.com>
 <50FD0981.8050507@freescale.com> <50FD0B3D.2070803@parrot.com>
In-Reply-To: <50FD0B3D.2070803@parrot.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B401=E6=9C=8821=E6=97=A5 17:32, Matthieu CASTET =E5=86=
=99=E9=81=93:
> Huang Shijie a =C3=A9crit :
>> =E4=BA=8E 2013=E5=B9=B401=E6=9C=8821=E6=97=A5 17:15, Matthieu CASTET =E5=
=86=99=E9=81=93:
>>> Huang Shijie a =C3=A9crit :
>>>>    =E4=BA=8E 2013=E5=B9=B401=E6=9C=8821=E6=97=A5 16:57, Matthieu CAS=
TET =E5=86=99=E9=81=93:
>>>>> Huang Shijie a =C3=A9crit :
>>>>>> =E4=BA=8E 2013=E5=B9=B401=E6=9C=8818=E6=97=A5 20:26, Matthieu CAST=
ET =E5=86=99=E9=81=93:
>>>>>>> Huang Shijie a =C3=A9crit :
>>>>>>>> Hi all:
>>>>>>>> Why the nand_wait() wait for 20ms for nand program. could we
>>>>>>>> expand this time to 40ms? I have a nand chip : Micron MT29F64G08=
CBABAWP.
>>>>>>>> The chip's BUSY/READY pin may needs more then 20ms to become rea=
dy,
>>>>>>>> though its
>>>>>>>> datasheet tells me the tPROG's max value is 2.5ms.
>>>>>>>>
>>>>>>> Don't you have an hardware problem (missing pullup/down on ready =
busy pin) ?
>>>>>>>
>>>>>>> If the datasheet say the max value is 2.5 ms , how it can be more=
 than 20 ms.
>>>>>> I finally found the root cause.
>>>>>>
>>>>>> I added the do_gettimeofday() in the nand_wait() to measure the
>>>>>> READY/BUSY time. The code is like this:
>>>>>> ---------------------------------------------------- code start
>>>>>>
>>>>> Could you dump jiffies and timeo in your code ?
>>>> The following just shows some part of the log:
>>>>
>>>> [my_nand_wait]status : 80,<21480, 21480>,<   665911, 664170>,<1, 174=
1>
>>>> [my_nand_wait]status : 80,<21480, 21480>,<   735989, 734626>,<1, 136=
3>
>>>> [my_nand_wait]status : 80,<21480, 21480>,<   805693, 804825>,<0, 868=
>
>>>>
>>>>    From the log, we can see that the kernel just waits for 1741us to=
 break
>>>> the while loop,
>>>> not 20ms.
>>>>
>>> Yes but you should display jiffies and timeo value to understand why =
the kernel
>>> thinks 2 jiffies elapsed.
>> I dumpped the jiffies and timeo too. The jiffies is really _equal_ to
>> the timeo, and then the while loop breaks.
>>
>> thanks for your comments.
>>
>> I think there is something wrong with the timer.
>>
> timeo +=3D (HZ * 20) / 1000;
>
> So what is the value of HZ ?
my CONFIG_HZ is 100.

thanks
Huang Shijie
> In order (HZ * 20) / 1000 is 0 HZ should be<  50.
>
>
> Matthieu
>
