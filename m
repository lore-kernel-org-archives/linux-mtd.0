Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Sxss-0007Fu-00
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jan 2002 10:10:30 +0000
Date: Tue, 22 Jan 2002 11:21:04 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Adam Wozniak <adam.wozniak@comdev.cc>, linux-mtd@lists.infradead.org
Subject: Re: optimum geometry
Message-ID: <20020122112104.C27725@wohnheim.fh-wedel.de>
References: <3C487D9A.D85DDC3D@comdev.cc> <3C48504B.68F8FE7F@comdev.cc> <20020118010528.A22777@swing.comdev.cc> <28158.1011372920@redhat.com> <3C487D9A.D85DDC3D@comdev.cc> <4896.1011653373@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4896.1011653373@redhat.com>; from dwmw2@infradead.org on Mon, Jan 21, 2002 at 10:49:33PM +0000
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

Hi!

> >  I'm beginning to fear that this is far from optimum.  What is an
> > optimum erase block size?
> 
> As small as possible. The free space required by JFFS2 is measured in 
> blocks. It could probably be reduced to 2 or 3 blocks from the current 5/6 
> but will always be a straight multiple of blocksize, I think.

I partially disagree. You are absolutely right about the "unused"
blocks. But with mkfs.jffs2, I create smaller images with a blocksize
of 128k, than with a blocksize of 64k. This makes sense, as jffs[12]
must store some information per eraseblock, so fewer eraseblocks mean
less overhead.
In effect, there is an optimal erase block size, depending on the size
of your filesystem, where the sum of both effects is minimal. But in
most currently practical cases, the smallest possible is still the
best.

Jörn

-- 
Remember that not getting what you want
is sometimes a wonderful stroke of luck.
