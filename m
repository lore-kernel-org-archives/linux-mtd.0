From: David Woodhouse <dwmw2@infradead.org>
To: tglx@linutronix.de
In-Reply-To: <1108404250.16612.327.camel@tglx.tec.linutronix.de>
References: <4210DB19.9000808@ateme.fr> <4210DEDB.DD35E2DE@st.com>
	<4210E6C3.9030208@ateme.fr>
	<1108404250.16612.327.camel@tglx.tec.linutronix.de>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Feb 2005 00:03:06 +0000
Message-Id: <1108425786.22597.6.camel@baythorne.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2_get_inode_nodes(): Data CRC failed on NAND device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-02-14 at 19:04 +0100, Thomas Gleixner wrote:
> On Mon, 2005-02-14 at 18:58 +0100, Frédéric Janot wrote:
> > >JFFS2 on NAND flash uses a page buffer. It is flushed to the flash when
> > >it is full, or when you do fsync, sync or umount.
> > >
> > Does that mean that I have to call fsync each time after fclose a file ?

Yes. It's precisely the same as with other file systems. If you write to
a file, close it and then lose power immediately, your data may be lost.
It's not guaranteed to be on the medium until you sync.

> > Even if I do not edit some files, I get this kind of error. Does that 
> > mean something (jffs2 itself or other) write some data to the flash all 
> > the time ?
> 
> No, jffs2 does not write data just for fun. There is some application,
> script, daemon writing/modifying file(s).

Or garbage collection, but in that case no data are lost. It was just
copying from one part of the flash to another, and the old copy will
still be intact.

-- 
dwmw2
