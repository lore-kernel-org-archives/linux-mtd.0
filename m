Received: from mail-pb0-f52.google.com ([209.85.160.52])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TtxuX-0002m5-GP
 for linux-mtd@lists.infradead.org; Sat, 12 Jan 2013 10:01:58 +0000
Received: by mail-pb0-f52.google.com with SMTP id ro2so1382219pbb.39
 for <linux-mtd@lists.infradead.org>; Sat, 12 Jan 2013 02:01:55 -0800 (PST)
Content-Type: text/plain; charset=iso-8859-1
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
Subject: Re: Implementing NAND driver on a PrimeCell SMC PL350 series
From: Daniel Tang <dt.tangr@gmail.com>
In-Reply-To: <alpine.DEB.2.00.1301111155250.13078@lnxricardw.se.axis.com>
Date: Sat, 12 Jan 2013 21:01:50 +1100
Content-Transfer-Encoding: quoted-printable
Message-Id: <6EBAA2A8-BB5B-47E8-9E89-4A4F2A5870BD@gmail.com>
References: <D9B11571-8012-4206-B903-A4C59B85F318@gmail.com>
 <alpine.DEB.2.00.1301111155250.13078@lnxricardw.se.axis.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On 11/01/2013, at 10:02 PM, Ricard Wanderlof <ricard.wanderlof@axis.com> =
wrote:

>=20
> On Fri, 11 Jan 2013, Daniel Tang wrote:
>=20
>> I'm trying to write a NAND driver for the PL350 memory controller.
>>=20
>> The problem is that the memory controller abstracts quite a lot of =
the processes needed to access the NAND. For example, the controller =
handles all the hardware controlling (like dealing with the CLE and ALE =
lines). This makes it difficult to write a driver that integrates =
cleanly with the current NAND subsystem of the kernel.
>>=20
>> The issue specifically is the cmd_ctrl function that my driver needs =
to provide. When the kernel needs to write a command and address, it =
calls the function multiple times to write all the information. E.g. set =
CLE, write command, set ALE, then write one byte of the page address at =
a time. The controller, on the other hand, needs all that information to =
be in a single write to the controller. It does this by embedding the =
command into the address and have the data value be the page address.
>=20
> Have you looked among the existing NAND controller drivers in =
drivers/mtd/nand to see if there's another driver which has similar =
requirements which you could use as a starting point? It's not unusual =
for NAND controllers to do some of the operations automatically, and the =
mtd framework supports this by letting you replace higher-level =
functions with functions from the driver, and not just the low-level =
functions such as hwcontrol and read_byte.
>=20
> /Ricard
> --=20
> Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden            www.axis.com
> Phone +46 46 272 2016                           Fax +46 46 13 61 30


I didn't know high level functions could be overridden. Most of the =
drivers I looked through didn't override the 'nand_command' function for =
example, so I wasn't aware it was possible.

As per your advice, I also read through some of the other NAND drivers. =
Although they didn't have anything similar to what I need, I have a good =
idea of where to head.=20

Thanks,=
