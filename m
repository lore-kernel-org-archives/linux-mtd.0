Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17h5xv-0005op-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Aug 2002 11:10:23 +0100
Date: Tue, 20 Aug 2002 12:10:20 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Conn Clark <clark@esteem.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Re: How does one mount an existing jffs2 partition so it is writeable?
Message-ID: <20020820101020.GA18210@wohnheim.fh-wedel.de>
References: <3D612C1F.55297C10@esteem.com> <20020819234239.GA6792@wohnheim.fh-wedel.de> <3D6186CD.6BCD1850@esteem.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3D6186CD.6BCD1850@esteem.com>
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

On Mon, 19 August 2002 17:01:17 -0700, Conn Clark wrote:
> Jörn Engel wrote:
> > On Mon, 19 August 2002 10:34:23 -0700, Conn Clark wrote:
> > >       How does one mount an existing jffs2 partition so it is writeable?
> > > After a reboot I can mount my jffs2 and read from it, but not write to it
> > > I can erase it first and mount it then read and write to it , but then I
> > > lose my info on it which defeats the whole reason for having it.
> > 
> > 1) Append "rw" to kernel command line.
> > 2) mount / -o remount,rw
> 
> 	Didn't work, I get the same message. Did I do it right?
> 
> [/gpig]# cd ..
> [/]# mount /gpig -o remount,rw
> [/]# cd gpig
> [/gpig]# cp ../bin/MAKEDEV .                                                    
> Write of 68 bytes at 0x00059a28 failed. returned 0, retlen 0
> Not marking the space at 0x00059a28 as dirty because the flash driver returned r
> etlen zero
> cp: ./MAKEDEV: Input/output error
> [/gpig]# 

Maybe. If the locking hint from Christopher doesn't work either, we
need more information:
- Number, size and type of flash chips
- output from mount
- kernel version plus applied patches
- ...

Without knowing whether /gpid is the mounted partition in question or
not, my best answer is maybe. :)

Jörn

-- 
The competent programmer is fully aware of the strictly limited size of
his own skull; therefore he approaches the programming task in full
humility, and among other things he avoids clever tricks like the plague. 
-- Edsger W. Dijkstra
