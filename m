Date: Fri, 14 Jan 2005 11:00:11 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: matrix lau <matrix_lau@yahoo.com>
In-Reply-To: <20050114104833.41929.qmail@web61207.mail.yahoo.com>
Message-ID: <Pine.LNX.4.58.0501141058490.17331@phoenix.infradead.org>
References: <20050114104833.41929.qmail@web61207.mail.yahoo.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: 2k Page support for the mtd driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ah, you use dd to put image. That's may cause problems.

Use nandwrite utility instead.

On Fri, 14 Jan 2005, matrix lau wrote:
> Hi.
> 
> I am using the 2K page nand flash [NAND device:
> Manufacturer ID: 0xec, Chip ID: 0xf1 (Samsung NAND
> 128MiB 3,3V 8-bit)] in the ARM system, and the nand
> driver was modified according to the NAND controller.
> 
> Now, I face a problem in mounting the JFFS2 system.
> After program the JFFS2 to the mtdblock/2 by the
> following cmd: dd if=JFFS2_FILE of=/dev/mtdblock/2
> bs=128, then I mount it, the first time, it's ok.
> 
> However after umount then I mount it again, it can't
> be mount again and with the following message: 
> 
> mount: wrong fs type, bad option, bad superblock on
> /dev/mtdblock/2, or too many mounted file systems
> 
> I try with the 512 page device and it's ok, but
> problems exists in 2Kpage nand.
> 
> 
> Can any one help in the above issue?
> 
> Thanks
> Matrix
> 
> __________________________________________________
> Do You Yahoo!?
> Tired of spam?  Yahoo! Mail has the best spam protection around 
> http://mail.yahoo.com 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
