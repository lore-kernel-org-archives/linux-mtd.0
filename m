Received: from tiger.actrix.co.nz ([203.96.16.160] helo=blood.actrix.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192fQ0-0007S6-QX
	for <linux-mtd@lists.infradead.org>; Mon, 07 Apr 2003 23:48:49 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: "Jim Zeus" <jimzeus@vip.sina.com>,
	"David Woodhouse" <dwmw2@infradead.org>
Date: Tue, 8 Apr 2003 10:49:13 +1200
References: <20030404062136.7806.qmail@vip.sina.com>
	<1049449251.1980.90.camel@passion.cambridge.redhat.com>
	<004a01c2fcb4$8f61cf60$2a00a8c0@zhengjun>
In-Reply-To: <004a01c2fcb4$8f61cf60$2a00a8c0@zhengjun>
MIME-Version: 1.0
Message-Id: <20030407224847.CDA3D4019@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
cc: MTD mail list <linux-mtd@lists.infradead.org>
Subject: Re: [SPAM] FAT on NAND
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 07 Apr 2003 15:19, Jim Zeus wrote:
> > > What I am doing now is to build a filesystem which can be 
> > > recognized on _raw_ NAND flash. So, I think FAT will be the only
> > > choice(though I know it's very unstable). And I have following question
> > > now:

I think the easiest route would be to get  yaffs working under Windows. It 
works under WinCE already, which has a similar file system driver level.

> > 
> > Windows won't recognise raw NAND flash anyway. You'll have to write
> > _some_ kind of driver for Windows.
> > 
>
> 
> Since the MTD block device(which include nand.c,mtdcore.c 
> and mtdblock.c) is a block device, why I can't build
> any filesystem on it? 
> And, what's the difference between MTD block device and NFTL
> if they stay on the same layer? Even though I cant use NFTL
> because of some "silly patent problem" ,I still wanna know it,
> thanks.

The mtd drivers are pretty much Linux specific. They also carry a lot of 
stuff that is not really required to support a NAND-based file system.

The journaling file systems (YAFFS and JFFS2) do not use block drivers. They 
know about flash. It is this knowledge that gives them both efficiency and 
robusness. FAT file systems on NAND are inefficient and lack robustness 
because of the block driver layer (and to some degree because of FAT).

[snip]

> Then, maybe the lower layer (MTD or NFTL) support it? or all the
> stuff(a.b.c.d.e) are supported only by the file system 
> (JFFS2/YAFFS,I mean)?

I don't know about JFFS2, but YAFFS handles all robustness inside itself. I 
think JFFS2 does too.

> Thank you, but what is the SmartMedia format? Sorry I am not 
> familiar with that.

Look up the Samsung flash website or google for "SmartMedia specification".

This is the format for file systems using SmartMedia cards so that you get 
interoperability between cameras, PCs etc.

SmartMedia is like FAT.

> 
>
> > 
> > But really you should have a file system directly on the flash, not a
> > translation layer pretending to be a block device.
> > 
>
> 
> Do you mean build a totally new FS on a _bare_ NAND flash or on a MTD? 
> You are so right, but I must build a FS which Windows can 
> recognize and I have no enough time to do this before the time
> limit.

This is what YAFFS and JFFS2 do. They talk directly to the flash chips. mtd 
just gives a standard interface under Linux. 

YAFFS makes all its NAND accesses through 5 functions. Under Linux, these 
functions access mtd functions. Under other environments they are implemented 
in other ways. This makes it very easy to port.

The more difficult side is porting the top side of the file system (ie. where 
it interfaces to the operating system). There are functions in CVS to do this 
for WinCE - that would be a good starting point.
