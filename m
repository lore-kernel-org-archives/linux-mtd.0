Received: from gate.epygi.de ([212.126.211.241] helo=epygi.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16vxSe-0000wU-00
	for <linux-mtd@lists.infradead.org>; Fri, 12 Apr 2002 10:35:16 +0100
From: "Stephan Linke" <Stephan.Linke@epygi.de>
To: "Mike Mattice" <mike@forestsidingsupply.com>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: PATCH: ability to build blkmtd into the kernel and still use it 
Date: Fri, 12 Apr 2002 11:35:17 +0200
Message-ID: <FCEAKDJJAPHPLJFINDAJEECDCEAA.Stephan.Linke@epygi.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <E16vkQ4-0005zG-00@spoinky.renegade.org.uk>
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

Hint: It is (theoreticaly) possible to add a new device in init/main.c if
you are missing one. (I did so.) They make a simple mapping of names to
major/minor device numbers.

Stephan

> ...
>
>
> Hi,
>
> The blkmtd.c in 2.4.18 should already have the code in it to take a kernel
> argument (blkmtd_device).
>
> The reason you cant use /dev/discs/... is because you may not
> have a root fs
> at the time the module is initialised in the kernel (esp if you are
> using the device as the root device). Therefore the only names allowed
> are those sepecified in init/main.c (ie you have to use the non
> devfs name)
> When compiled and built into the kernel it uses name_to_kdev_t to get the
> major/minor.
>
>
> cheers
> si
>
> >
> > ...
> >
>
> ...
