Received: from blood.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AKwkb-0002fj-Di
	for <linux-mtd@lists.infradead.org>; Sat, 15 Nov 2003 09:29:53 +0000
From: Charles Manning <manningc2@actrix.gen.nz>
To: David Woodhouse <dwmw2@infradead.org>,
	Andre Sodermans <andreesje_werk@yahoo.com>
Date: Sat, 15 Nov 2003 22:34:56 +1300
References: <20031113231250.68456.qmail@web41509.mail.yahoo.com>
	<1068885798.29549.15.camel@imladris.demon.co.uk>
In-Reply-To: <1068885798.29549.15.camel@imladris.demon.co.uk>
MIME-Version: 1.0
Message-Id: <20031115092818.DFEAB4B6C@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: suggestion to extend life of ATA IDE flash drive
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 15 November 2003 21:43, David Woodhouse wrote:
> On Thu, 2003-11-13 at 15:12 -0800, Andre Sodermans wrote:
> > I did read the note By David on the very bottom of the
> > mtd homepage about compactflash IDE drives, but I have
> > been hearing different stories about this - somebody
> > mentioned that there exists an mtd-emulation. Is this
> > really true?
>
> Yes, â?? such an emulation. It's the 'blkmtd' device, which uses any block
> device (not just CF) as backing store for a faked MTD device.
>
> You can use JFFS2 on that. It's not wonderfully efficient, since every
> time we write a node to JFFS2 we end up rewriting a whole 512-byte
> 'sector' (or more). We should use the code we already _have_ for NAND
> flash, which batches writes to the medium (but handles fsync() etc.
> properly).
>
> Left as an exercise for the reader...

This surely does not get around the issue that the most vulnerable part of a 
CF system is the logical to physical mappings etc in the CF card. Thus, you 
might gain some wear levelling (maybe), but I don't think you're going to 
improve the robustness.

No magic bullet.
