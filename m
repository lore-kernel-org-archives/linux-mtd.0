Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 170UIQ-00078E-00
	for <linux-mtd@lists.infradead.org>; Wed, 24 Apr 2002 22:27:26 +0100
Message-ID: <3CC725F2.E0BDEDDE@mvista.com>
Date: Wed, 24 Apr 2002 14:38:58 -0700
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: Patrik Fuchs <pfuchs@giga-stream.de>
CC: linux-mtd@lists.infradead.org
Subject: Re: MTD partition help
References: <MNEEJPPNAELHIHNGGLHOMECDCAAA.pfuchs@giga-stream.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Patrik Fuchs wrote:

> Hello!
> I am  a complete newbie to this mtd mailing list and its subject.
> I have a AMD flash  AM29F040B (512kB, 8 sectors) on a Walnut 405 GP board
> and I want to partition this device. I have Hard Hat Linux 2.4.2 and I boot
> it via PPC boot 1.1.5.  In the description from DENX PPC Boot and Linux
> guide they say you have to define the partition in the board-specific
> mapping routines, which can be seen in drivers/mtd/maps/. They took an
> ICU862 board for example:
> Static struct mtd_partition icu862_partitions[] = {
> {   name: ?kernel?,
>      offset: 0,
>       size: 1 << 20,
> },
> {
> },
> .
> .and so on
>
> I cannot find a similar configuration for my Walnut 405 GP board nor do I
> find the maps directory in drivers/mtd. However I´ve found a file in the mtd
> directory named cstm_cfi_jedec.c and I defined the partition there as a fit
> of faintness.
>
> static struct mtd_partition
> cstm_cfi_jedec_partitions[PHYSMAP_NUMBER][MAX_PHYSMAP_PARTITIONS] = {
> {
> /*      {
>                 name: "main partition",
>                 size:  CONFIG_MTD_PHYSMAP_LEN,
>                 offset: 0,
>         },
> */
>        {                                             //example
>                 name: "ppcboot ",
>                 size: 192 << 10, // 3 Blocks
>                 offset: 0,
>         },
>         {
>                 name: "initrd ",                     //example
>                 size: 64 << 10, // 1 Block
>                 offset: 192 << 10,
>         },
> .
> .and so on
>
> But this did not work. Whenever I check the partition using  cat   /proc/mtd
> I get only this:
> Dev:     size     erasesize     name
> ?and nothing else although there are mtd entries from 0 to9 in the dev
> directory.
> Can someone help me out? Any hints where I am wrong? Thanx in advance
> Patrik
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

What does your cstm_cfi_jedec_board_desc array look like and also
what is PHYSMAP_NUMBER defined as?   Do you see any flash related prints
in the bootup?

Alice
