Received: from blood.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BQDoJ-0006Gh-4Z
	for linux-mtd@lists.infradead.org; Wed, 19 May 2004 00:15:47 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: Wookey <wookey@aleph1.co.uk>
Date: Wed, 19 May 2004 11:13:38 +1200
References: <20040517163945.GJ12570@knossos.aleph1.co.uk>
	<20040518070547.9FF6D5209@blood.actrix.co.nz>
	<20040518182003.GH12570@knossos.aleph1.co.uk>
In-Reply-To: <20040518182003.GH12570@knossos.aleph1.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20040518231540.D9BEC47D4@blood.actrix.co.nz>
cc: linux-mtd@lists.infradead.org
Subject: Re: blkmtd (and YAFFS)
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> > Both YAFFS anf JFFSx are journaling/log structured file systems. They can
> > cope with write failures and can handle unclean dismounts, but they
> > cannot recover data that has been lost; for that you need a RAID system
> > or such. A corruption in a CF card results in lost info which will not be
> > recoverable.
>
> Yes, but we are relying on the CF card controller to substitute bad sectors
> and essentialy say to the filesystem layer that 'everything is always OK'.
>
> The 'problem' we want to address is not using a filesystem that does a lot
> of writing in one place (e.g FAT cluster table on every write, ext2 inode
> tables on every write? (I don't know how spread about these are).

This assumes that the failure is caused by endurance issues and that the 
flash is "wearing out".  Given the number of times I've seen CF cards go 
stupid (even when very new and in very low usage) I doubt this theory very 
much. I suspect that the most common wonkiness is caused by logical to 
physical mapping errors or some such.
>
> A log-structure Filing system, even without the error-checking and
> bad-block detection, should still spread it's writes out relatively
> helpfully.
>
> Are you sure it's of no benefit to use them over a CF controller?
>

Perhaps there is, but my main point is that no matter what you balance on top 
of CF you can't see stuff that got lost by some internal CF screwup.

Where a log structured or transaction based fs should help is in being able 
to at least save some parts of the fs that might get lost in a FAT fsor might 
help recover data that goes missing (by using a back-up).

Of course the less you write, the less chance there is of messing things up.

-- CHarles
