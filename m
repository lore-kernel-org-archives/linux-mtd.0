Subject: Re: MTD/JFFS2 causes libc.so to break(?)
From: David Woodhouse <dwmw2@infradead.org>
To: Manu Rao <MRao@AlienTechnology.com>
In-Reply-To: <32C4C619DF66B945B608E59A6791C8C302626746@CBA0E2K11.CBA0.centerbeam.com>
References: <32C4C619DF66B945B608E59A6791C8C302626746@CBA0E2K11.CBA0.centerbeam.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 May 2008 09:16:35 +0100
Message-Id: <1210320995.25560.1198.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-05-06 at 15:09 -0700, Manu Rao wrote:
> Hi all,
> I have a linux 2.6.22.2 kernel running on an AT91SAM9260 processor board, with debian filesytem stored on a Samsung NAND flash.
> 
> When I setup the filesystem by untarring a tarball into /dev/mtblock0, everything is fine.
> When I setup the filesystem by using a jffs2 image (with either uboot, nandwrite(in linux) or preprogrammed ) , it boots fine once( or a couple of times) and then gives the following error:
> 
> /bin/sh: error while loading shared libraries: /lib/libc.so.6: undefined symbol: __`À, version GLIBC_2.0
> 
> I have verified (using md5-sum) that the library remains the same.

How do you run md5sum if libc isn't working? Can you check the md5sums
on the dynamic linker too, and anything else which is involved?

>  I have a soft link to the library like so:
> 
> ls -la libc.so.6
> lrwxrwxrwx  1 root root 13 May  5  2008 libc.so.6 -> libc-2.3.2.so
> ls -la libc-2.3.2.so
> -rwxr-xr-x  1 root root 1159708 Mar  5  2007 libc-2.3.2.so
> 
> 
> 1) Could it be that my mkfs.jffs2 is the wrong version (mkfs.jffs2: revision 1.50 ) ?? What version would I need to compile a FS for a 2.6.22 kernel ?
> 2) Am I passing the wrong params to mkfs.jffs2? I invoke it like so:
>        mkfs.jffs2 -n -l -s 512 -p 16KiB -e 16 KiB -o jffs2.img -d deb_root
> Does the page size need to include the oob area???

The page size is the MMU page size, 4KiB. Although it shouldn't matter
if you give a smaller number, as long as it's a factor of the real page
size.

-- 
dwmw2
