Received: from proxy.force.de ([158.116.254.130])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18BdH3-0003K8-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Nov 2002 15:48:22 +0000
Received: from ex-deu-munich02.force.de (ex-deu-munich02.force.de [10.254.2.10])
	by proxy.force.de (8.11.4/8.11.4) with ESMTP id gACGIn229755
	for <linux-mtd@lists.infradead.org>; Tue, 12 Nov 2002 17:18:50 +0100 (MET)
Message-ID: <9CFB9DA5261CD611A29B00508B789048380A4F@ex-deu-munich02.force.de>
From: "Gettert, Wolfram" <Wolfram.Gettert@fci.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Problem writing to flash with writeb()
Date: Tue, 12 Nov 2002 17:18:46 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

Hallo,
I try to identify my flash with manufacturer id and device id.
Because I am using the 2.2.18 kernel and I want to be portable I
use the physmap_read/writeX() functions. They are defined as followed.=20

void physmap_writeX(struct map_info *map, __u8 d, unsigned long adr)
{
	__raw_writeX(d, map->map_priv_1 + adr);
	mb();
}

In the 2.2.18 __rawreadb is not defined so I have done this.

#define __raw_readX readX
#define __raw_writeX writeX


Now I want to identify the flash doing this

	volatile char *p;
	u32 manufacturer, device;
=09
  	physmap_map.map_priv_1 =3D (unsigned =
long)ioremap_nocache(WINDOW_ADDR,
WINDOW_SIZE);

	...
=09
	//Read Manufacturer and Device code=09
	physmap_write8(&physmap_map,0x90,physmap_map.map_priv_1);
	manufacturer =3D physmap_read8(&physmap_map,0);
	device =3D physmap_read8(&physmap_map,2);=09
	printk("Manufacturer Code: 0x%x\n",manufacturer);
	printk("Device Code: 0x%x\n",device);

The result in log is:

Manufacturer Code: 0xff
Device Code: 0xff

If I do it like this:

	p =3D physmap_map.map_priv_1;
	p[0] =3D 0x90;
	printk("Manufacturer Code: 0x%x\n",p[0]);
	printk("Device Code: 0x%x\n",p[2]);
=09
The result in log is:

Manufacturer Code: 0xffffff98
Device Code: 0xffffff9c

That's what I expect. *p needs to declared as volatile to let this =
work.
But I want to use readb ... Any ideas?

Thanks

Wolfram

--
Wolfram Gettert
Software Engineer=20
Force Computers GmbH
- A Solectron Company -
Lilienthalstr. 15=20
D-85579 Neubiberg/M=FCnchen
Wolfram.Gettert_at_fci.com
www.forcecomputers.com
