Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AKw33-0002Rn-Km
	for <linux-mtd@lists.infradead.org>; Sat, 15 Nov 2003 08:44:54 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Andre Sodermans <andreesje_werk@yahoo.com>
In-Reply-To: <20031113231250.68456.qmail@web41509.mail.yahoo.com>
References: <20031113231250.68456.qmail@web41509.mail.yahoo.com>
Message-Id: <1068885798.29549.15.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sat, 15 Nov 2003 08:43:19 +0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
cc: linux-mtd@lists.infradead.org
Subject: Re: suggestion to extend life of ATA IDE flash drive
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-11-13 at 15:12 -0800, Andre Sodermans wrote:
> I did read the note By David on the very bottom of the
> mtd homepage about compactflash IDE drives, but I have
> been hearing different stories about this - somebody
> mentioned that there exists an mtd-emulation. Is this
> really true?

Yes, =E2=88=83 such an emulation. It's the 'blkmtd' device, which uses any =
block
device (not just CF) as backing store for a faked MTD device.

You can use JFFS2 on that. It's not wonderfully efficient, since every
time we write a node to JFFS2 we end up rewriting a whole 512-byte
'sector' (or more). We should use the code we already _have_ for NAND
flash, which batches writes to the medium (but handles fsync() etc.
properly).

Left as an exercise for the reader...


--=20
dwmw2
