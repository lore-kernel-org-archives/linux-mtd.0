Date: Fri, 4 Feb 2005 11:58:33 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Rudi Engelbertink <rudi@unsec.nl>
In-Reply-To: <20050204112622.M33820@unsec.nl>
Message-ID: <Pine.LNX.4.58.0502041157560.29798@phoenix.infradead.org>
References: <20050204112622.M33820@unsec.nl>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: unable to get NAND oobinfo
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

What does cat /proc/mtd say ?

On Fri, 4 Feb 2005, Rudi Engelbertink wrote:
> Hi,
> 
> trying to get my nand driver (for compulab 586core board) on kernel 2.4.27
> working, i ran into the following problem:
> The driver is recognised and appears to work. That means I can read the mtdchar
> device but whin I'm trying to format the device, I recieve the message
> 'flash_eraseall: /dev/mtd3: unable to get NAND oobinfo'
> An strace replies with:
> open("/dev/mtd3", O_RDWR)               = 3
> ioctl(3, 0x80204d01, 0xbffffdf0)        = 0
> ioctl(3, 0x80c84d0a, 0xbffffd20)        = -1 ENOTTY (Inappropriate ioctl for
> device)
> At that moment it does an ioctl(fd, MEMGETOOBSEL, &oobinfo) but it looks
> like the device is not registered properly.
> 
> NAND device: Manufacture ID: 0xec, Chip ID: 0x76 (Samsung NAND 64MB 3,3V)
> 
> On the mailing list I found an email with the same question about this but no
> answer.
> Could you give me a hint about what is going wrong or a posible solution.
> 
> RGDS Rudi.
> -- 
> They that can give up essential liberty to obtain a little temporary
> safety deserve neither liberty nor safety.
>    Benjamin Franklin (1706-1790), Letter to Josiah Quincy, Sept. 11, 1773.
> GnuPG Key fingerprint = 706C E2AC 7AE2 BCEE 04EB  A962 0A75 7F9B 07A1 83E8
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
