Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OhsnQ-0003MS-IQ
	for linux-mtd@lists.infradead.org; Sat, 07 Aug 2010 23:27:21 +0000
Received: by wwi14 with SMTP id 14so9936124wwi.18
	for <linux-mtd@lists.infradead.org>;
	Sat, 07 Aug 2010 16:27:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1280914408.19499.8.camel@localhost>
References: <1274599824-17530-1-git-send-email-vapier@gentoo.org>
	<1276352794.19028.122.camel@localhost>
	<1280914408.19499.8.camel@localhost>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Sat, 7 Aug 2010 19:26:57 -0400
Message-ID: <AANLkTikMrbK4B22Q=aa1zWmx_M-f_eqnKHcaZZb7qj9i@mail.gmail.com>
Subject: Re: [Uclinux-dist-devel] [PATCH 1/2] mtd: physmap: add
	physmap_unmapped_area() for no-mmu XIP
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David@blackfin.uclinux.org, uclinux-dev@uclinux.org, dedekind1@gmail.com,
	Paul@blackfin.uclinux.org, Schmidt <bernds_cb1@t-online.de>,
	David Howells <dhowells@redhat.com>, Mundt <lethal@linux-sh.org>,
	linux-mtd@lists.infradead.org, Greg Ungerer <gerg@uclinux.org>,
	uclinux-dist-devel@blackfin.uclinux.org,
	Bernd@blackfin.uclinux.org, McCullough <davidm@snapgear.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 4, 2010 at 05:33, David Woodhouse wrote:
> On Sat, 2010-06-12 at 17:26 +0300, Artem Bityutskiy wrote:
>> On Sun, 2010-05-23 at 03:30 -0400, Mike Frysinger wrote:
>> > Currently, romfs XIP doesn't work in flash memory (the kernel crashes
>> > with a null pointer dereference). =C2=A0The problem is that the mtd ph=
ysmap
>> > driver isn't setting up a get_unmapped_area pointer for the mtd
>> > partitions it creates.
>>
>> Pushed both to my l2-mtd-2.6.git / dunno.
>
> I'm confused by the second patch -- isn't this done in add_mtd_device()
> already, according to the device type?
>
> You're setting mtd_bdi_ro_mappable indiscriminately for all types of
> devices. For flash devices, that can be an issue -- if you schedule a
> userspace process while the kernel is writing to the flash, for example.
>
> If you want to allow XIP of writable flash devices, there's more to it
> than this.

can you can safely do XIP on writable flash devices ?  with nommu, you
certainly cant.  plus, it is only possible with certain filesystems
right ?  like ROMFS ?  and that's already r/o ...

if we delve a bit, what you're referring to is only possible i think
if this change is merged (we posted this back in Jan w/no feedback):
  mtd-physmap: add support users can assign the probe type in board files

otherwise, there's no way of declaring a physmap of a parallel nor
flash and having it end up with read-only capabilities ...
-mike
