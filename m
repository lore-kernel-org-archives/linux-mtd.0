Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13K5k3-0004IA-00
	for mtd-list@infradead.org; Wed, 02 Aug 2000 22:07:55 +0100
Received: from mb04.swip.net ([193.12.122.208])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13K5k1-0004I2-00
	for mtd@infradead.org; Wed, 02 Aug 2000 22:07:54 +0100
Received: from win95 (dialup212-1-235.interloop.se [130.244.212.235])
          by mb04.swip.net (8.8.8/8.8.8) with SMTP
          id XAA05055 for <mtd@infradead.org>;
          Wed, 2 Aug 2000 23:06:50 +0200 (MET DST)
From: "Bjorn Eriksson" <mdeans@algonet.se>
To: <mtd@infradead.org>
Subject: Update: Simplified initrd on flash/ROM.
Date: Wed, 2 Aug 2000 23:07:58 +0200
Message-ID: <002c01bffcc5$bc74eec0$0800a8c0@win95.inteloop.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
In-Reply-To: <002801bffcac$7d84e8a0$0800a8c0@win95.inteloop.se>
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


>  Does anyone know why I'm not allowed to call ioremap() in
> i386/kernel/setup.c:setup_arch()? It fails with the message 'kmem_alloc=
:
> NULL ptr (name=3Dunknown)' when __ioremap() calls get_vm_area(size).

 Rudely replying to my self... I obviously didn't research this enough
before posting. The reason seems to be that the slab allocator isn't
initialised yet at this point so the kmalloc() call in get_vm_area() fail=
s.

 I guess I'll have to defer the initialisation till later on in the boot
process.


//Bj=F6rnen.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
