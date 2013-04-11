Received: from va3ehsobe010.messaging.microsoft.com ([216.32.180.30]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UQDga-0002S6-LR
 for linux-mtd@lists.infradead.org; Thu, 11 Apr 2013 09:20:53 +0000
Message-ID: <516680B7.4070407@freescale.com>
Date: Thu, 11 Apr 2013 17:21:59 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: cfi_cmdset_0002: do_write_buffer timeouts
References: <CAN8TOE8dVYxBbb8MtozFio8dS-ypq14U8RuKTo38QcAtXM5Qrw@mail.gmail.com>
 <CAN8TOE8BRhgi_ep8xypA_OwF4qfJikztmUcc-+XDB7hjnopuUA@mail.gmail.com>
In-Reply-To: <CAN8TOE8BRhgi_ep8xypA_OwF4qfJikztmUcc-+XDB7hjnopuUA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, Kevin Cernekee <cernekee@gmail.com>,
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

=E4=BA=8E 2013=E5=B9=B404=E6=9C=8811=E6=97=A5 17:00, Brian Norris =E5=86=99=
=E9=81=93:
> [Sorry for the repeat email for some; Gmail switched me back to
> HTML-mode, so my previous email couldn't be delivered to the MTD list]
>
> Hi all,
>
> I'm having some trouble where I am getting timeouts in cfi_cmdset_0002.=
c:
>
> MTD do_write_buffer(): software timeout
>
> I'm using a 64Mbyte Spansion S29GL512 NOR flash:
>
> physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank.
> Manufacturer ID 0x000001 Chip ID 0x002301
>
> I can reproduce the timeout approximately 0.5% of the time on a simple
> reboot, mount UBI rootfs test. My system has CONFIG_HZ=3D250, and so th=
e
> timeout comes out to just 1 jiffy. I have to increase this timeout to
> at least 3 ticks to avoid the timeouts. (I've been running reboot
> tests successfully for several days with the timeout as 3 jiffies.)
>
> So my question is: what is the "best" way to decide these timeouts?
> I'm inclined to just increase the timeout (and to use the proper
> msecs_to_jiffies() macro, as a cleanup). But according to the
> datasheets (which agree with the comments in the code), the max time
> should be less than a millisecond. So simply increasing the timeout
> may in fact just be masking some other bug.
>
> Huang,
>
> I noticed you recently sent a patch that adjusts the timeout print
> message in do_write_buffer(). Have you had problems with this code
> recently?
>
yes. I am fighting with the timeout out now. :(

My chip is M29W256GL7AN6E.
physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank. Manufacturer=20
ID 0x000020 Chip ID 0x00227e


When I run the bonnie++/ubifs on the NOR. I will get a timeout=20
occasionally. Sometime it can passes the bonie++/ubifs test,
while sometimes it can not.
The timeout occurs at some fixed address, such as 0x4e0000, 0x520000. I=20
tried to extend the 1ms to 10ms for the buffer-write in do_write_buffer()=
.
But the bug still occurs.



(I also tested other Nor, such as Spansion S29GL256P10 and Micron=20
JS28F256M29EWL.
i do not meet the timeout issue with these two nor.)




thanks
Huang Shijie
