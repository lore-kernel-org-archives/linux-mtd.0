Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1950LZ-0004AK-BH
	for <linux-mtd@lists.infradead.org>; Mon, 14 Apr 2003 10:33:53 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Russ Dill <Russ.Dill@asu.edu>
In-Reply-To: <1050111033.4189.1.camel@russ.local>
References: <3E9312BF.50009@mail.arc.nasa.gov>
	 <5.1.1.5.2.20030411130135.018a6698@mail.arc.nasa.gov>
	 <1050111033.4189.1.camel@russ.local>
Message-Id: <1050312832.32593.3.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 14 Apr 2003 10:33:52 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: Ilguiz Latypov <ilatypov@infradead.org>
Subject: Re: DoC + GRUB booting problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2003-04-12 at 02:30, Russ Dill wrote:
> >          The bootloader is definitely the M-Sys BIOS extension.  My 
> > impression is that for DoC 2000s, the BIOS extension is in a ROM that can't 
> > be changed.  I am still trying to verify that, but if its true, I have to 
> > deal with it.  If it can be changed, like in a DoC Millenium, I could be in 
> > business.
> 
> its not a ROM, its the first page of the DOC. Grub changes it over to
> looking like a network boot rom (as apposed to looking like a hard disk)

In the DiskOnChip Millennium you're correct -- it's loaded into RAM from
the first page of the flash at reset time.

In the DiskOnChip 2000, you have a very small amount of ROM which pulls
in a second-stage loader from the flash.

-- 
dwmw2
