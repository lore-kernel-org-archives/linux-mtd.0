Received: from outbox.allstream.net ([207.245.244.41])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LMoNu-0005uP-FH
	for linux-mtd@lists.infradead.org; Tue, 13 Jan 2009 18:53:09 +0000
Subject: Re: Writing a ubinize'd image to fresh NANDFlash with a burner
From: Pontus Hedman <pontushedman@navcast.com>
To: dedekind@infradead.org
In-Reply-To: <1231857915.5973.18.camel@localhost.localdomain>
References: <1231433726.16113.8.camel@phedman.navcastinc.local>
	<1231857915.5973.18.camel@localhost.localdomain>
Content-Type: text/plain
Date: Tue, 13 Jan 2009 13:53:01 -0500
Message-Id: <1231872781.16881.47.camel@phedman.navcastinc.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-01-13 at 16:45 +0200, Artem Bityutskiy wrote:
> On Thu, 2009-01-08 at 11:55 -0500, Pontus Hedman wrote:
> > So I have used ubinize to create a UBIFS image.  I would now
> > like to burn it to fresh-from-the factory blank nandflash
> > 
> > Do I just tell the burner to skip bad blocks on write, like nandwrite
> > does?
> > 
> > This will happen only once; after that Linux will mount the
> > filesystem and take of it itself.
> 
> I've updated UBI documentation and reflected what you asked there
> as well. Please, beware about the "skip 0xFF'ed pages" part. See here:
> 
> http://www.linux-mtd.infradead.org/doc/ubi.html#L_format_det

Thanks... let me see if I got this right (it's a bit complicated for
me):

I have a Xeltek SP5000 flasher.  It turns out that it wants its binary
image to have eraseblocks that *include* the OOB.  That is, it wants the
binary file I give it to contain 128KiB+2KiB byte blocks (consisting of
64 pages of 2048+64 bytes each) in the case of this nandflash.

The flasher *will* skip bad blocks while writing though, so I don't have
to worry about that. Recall, I'm writing to fresh-from-the factory flash
with whatever bad block markings they already put there.

Now, ubinize created an image for me with 128KiB block / 2048B pages.

I think all I have to do is insert 64 bytes of OOB data every 2048 bytes
in that image to make it compliant.  So I guess I would make that OOB
data be all 0xFFs so that the flash OOB parts are left alone?
-- 
Pontus Hedman
Navcast
