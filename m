Received: from inp.nsk.su ([193.124.167.24] helo=inpbox.inp.nsk.su)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bp76J-0005TF-Ry
	for linux-mtd@lists.infradead.org; Mon, 26 Jul 2004 11:09:17 -0400
Date: Mon, 26 Jul 2004 22:00:47 +0700
From: "Dmitry A. Fedorov" <D.A.Fedorov@inp.nsk.su>
To: Andy Hawkins <a.hawkins@cabletime.com>
In-Reply-To: <1090853366.2220.11.camel@adh>
Message-ID: <Pine.SGI.4.10.10407262153220.569820-100000@Sky.inp.nsk.su>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problem writing to NOR flash
Reply-To: D.A.Fedorov@inp.nsk.su
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 26 Jul 2004, Andy Hawkins wrote:

> > > Have you had any problems writing to NOR?
> > 
> > No, after upgrade from the MTD snapshot.
> > There were problems with erase (ioctl call did not wait of
> > completion of erase operation) and jffs2 did not allowed to
> > write. Now it works properly.
> 
> Ah, should have been more clear. This is a 'raw' write to the NOR
> device. It appears that it's crashing inside do_xxlock_oneblock in
> cfi_cmdset_0002.c (where it does the 'cfi_write').
> There's a comment at the top of the code saying that it's very chip
> specific, and hasn't been tested on an interleaved device (which I think
> mine is).

I have use the same cmdset (exactly) but single (interleave 1) 16 bit
wide chip Am29LV640. No problems yet with backported code.
