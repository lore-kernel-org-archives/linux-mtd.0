Date: Sun, 15 Sep 2002 20:44:52 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: Erich Schubert <erich@debian.org>
cc: linux-mtd@lists.infradead.org
Subject: Re: recommended Filesystem for DoC?
In-Reply-To: <20020915175447.GB15367@bombadil.xmldesign.de>
Message-ID: <Pine.LNX.4.44.0209152032110.1176-100000@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Sun, 15 Sep 2002, Erich Schubert wrote:

> > The JFFS2 NAND support is almost complete -- just a few corner cases to be 
> > fixed up. AFAIK it should work on DoC without too much trouble -- after 
> > all, a DoC is just a bunch of NAND flash chips.
> 
> Can lilo or grub boot a system off a JFFS2 filesystem?

No. RedBoot has JFFS2 support and should manage with a little persuasion 
though.

> (with compression enabled... or i'll need my cramdiscs anyway)
> Is the JFFS2 in 2.4.19 new enough, or do i need additional patches?
> Which corner cases aren't fixed yet?

You need the newer code from CVS. It's mainly error handling and the 
subtleties of doing fsync() efficiently that are missing. And possibly 
details about using the DiskOnChip HW ECC instead of SW ECC, etc.

> What are the drawbacks with ext2 on a DoC using nftl?
> when i hopefully will never have to mount the filesystem rw?

If it's always readonly it's sane enough.

Hmmm... Pine on iPAQ with WaveLAN is surprisingly usable :)

-- 
dwmw2
