Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17nOIe-0007V8-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Sep 2002 19:57:48 +0100
Date: Fri, 6 Sep 2002 20:57:47 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Xiaogeng (Shawn) Jin" <xjin@redswitch.com>
Cc: Kenneth Johansson <kenneth.johansson@etx.ericsson.se>,
   Mtd <linux-mtd@lists.infradead.org>
Subject: Re: writing to jffs2 is so slow?
Message-ID: <20020906185747.GB3885@wohnheim.fh-wedel.de>
References: <3D77C812.3080108@redswitch.com> <1031314138.28700.167.camel@spawn> <3D78E270.6020203@redswitch.com> <20020906174829.GA3885@wohnheim.fh-wedel.de> <3D78F4A1.4060304@redswitch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3D78F4A1.4060304@redswitch.com>
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

On Fri, 6 September 2002 11:32:01 -0700, Xiaogeng (Shawn) Jin wrote:
> >
> >Try eraseall from the utils.
> >With that, jffs2 just writes the erase markers to flash, 12 bytes per
> >erase block.
> 
> Well, that's just what I did. Then making a first directory takes 2 minutes.

Yes, you are right, silly me.

Without the erase markers, jffs2 does not trust those blocks. They
could have been deleted almost completely before a power fail. And
that little almost will cause random bit changes sometime liter, which
is bad.

You could maybe use mkfs.jffs2 with the -p option. Might work, but I
cannot check it right now.

Alternatively, you could hack the eraseall code, looking at mkfs.jffs2
for references, to write the erase markers into the flash.

Yet another alternative, you could write the erase markers via the
mtdblock device. Write one into a file, pad to erase block size,
append said file multiple times to itself and write it to flash.

Jörn

-- 
Victory in war is not repetitious.
-- Sun Tzu
