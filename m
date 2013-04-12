Message-ID: <5167A87A.3030002@aimvalley.nl>
Date: Fri, 12 Apr 2013 08:23:54 +0200
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: cfi_cmdset_0002: do_write_buffer timeouts
References: <CAN8TOE8dVYxBbb8MtozFio8dS-ypq14U8RuKTo38QcAtXM5Qrw@mail.gmail.com>
 <CAN8TOE8BRhgi_ep8xypA_OwF4qfJikztmUcc-+XDB7hjnopuUA@mail.gmail.com>
In-Reply-To: <CAN8TOE8BRhgi_ep8xypA_OwF4qfJikztmUcc-+XDB7hjnopuUA@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>, Kevin Cernekee <cernekee@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/11/13 11:00, Brian Norris wrote:
> [Sorry for the repeat email for some; Gmail switched me back to
> HTML-mode, so my previous email couldn't be delivered to the MTD list]
>
> Hi all,
>
> I'm having some trouble where I am getting timeouts in cfi_cmdset_0002.c:
>
> MTD do_write_buffer(): software timeout
>
> I'm using a 64Mbyte Spansion S29GL512 NOR flash:
>
> physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank.
> Manufacturer ID 0x000001 Chip ID 0x002301
>
> I can reproduce the timeout approximately 0.5% of the time on a simple
> reboot, mount UBI rootfs test. My system has CONFIG_HZ=250, and so the
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
> Any thoughts from any interested (or uninterested) party would be useful.
>
> Thanks,
> Brian
>


This:

http://lkml.org/lkml/2009/9/3/84

maybe your problem.

Try disabling CONFIG_NO_HZ and you know for sure.

---
Norbert
