Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13K2vK-0003eK-00
	for mtd-list@infradead.org; Wed, 02 Aug 2000 19:07:22 +0100
Received: from mb04.swip.net ([193.12.122.208])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13K2v8-0003eE-00
	for mtd@infradead.org; Wed, 02 Aug 2000 19:07:20 +0100
Received: from win95 (dialup212-1-235.interloop.se [130.244.212.235])
          by mb04.swip.net (8.8.8/8.8.8) with SMTP
          id UAA27345 for <mtd@infradead.org>;
          Wed, 2 Aug 2000 20:06:08 +0200 (MET DST)
From: "Bjorn Eriksson" <mdeans@algonet.se>
To: <mtd@infradead.org>
Subject: Simplified initrd on flash/ROM.
Date: Wed, 2 Aug 2000 20:07:16 +0200
Message-ID: <002801bffcac$7d84e8a0$0800a8c0@win95.inteloop.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
In-Reply-To: <Pine.LNX.4.21.0007312215380.4864-100000@carrot.linuxgrrls.org>
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


 Does anyone know why I'm not allowed to call ioremap() in
i386/kernel/setup.c:setup_arch()? It fails with the message 'kmem_alloc:
NULL ptr (name=3Dunknown)' when __ioremap() calls get_vm_area(size).

 I'm trying to instruct rd.c to read an initrd directly from my ROM which
I've mapped directly above RAM on my hardware. I've got 16MB RAM @ 0-15MB
and 1MB ROM @ 16MB. The actual code is: (BE_EMBEDDED_DEVICE is #defined)

#ifdef CONFIG_BLK_DEV_INITRD
  #if defined(BE_EMBEDDED_DEVICE)
	initrd_start =3D ioremap(EPROM_start+ROMDISK_start,
EPROM_size-ROMDISK_start); //remap ~ 1MB @ 16MB
	initrd_end =3D initrd_start+EPROM_size-ROMDISK_start;
  #else
    if (LOADER_TYPE) {
        initrd_start =3D INITRD_START ? INITRD_START + PAGE_OFFSET : 0;
        initrd_end =3D initrd_start+INITRD_SIZE;
        if (initrd_end > memory_end) {
            printk("initrd extends beyond end of memory "
                "(0x%08lx > 0x%08lx)\ndisabling initrd\n",
                initrd_end,memory_end);
            initrd_start =3D 0;
        }
    }
  #endif
#endif

 I'm trying to simplify my initrd set-up a bit. The old code was distinct=
ly
trial n' error using ROM disk - rom.c (O.Xymoron's modified loop.c I've
modified to work in 2.2.x). I'd rather use simple initrd support with gzi=
p
compression.


//Bj=F6rnen.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
