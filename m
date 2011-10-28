Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RJjiD-0003rZ-RK
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2011 10:30:58 +0000
Message-ID: <4EAA845B.1020009@parrot.com>
Date: Fri, 28 Oct 2011 12:30:51 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Javier Martinez Canillas <martinez.javier@gmail.com>
Subject: Re: [RFC] Change ECC algorithm from userspace
References: <CAAwP0s059H3BGhYbYLux2gR6ZNb+sFDue676OM2Evz5cA2q6DA@mail.gmail.com>
In-Reply-To: <CAAwP0s059H3BGhYbYLux2gR6ZNb+sFDue676OM2Evz5cA2q6DA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: Enric Balletbo i Serra <eballetbo@iseebcn.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Javier Martinez Canillas a écrit :
> Hello,
> 
> I want to be able to use 1-bit ECC for the first partition where I
> save the loader binary and has to be accessed by the ROM boot but use
> a 4-bit ECC for my rootfs partition.
> 
> Does anyone have this same issue?
We use raw programming and compute the ecc in software.


> 
> What is the best approach to store data in a NAND device using
> different ECC techniques?
> 
> I've think of two approaches:
> 
> 1- Adding an ioctl to mtdchar (something like ECCSETBITS) to change
> the ECC technique used.
But this won't work if there is concurrent acess to mtd. One program may want 1
bit ecc other want 4 bits ecc.

> 2- Use a platform data field to notify the omap2 nand driver that the
> ROM boot only supports 1-bit ECC. So it can use a 1-bit ECC to write
> and read the first 4 sectors but a 4-bit ECC for the rest.
This may be better.

Matthieu

PS : note that some OMAP ROM support a better protection than Hamming (but the
details are not public AFAIK)

>From OMAP34xx Multimedia Device, Silicon Revision 3.1.x, public version :

Pages can contain errors caused by memory alteration. To correct these errors,
the ROM code uses ECC,
based on Hamming codes for SLC NAND and BCH (Bose, Ray-Chaudhuri, Hocquenghem)
code for
multilevel cell (MLC) devices. The computed ECC is compared to ECC stored in the
spare area of the
corresponding page. If there are uncorrectable errors, the ROM code returns with
FAIL.
