From: =?iso-8859-1?Q?Cal=F2_Massimo?= <m.calo@ctsgroup.it>
To: "ucLinux-Mtd@Lists. Infradead. Org" <Linux-Mtd@Lists.Infradead.Org>
Date: Fri, 23 Sep 2005 15:29:07 +0200
Message-ID: <002001c5c042$c76f1e90$050213ac@MCaloMobile>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Cc: dedekind@yandex.ru
Subject: Newly-erased Block...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi Artem,

	do you remember about my flash problem?

>>/>mount -t jffs2 /dev/mtdblock5 /mnt
>>/>Newly-erased block contained word 0x4c004c at offest 0x00040000
>>Newly-erased block contained word 0x4c004c at offest 0x00030000

I have found the cause : the Samsung S3C4510b when access to the memory =
use
the "cache" by default.
If you have to disable it (like while you program the flash) you have to =
'or
0x4000000 to the base address.

So I have modifyed the file "cfi_cmdset_0002.c" as follow :

	for esample: "do_erase_chip" function

		...
		chip->start |=3D 0x4000000; //my modify!!!!!!!!!!!!!

		chip->state =3D FL_ERASING;

		ENABLE_VPP(map);
=09
cfi_send_gen_cmd(0xAA,cfi->addr_unlock1,chip->start,map,cfi,......


I did the same for every "cfi_send_gen_cmd" : the 3rd parameter has been
ored to 0x4000000.

What do you think about this modify? Do you know a better way?

Now I still have one warning msg :=20
	"Warning: DQ5 raised while program operation was in progress,
however operation completed OK"
Can I ignore this msg?

Thanks!

	Massimo.
