Received: from wproxy.gmail.com ([64.233.184.203])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CZXx1-0007x4-2Z
	for linux-mtd@lists.infradead.org; Wed, 01 Dec 2004 12:07:37 -0500
Received: by wproxy.gmail.com with SMTP id 36so389500wri
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Dec 2004 09:07:34 -0800 (PST)
Message-ID: <52249cdc04120109076dbd87@mail.gmail.com>
Date: Wed, 1 Dec 2004 12:07:33 -0500
From: Joe Barnett <joseph.barnett@gmail.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <52249cdc04120108252c04aaf3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
References: <52249cdc04120108252c04aaf3@mail.gmail.com>
Subject: Re: Multiple Flash Bank Enumeration
Reply-To: Joe Barnett <joseph.barnett@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Success!  It comes down to a false posative in the way we probe for
the QRY of the devices. I found this ("[PATCH] Interleave order while
probing") thread from Tue Oct 19 17:03:33 EDT 2004 describing a
simular behavior. I made the fix Scott Wood suggested and I am seeing
exactly what I should. Thanks in advance for any of you whom may have
been looking into this;-)



On Wed, 1 Dec 2004 11:25:25 -0500, Joe Barnett <joseph.barnett@gmail.com> w=
rote:
> I am having an issue with multiple flash bank enumeration.  I have two
> banks of flash, each consisting of 2 x16 Intel Strata flash chips. I
> am creating two maps (in the same mapping file) and preforming a probe
> in each case. The interesting thing is that in the first probe MTD
> sees a 1x32 flash in 32-bit mode. In the second probe MTD sees a 2 x
> 16 flash in 32-bit mode. Furthermore during the first probe, the
> actual size returned in the mtd_info->size  is 0x1000000, where the
> size of the secondis correct at 0x2000000. Can anyone clue me in as to
> what might be the issue? Here is a code snippet of my map file:
>=20
> _______________[BEGIN CODE SNIPPET]_______________
>=20
> static struct map_info myflash_map[] =3D {
>         {
>                 .name =3D FLASH_CS0_NAME,
>                 .size =3D FLASH_EXT_FLASH_SIZE_ACTUAL,
>                 .bankwidth =3D 4,
>                 .phys =3D FLASH_EXT_FLASH_BASE_1
>         },
>         {
>                 .name =3D FLASH_CS1_NAME,
>                 .size =3D FLASH_EXT_FLASH_SIZE_ACTUAL,
>                 .bankwidth =3D 4,
>                 .phys =3D FLASH_EXT_FLASH_BASE_2
>         },
> };
>=20
> static struct mtd_info *flash[2];
> static struct mtd_info *chunk;
>=20
> static int __init init_myflash(void)
> {
>     int                dev_cnt =3D 0,
>                        i       =3D 0;
>         for (i =3D 0; i < NUM_FLASH_BANKS; i++) {
>=20
>                 printk(KERN_NOTICE "Flash device : expected lentgh : 0x%l=
x at 0x%lx\n",
>                          myflash_map[i].size,
>                          myflash_map[i].phys);
>=20
>                 myflash_map[i].virt =3D (unsigned long)ioremap_nocache(my=
flash_map[i].phys,
>                                                 myflash_map[i].size);
>=20
>                 if (!myflash_map[i].virt) {
>                         printk("Failed to ioremap_nocache\n");
>                         return -EIO;
>                 }
>                 simple_map_init(&myflash_map[i]);
>=20
>                 if(NULL !=3D (flash[i]     =3D do_map_probe("cfi_probe", =
  &myflash_map[i] )) {
>                         flash[i]->owner =3D THIS_MODULE;
>                         ++dev_cnt;
>                        printk("Probe chip returned size : 0x%lx\n",
> flash[i]->size);
>                 }
>                 else {
>                         iounmap((void *)myflash_map[i].virt);
>                 }
>         }
>         if(dev_cnt >=3D 2) {
>                 /* Combine the two flash banks into a single MTD device &=
 register it: */
>                 chunk =3D mtd_concat_create(flash, 2, "Flash Banks 0 and =
1");
>                 if(chunk) {
>                      add_mtd_device(chunk);
>                 }
>         }
>         return(dev_cnt ? 0 : -ENXIO);
> }
>=20
> _______________[END CODE SNIPPET]_______________
>=20
> Here is some debugging info that I have been able to generate. My
> primary confustion is how, each bank could be found as different types
> as they are the same. This worked fine in 2.6.7, minus the bankwidth
> modification recently introduced. In the qry_present function I pust
> an extra printk that dumps the CFI structure, and if one is found,
> then prints out the whole private content of the found device. Here is
> the debugging that I gathered... for both banks:
>=20
> ________________[BEGIN DEBUG INFO]__________________________
>=20
> devilBox:/# modprobe myflash
> Flash device : expected length : 0x2000000 at 0xa0000000
>=20
> genprobe_new_chip : MIN chips : 0x1 : MAX chips : 0x4 : Interleave
> (nr_chips): 0x1
> QUERY PEEK:
>                  Cmdset     0x0
>              Interleave 0x1
>              Dev Type   0x1
>              CFI Mode   0x0
>              Unlock 1   0x0
>              Unlock 2   0x0
>              Num Chips  0x0
>              Chip Shift 0x0
> Skipping QRY not present
> QUERY PEEK:
>                  Cmdset     0x0
>              Interleave 0x1
>              Dev Type   0x2
>              CFI Mode   0x0
>              Unlock 1   0x0
>              Unlock 2   0x0
>              Num Chips  0x0
>              Chip Shift 0x0
> Skipping QRY not present
> QUERY PEEK:
>                  Cmdset     0x0
>              Interleave 0x1
>              Dev Type   0x4
>              CFI Mode   0x0
>              Unlock 1   0x0
>              Unlock 2   0x0
>              Num Chips  0x0
>              Chip Shift 0x0
> FOUND CHIP : Setting up
> Number of erase regions: 1
>   Erase Region #0: BlockSize 0x20000 bytes, 128 blocks
> FLASH MFR : 0x89 : ID : 0x2
> User Flash Bank 0: Found 1 x32 devices at 0x0 in 32-bit bank
> Primary Vendor Command Set: 0001 (Intel/Sharp Extended)
> Primary Algorithm Table at 0031
> Alternative Vendor Command Set: 0000 (None)
> No Alternate Algorithm Table
> Vcc Minimum:  2.7 V
> Vcc Maximum:  3.6 V
> No Vpp line
> Typical byte/word write timeout: 256 =B5s
> Maximum byte/word write timeout: 512 =B5s
> Typical full buffer write timeout: 512 =B5s
> Maximum full buffer write timeout: 1024 =B5s
> Typical block erase timeout: 1024 ms
> Maximum block erase timeout: 4096 ms
> Chip erase not supported
> Device size: 0x1000000 bytes (16 MiB)
> Flash Device Interface description: 0x0001
>   - x16-only asynchronous interface
> Max. bytes in buffer write: 0x40
> Number of Erase Block Regions: 1
> settings DevSize/Chipshift: 0x18 : Chip Max : 0x2
> QUERY PEEK:
>              Cmdset     0x0
>              Interleave 0x1
>              Dev Type   0x4
>              CFI Mode   0x1
>              Unlock 1   0x0
>              Unlock 2   0x0
>              Num Chips  0x1
>              Chip Shift 0x18
> Skipping QRY not present
> Probing : 0x1000000: Chip Max 0x2
>  Intel/Sharp Extended Query Table at 0x0031
> cfi_cmdset_0001: Erase suspend on write enabled
> number of CFI chips: 1
> Using buffer write method
> Probe chip returned size : 0x1000000
>=20
> Flash device: expected length 0x2000000 at 0xa2000000
> genprobe_new_chip : MIN chips : 0x1 : MAX chips : 0x4 : Interleave
> (nr_chips): 0x1
>=20
> QUERY PEEK:
>              Cmdset     0x0
>              Interleave 0x1
>              Dev Type   0x1
>              CFI Mode   0x0
>              Unlock 1   0x0
>              Unlock 2   0x0
>              Num Chips  0x0
>              Chip Shift 0x0
> Skipping QRY not present
> QUERY PEEK:
>                  Cmdset     0x0
>              Interleave 0x1
>              Dev Type   0x2
>              CFI Mode   0x0
>              Unlock 1   0x0
>              Unlock 2   0x0
>              Num Chips  0x0
>              Chip Shift 0x0
> Skipping QRY not present
> QUERY PEEK:
>              Cmdset     0x0
>              Interleave 0x1
>              Dev Type   0x4
>              CFI Mode   0x0
>              Unlock 1   0x0
>              Unlock 2   0x0
>              Num Chips  0x0
>              Chip Shift 0x0
> Skipping QRY not present
>=20
> genprobe_new_chip : MIN chips : 0x1 : MAX chips : 0x4 : Interleave
> (nr_chips): 0x2
>=20
> QUERY PEEK:
>                  Cmdset     0x0
>              Interleave 0x2
>              Dev Type   0x1
>              CFI Mode   0x0
>              Unlock 1   0x0
>              Unlock 2   0x0
>              Num Chips  0x0
>              Chip Shift 0x0
> Skipping QRY not present
> QUERY PEEK:
>                  Cmdset     0x0
>              Interleave 0x2
>              Dev Type   0x2
>              CFI Mode   0x0
>              Unlock 1   0x0
>              Unlock 2   0x0
>              Num Chips  0x0
>              Chip Shift 0x0
> FOUND CHIP : Setting up
> Number of erase regions: 1
>   Erase Region #0: BlockSize 0x20000 bytes, 128 blocks
> FLASH MFR : 0x89 : ID : 0x2
> User Flash Bank 1: Found 2 x16 devices at 0x0 in 32-bit bank
> Primary Vendor Command Set: 0001 (Intel/Sharp Extended)
> Primary Algorithm Table at 0031
> Alternative Vendor Command Set: 0000 (None)
> No Alternate Algorithm Table
> Vcc Minimum:  2.7 V
> Vcc Maximum:  3.6 V
> No Vpp line
> Typical byte/word write timeout: 256 =B5s
> Maximum byte/word write timeout: 512 =B5s
> Typical full buffer write timeout: 512 =B5s
> Maximum full buffer write timeout: 1024 =B5s
> Typical block erase timeout: 1024 ms
> Maximum block erase timeout: 4096 ms
> Chip erase not supported
> Device size: 0x1000000 bytes (16 MiB)
> Flash Device Interface description: 0x0001
>   - x16-only asynchronous interface
> Max. bytes in buffer write: 0x40
> Number of Erase Block Regions: 1
> settings DevSize/Chipshift: 0x19 : Chip Max : 0x1
>  Intel/Sharp Extended Query Table at 0x0031
> cfi_cmdset_0001: Erase suspend on write enabled
> number of CFI chips: 1
> Using buffer write method
> Probe chip returned size : 0x2000000
>=20
> ________________[END DEBUG INFO]__________________________
>=20
> I am confused how each device can show up differently in each probe,
> does anyone have any clues or pointers where I can go look? Thank you
> in advance,
>=20
> Kind regards,
> Joseph Barnett
>
