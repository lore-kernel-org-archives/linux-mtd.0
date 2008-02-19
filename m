Received: from smtp2.sssup.it ([193.205.80.100] helo=smpt2.sssup.it)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JRUZ4-0002tE-T6
	for linux-mtd@lists.infradead.org; Tue, 19 Feb 2008 15:39:28 +0000
Message-ID: <20080219163821.gmq5orqmcksgo8wg@feanor.sssup.it>
Date: Tue, 19 Feb 2008 16:38:21 +0100
From: trimarchi@gandalf.sssup.it
To: Mangesh Edake <m_edake@yahoo.com>
Subject: Re: JFFS2 as rootfs on DataFlash
References: <109598.62836.qm@web50805.mail.re2.yahoo.com>
In-Reply-To: <109598.62836.qm@web50805.mail.re2.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Quoting Mangesh Edake <m_edake@yahoo.com>:
Hi,
> Hello all,
>
> I am using atmel dataflash (AT45DB321D) to store the
> jffs2 image which is a rootfs. I am downloading the
> image to SDRAM and then writing this image to
> dataflash using uboot copy (cp) command like this,
> u-boot# cp 21000000 14a000 192000
>
> Once I boot the system, jffs2 is mounted as rootfs but
> then I continuously get the "Node header CRC failed"
> messages and then finally kernel panic with no init
> found.
>
> I'm using mkfs.jffs2 to create an image like,
> mkfs.jffs2 -p -l -e 0x2100 -s 0x210 -n -d
> /home/me/rootdir -o jffs2.img
>
Remove -s 0x210 is wrong. If you put the sector size
to 0x210 you have same tricky problem of the garbage
collector that during the live collect remove data,
because it thinks that is an hole.

> I am totally lost and cannot figure out the reason for
> the errors. I'd appericiate if anybody help to find
> out the reason.
>
> Following is the ouput LOG.
> ----------------------------
Clean all the dataflash before, or padding the size with 0xff
If using an u-boot system add the command for erasing dataflash.

Regards Michael


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
