Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JWsLs-00008S-Q1
	for linux-mtd@lists.infradead.org; Wed, 05 Mar 2008 12:04:05 +0000
Date: Wed, 5 Mar 2008 13:03:20 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: =?utf-8?Q?Schl=C3=A4gl_Manfred_jun=2E?= <manfred.schlaegl@gmx.at>
Subject: Re: MTD and jffs2 mount problem on Linux-2.6.23 rc2
Message-ID: <20080305120320.GH6616@lazybastard.org>
References: <C3F2E592.DC63%gerickson@nuovations.com>
	<1B4F8000449511488D1A640DD6DECA3501EC25E3@MAILBOX0A.psi.ch>
	<1204710323.3599.12.camel@lisa.alm.archives.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1204710323.3599.12.camel@lisa.alm.archives.at>
Cc: linux-mtd@lists.infradead.org, Grant Erickson <gerickson@nuovations.com>,
	Dach Miroslaw <miroslaw.dach@psi.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 5 March 2008 10:45:23 +0100, Schlägl Manfred jun. wrote:
> Am Mittwoch, den 05.03.2008, 09:24 +0100 schrieb Dach Miroslaw:
> > 
> > losetup /dev/loop0 img2.jffs2  
> > mount -t jffs2 /dev/loop0 /mnt
> > 
> > unfortunately mount did not work.
> This can't work, because jffs2 is using the block-device mtdblock only
> to get device-information about the mtd-device. jffs2 itself is using
> the mtd-api directly. so jffs2 only on mtd.

Some people use loop and block2mtd to mount jffs2 images.  Hardly
elegant, but it seems to work.

Jörn

-- 
Don't worry about people stealing your ideas. If your ideas are any good,
you'll have to ram them down people's throats.
-- Howard Aiken quoted by Ken Iverson quoted by Jim Horning quoted by
   Raph Levien, 1979
