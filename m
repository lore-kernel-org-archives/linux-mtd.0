Received: from moutng.kundenserver.de ([212.227.126.177])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HxSF0-0002yM-Gr
	for linux-mtd@lists.infradead.org; Sun, 10 Jun 2007 14:34:21 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: =?utf-8?q?J=C3=B6rn_Engel?= <joern@lazybastard.org>
Subject: Re: [Patch 15/18] fs/logfs/super.c
Date: Sun, 10 Jun 2007 20:33:05 +0200
References: <20070603183845.GA8952@lazybastard.org>
	<200706101827.50948.arnd@arndb.de>
	<20070610173828.GA32619@lazybastard.org>
In-Reply-To: <20070610173828.GA32619@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200706102033.11211.arnd@arndb.de>
Cc: akpm@osdl.org, David Weinehall <tao@acc.umu.se>,
	Dongjun Shin <djshin90@gmail.com>, Kyle Moffett <mrmacman_g4@mac.com>,
	linux-mtd@lists.infradead.org, Pavel Machek <pavel@ucw.cz>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ulisses Furquim <ulissesf@gmail.com>, CaT <cat@zip.com.au>,
	Evgeniy Polyakov <johnpol@2ka.mipt.ru>, Roland Dreier <rdreier@cisco.com>,
	Jamie Lokier <jamie@shareable.org>, Pekka Enberg <penberg@cs.helsinki.fi>,
	Jan Engelhardt <jengelh@linux01.gwdg.de>,
	Thomas Gleixner <tglx@linutronix.de>, Bill Davidsen <davidsen@tmr.com>,
	Albert Cahalan <acahalan@gmail.com>,
	John Stoffel <john@stoffel.org>, linux-kernel@vger.kernel.org,
	Ondrej Zajicek <santiago@crfreenet.org>, linux-fsdevel@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday 10 June 2007, J=C3=B6rn Engel wrote:
> On Sun, 10 June 2007 18:27:49 +0200, Arnd Bergmann wrote:
> > On Sunday 03 June 2007, J=C3=B6rn Engel wrote:

> > How about using submit_bio here instead of going to the page cache?
> > That would avoid doubling all the memory consumption here.
>=20
> That may make sense, yes.  "May", because there is no simple mapping
> between physical data and logical data.  In ext3, everything is
> block-aligned, usually to 4KiB =3D=3D PAGE_SIZE.  So the exact same conte=
nt
> would exists in two pages.  In LogFS, data is compressed and
> byte-aligned.  A bdev page can contain several full objects that after
> uncompression get stored in one page each.

Then maybe the submit_bio logic should only be done for the ->write
path, not for ->read. The data that gets written out should already
be present in the page cache for the files, so there is not much point
having again, while you can see the read path as blockdev readahead:
When you read a physical block that contains a logical block, it's
likely to also contain part of another logical block that is going
to be read in the near future.

This way, you would also get exclusively clean pages in the block
device address_space, which can be easily discarded.

Also, maintaining correct ordering between write requests can be
done easier if you insert the bios directly, instead of waiting
for the lru writeback.

	Arnd <><
