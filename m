Received: from shawidc-mo1.cg.shawcable.net ([24.71.223.10]
	helo=pd5mo2so.prod.shaw.ca)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AbOrN-0002DQ-7w
	for linux-mtd@lists.infradead.org; Tue, 30 Dec 2003 18:44:53 +0000
Received: from pd3mr2so.prod.shaw.ca (pd3mr2so-ser.prod.shaw.ca
	[10.0.141.178])2003))linux-mtd@lists.infradead.org;
	Tue, 30 Dec 2003 11:39:45 -0700 (MST)
Received: from shaw.ca (pd2ms2so-con.prod.shaw.ca [10.0.122.118])
 by l-daemon (iPlanet Messaging Server 5.2 HotFix 1.18 (built Jul 28 2003))
 with ESMTP id <0HQQ00JRW169HS@l-daemon> for linux-mtd@lists.infradead.org;
 Tue, 30 Dec 2003 11:39:45 -0700 (MST)
Date: Tue, 30 Dec 2003 10:39:45 -0800
From: thomaspang@shaw.ca
To: linux-mtd@lists.infradead.org
Message-id: <326f4932ade4.32ade4326f49@shaw.ca>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-language: en
Content-transfer-encoding: 7BIT
Content-disposition: inline
Subject: Unable to access JFFS2 filesystem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With David's patches, I am able to access the JFFS2 file system.  Thanks.
However, the following weird behaviors are observed:

- incorrect filesystem meta-data or not properly displayed when
  issuing "ls" command.
 
    # ls -al
    drwxr-xr-x    1 root     root            0 Dec 11  2003 .
    drwxr-xr-x    1 root     root            0 Dec 11  2003 ..
    drwxr-xr-x    1 501      501             0 Dec 11  2003 bin
    drwxr-xr-x    1 501      501             0 Dec 11  2003 dev
    drwxr-xr-x    1 501      501             0 Dec  9  2003 etc
    drwxr-xr-x    1 501      501             0 Dec 11  2003 lib
    lrwxrwxrwx    1 501      501            11 Dec 11  2003 
 linuxrc -> bin/busybox
    drwxr-xr-x    1 root     root            0 Jan  1 00:28 mnt
    dr-xr-xr-x   21 root     root            0 Jan  1 00:00 proc
    drwxr-xr-x    1 501      501             0 Dec 11  2003 sbin
    drwxrwxrwt    1 501      501             0 Jan  1 00:27 tmp
    drwxr-xr-x    1 501      501             0 Dec 11  2003 usr
    drwxr-xr-x    1 501      501             0 Dec 11  2003 var
 
    # df .
    Filesystem           1k-blocks      Used Available Use% 
 Mounted on
    rootfs                    1024       740       284  72% /
 
   Even though there are files inside bin/ directory, the size
   of that directory displayed is 0. 
 
- copying file within its own partition results in the following
  error messages.  This problem is happened to the JFFS2 root 
 filesystem  only.
 
  ...
  Raw node at 0x0005ccc0 wasn't in node lists for ino #109
  Raw node at 0x0005ccc0 wasn't in node lists for ino #109
  Raw node at 0x0005ccc0 wasn't in node lists for ino #109
  Raw node at 0x0005ccc0 wasn't in node lists for ino #109
  Raw node at 0x0005ccc0 wasn't in node lists for ino #109
  Raw node at 0x0005ccc0 wasn't in node lists for ino #109
  Raw node at 0x0005ccc0 wasn't in node lists for ino #109
  Raw node at 0x0005ccc0 wasn't in node lists for ino #109
  Raw node at 0x0005ccc0 wasn't in node lists for ino #109
  Raw node at 0x0005ccc0 wasn't in node lists for ino #109
  Raw node at 0x0005ccc0 wasn't in node lists for ino #109
  ...
 
- The write performance is kind of poor.  I have tried to copy
  files of different sizes from CRAMFS to JFFS2, or from JFFS2
  to another JFFS2 partition.  On average, the copying speed
  is approx. 7.5 kbytes/sec.  It seems too slow.
 
  Any suggestions / comments are much appreciated.
 
Thomas
 
 
 
 
 
> ----- Original Message -----
> From: Thayne Harbaugh <tharbaugh@lnxi.com>
> Date: Tuesday, December 30, 2003 9:32 am
> Subject: Re: Unable to access JFFS2 filesystem
> 
> > On Tue, 2003-12-23 at 12:25, thomaspang@shaw.ca wrote:
> > > I repost this message as I do not get any response.
> > 
> > > Primary Vendor Command Set: 0002 (AMD/Fujitsu Standard)
> > 
> > It appears that you are using cfi_cmdset_0002.  Please try David
> > Vrabel's patches and let me know if things change.
> > 
> > http://lists.infradead.org/pipermail/linux-mtd/2003-
> > December/009001.htmlhttp://lists.infradead.org/pipermail/linux-
> > mtd/2003-December/009009.html
> > 
> > -- 
> > Thayne Harbaugh
> > Linux Networx
> > 
> > 
> 
> 
