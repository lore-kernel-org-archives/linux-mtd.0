Received: from natpost.webmailer.de ([192.67.198.65] helo=post.webmailer.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 170NEl-0006gF-00
	for <linux-mtd@lists.infradead.org>; Wed, 24 Apr 2002 14:55:11 +0100
Received: from Prak1 (mail.gigastream.de [212.18.200.6] (may be forged))
	by post.webmailer.de (8.9.3/8.8.7) with SMTP id PAA00449
	for <linux-mtd@lists.infradead.org>; Wed, 24 Apr 2002 15:55:09 +0200 (MET DST)
From: "Patrik Fuchs" <pfuchs@giga-stream.de>
To: <linux-mtd@lists.infradead.org>
Subject: MTD partition help
Date: Wed, 24 Apr 2002 15:59:22 +0200
Message-ID: <MNEEJPPNAELHIHNGGLHOMECDCAAA.pfuchs@giga-stream.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hello!
I am  a complete newbie to this mtd mailing list and its subject.
I have a AMD flash  AM29F040B (512kB, 8 sectors) on a Walnut 405 GP board
and I want to partition this device. I have Hard Hat Linux 2.4.2 and I boot
it via PPC boot 1.1.5.  In the description from DENX PPC Boot and Linux
guide they say you have to define the partition in the board-specific
mapping routines, which can be seen in drivers/mtd/maps/. They took an
ICU862 board for example:
Static struct mtd_partition icu862_partitions[] = {
{   name: “kernel”,
     offset: 0,
      size: 1 << 20,
},
{
},
.
.and so on

I cannot find a similar configuration for my Walnut 405 GP board nor do I
find the maps directory in drivers/mtd. However I´ve found a file in the mtd
directory named cstm_cfi_jedec.c and I defined the partition there as a fit
of faintness.

static struct mtd_partition
cstm_cfi_jedec_partitions[PHYSMAP_NUMBER][MAX_PHYSMAP_PARTITIONS] = {
{
/*      {
                name: "main partition",
                size:  CONFIG_MTD_PHYSMAP_LEN,
                offset: 0,
        },
*/
       {                                             //example
                name: "ppcboot ",
                size: 192 << 10, // 3 Blocks
                offset: 0,
        },
        {
                name: "initrd ",                     //example
                size: 64 << 10, // 1 Block
                offset: 192 << 10,
        },
.
.and so on

But this did not work. Whenever I check the partition using  cat   /proc/mtd
I get only this:
Dev:     size     erasesize     name
…and nothing else although there are mtd entries from 0 to9 in the dev
directory.
Can someone help me out? Any hints where I am wrong? Thanx in advance
Patrik
