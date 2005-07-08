Received: from mail.professional-internet.de ([213.69.77.2]
	helo=hermes.professional-internet.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DqoXB-0005m8-2i
	for linux-mtd@lists.infradead.org; Fri, 08 Jul 2005 04:48:35 -0400
From: Ruediger Haertel <hae@port.de>
To: tglx@linutronix.de
Date: Fri, 8 Jul 2005 10:48:17 +0200
References: <200507061745.18226.hae@port.de> <200507071532.17991.hae@port.de>
	<200507071704.19393.hae@port.de>
In-Reply-To: <200507071704.19393.hae@port.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200507081048.18115.hae@port.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD/ DoC Millenium Plus - Failure in flash detection
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> > >
> > > Is this nanddump from latest MTD-CVS ?
> >
> > No. I use the one of the uClinux-dist-20041215. I'll give the one
> > from mtd-cvs a try. Should I use realy the latest snapshot or the
> > one I am using from date 2005.03.03.
>
> Now I used the nanddump from mtd-cvs 2005-03-03. The same result. It
> reads oobsize and oobblock as 0.
>
> I printed the values of the mtd structure during probing and they
> are: oob size: 16, oob block: 512
>
> Seems ok. So I guess my device file is not correct. I am
> using /dev/mtd5,c,90,9.
>

Stupid me. Of course it was the wrong device file. MTD Devices have an 
even minor number (mtd->index*2). The odd minor (mtd->index* 2+1) 
number is used for readonly device files. Now I use the device 
file /dev/mtd5,c,90,10.

Now I get output from nanddump. But I cannot see the file contents that 
I wrote to the DoC.

testfile: "0123456789ABCDEF"

/> nandwrite -p /dev/mtd5 /mnt/testfile
MTD_open
MTD_ioctl
MTD_ioctl
Writing data to block 0
MTD_ioctl
Bad block at 0, 1 block(s) from 0 willM be skipped
Writing dataT to block 4000
D_ioctl
MTD_write
MTD_close

Seems to have worked. However nanddump (I dumped the complete 16 MB) 
does not show the file contents on the DoC.
Do I have to format the DoC or do any other preparation? I thought that 
was only necessary with the "old" driver.

This is also my next step. Preparing for a filesystem. I think I have to 
format it with the ntfl_format tool and then mkfs.jff2. Right?


-- 

Ruediger Haertel
