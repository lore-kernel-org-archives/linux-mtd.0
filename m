Received: from mail-vb0-x22f.google.com ([2607:f8b0:400c:c02::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UQNJP-0003GN-7W
 for linux-mtd@lists.infradead.org; Thu, 11 Apr 2013 19:37:36 +0000
Received: by mail-vb0-f47.google.com with SMTP id x13so1569450vbb.34
 for <linux-mtd@lists.infradead.org>; Thu, 11 Apr 2013 12:37:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <516680B7.4070407@freescale.com>
References: <CAN8TOE8dVYxBbb8MtozFio8dS-ypq14U8RuKTo38QcAtXM5Qrw@mail.gmail.com>
 <CAN8TOE8BRhgi_ep8xypA_OwF4qfJikztmUcc-+XDB7hjnopuUA@mail.gmail.com>
 <516680B7.4070407@freescale.com>
Date: Thu, 11 Apr 2013 12:37:33 -0700
Message-ID: <CAN8TOE-Q8ez+urx1_h6an1LuQeJVe4yNAzGn-fUPLMYQgXUONg@mail.gmail.com>
Subject: Re: cfi_cmdset_0002: do_write_buffer timeouts
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=GB2312
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

On Thu, Apr 11, 2013 at 2:21 AM, Huang Shijie <b32955@freescale.com> wrote:
> =D3=DA 2013=C4=EA04=D4=C211=C8=D5 17:00, Brian Norris =D0=B4=B5=C0:
>> I'm having some trouble where I am getting timeouts in cfi_cmdset_0002.c=
:
>>
>> MTD do_write_buffer(): software timeout
>>
>> I'm using a 64Mbyte Spansion S29GL512 NOR flash:
>>
>> physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank.
>> Manufacturer ID 0x000001 Chip ID 0x002301
>>
>> I can reproduce the timeout approximately 0.5% of the time on a simple
>> reboot, mount UBI rootfs test. My system has CONFIG_HZ=3D250, and so the
>> timeout comes out to just 1 jiffy. I have to increase this timeout to
>> at least 3 ticks to avoid the timeouts. (I've been running reboot
>> tests successfully for several days with the timeout as 3 jiffies.)
>>
>> So my question is: what is the "best" way to decide these timeouts?
>> I'm inclined to just increase the timeout (and to use the proper
>> msecs_to_jiffies() macro, as a cleanup). But according to the
>> datasheets (which agree with the comments in the code), the max time
>> should be less than a millisecond. So simply increasing the timeout
>> may in fact just be masking some other bug.
>>
>> Huang,
>>
>> I noticed you recently sent a patch that adjusts the timeout print
>> message in do_write_buffer(). Have you had problems with this code
>> recently?
>>
> yes. I am fighting with the timeout out now. :(
>
> My chip is M29W256GL7AN6E.
> physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank. Manufacturer =
ID
> 0x000020 Chip ID 0x00227e
>
>
> When I run the bonnie++/ubifs on the NOR. I will get a timeout occasional=
ly.
> Sometime it can passes the bonie++/ubifs test,
> while sometimes it can not.
> The timeout occurs at some fixed address, such as 0x4e0000, 0x520000. I
> tried to extend the 1ms to 10ms for the buffer-write in do_write_buffer()=
.
> But the bug still occurs.

Well, our timeouts are a little different then. A larger timeout
solves all my problems. And my timeouts aren't at consistent
addresses. Here's a sampling of mine over the last few hours.

MTD do_write_buffer(): software timeout @ address 0x240b87e
MTD do_write_buffer(): software timeout @ address 0x248b6be
MTD do_write_buffer(): software timeout @ address 0x132067e
MTD do_write_buffer(): software timeout @ address 0x31712fe
MTD do_write_buffer(): software timeout @ address 0x3c0e0fe
MTD do_write_buffer(): software timeout @ address 0xd2037e
MTD do_write_buffer(): software timeout @ address 0x318043e
MTD do_write_buffer(): software timeout @ address 0x2a201fe
MTD do_write_buffer(): software timeout @ address 0x2a4f47e
MTD do_write_buffer(): software timeout @ address 0x2a3ef7e

> (I also tested other Nor, such as Spansion S29GL256P10 and Micron
> JS28F256M29EWL.
> i do not meet the timeout issue with these two nor.)

Brian
