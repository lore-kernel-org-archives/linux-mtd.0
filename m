Received: from relay1.mail.timico.net ([62.121.20.91] helo=relay.timico.net)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SL2Mm-0003ob-Jp
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2012 01:10:36 +0000
From: Jon Povey <Jon.Povey@racelogic.co.uk>
To: Brian Norris <computersforpeace@gmail.com>, Mike Dunn
 <mikedunn@newsguy.com>
Content-Class: urn:content-classes:message
Date: Fri, 20 Apr 2012 02:10:24 +0100
Subject: RE: [PATCH 1/2] mtd: nand: add OOB argument to NAND {read,
 write}_page interfaces
Message-ID: <70E876B0EA86DD4BAF101844BC814DFE0BF6014363@Cloud.RL.local>
In-Reply-To: <CAN8TOE_u9or8b+ZapRqD8XwV8abUDNXBtmAeBwDNiZ8aAs-Mdw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 "prabhakar@freescale.com" <prabhakar@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

linux-mtd-bounces@lists.infradead.org wrote:
> {read, write}_page interfaces
>
> Hi Mike,
>
> On Thu, Apr 19, 2012 at 9:50 AM, Mike Dunn
> <mikedunn@newsguy.com> wrote:
>> On 04/17/2012 08:44 PM, Brian Norris wrote:
>>
>>> Now, in future revisions of this ASIC, it may be possible to access
>>> OOB via DMA as well, but even if this happens, it doesn't make a lot
>>> of sense on this hardware to *always* pull OOB data.
>>
>>
>> No, it doesn't.  In fact, I'm not aware of any code within or on top
>> of mtd that does anything with the oob data when a page is read.  If
>> oob is needed, mtd_read_oob() is used.
>
> I guess this may not be an issue for page read, but I know one use for
> write_page data+OOB. MLC NAND, for instance, requires that you write
> *once* to a page, so I introduced ioctl(MEMWRITE) which generically
> allows page, OOB, or both to be written. This trickles down to the
> nand_ecc_ctrl.write_page function, I think. There are probably other
> cases that I'm not really thinking of right now.

Ability to write raw OOB including userland software-generated ECC is
needed for Linux to be able to update the bootloader on certain TI
DaVinci chips at least. This is because the ROM bootloader in the chip
has a wacky/bugged idea of OOB layout.

If you can do that you can also write MTD partitions in a different layout
from the one you are supporting, e.g. as part of a firmware update to a
kernel with a different filesystem and OOB layout. I have used this to
good effect.

I can think of a slightly obscure use for reading OOB on these TI chips:
Once booted to Linux, you could read and check in software the ECC for
the ROM bootloader looking for bitflips, and rewrite the bootloader if
it was starting to degrade. The bootloader has no way to rewrite or report
ECC corrections, you see. I have not done this myself.

In theory nobody should ever need to worry about OOB+ECC but being able
to fiddle with it has its uses and I hope that ability doesn't go away.

--
Jon Povey
jon.povey@racelogic.co.uk

Racelogic is a limited company registered in England. Registered number 274=
3719 .
Registered Office Unit 10, Swan Business Centre, Osier Way, Buckingham, Buc=
ks, MK18 1TB .

The information contained in this electronic mail transmission is intended =
by Racelogic Ltd for the use of the named individual or entity to which it =
is directed and may contain information that is confidential or privileged.=
 If you have received this electronic mail transmission in error, please de=
lete it from your system without copying or forwarding it, and notify the s=
ender of the error by reply email so that the sender's address records can =
be corrected. The views expressed by the sender of this communication do no=
t necessarily represent those of Racelogic Ltd. Please note that Racelogic =
reserves the right to monitor e-mail communications passing through its net=
work
