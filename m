Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Cc2MH-0008HN-0a
	for linux-mtd@lists.infradead.org; Wed, 08 Dec 2004 09:00:00 -0500
Message-ID: <41B70C9E.4010304@nrl.navy.mil>
Date: Wed, 08 Dec 2004 09:15:58 -0500
From: Dan Brown <dan.brown@nrl.navy.mil>
MIME-Version: 1.0
To: zhang jingxin <zhangjingxin@sict.ac.cn>
References: <1102509710.2462.6.camel@z21921>
In-Reply-To: <1102509710.2462.6.camel@z21921>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: doc2000 problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

zhang jingxin wrote: [edited for brevity]
> I want use JFFS2 on my DOC2000 original.I download the latest CVS
> version(041128).I use diskonchip.c to drive.It works.
> But it has a little error.
> 
> Dec  8 10:23:54 localhost kernel: ECC error scanning DOC at 0xc000
> Dec  8 10:23:55 localhost kernel: ECC error scanning DOC at 0x10000

This error is not a real problem.  When the diskonchip driver starts up, 
it scans your device looking for the media header, which is a section of 
the device which describes the partitions on the device.  In many cases, 
the M-Systems tools do not bother to place proper ECC information in the 
media header.  The result is that we get ECC errors when reading those 
pages.  Although the driver reports these errors, they do not prevent 
the proper operation of the driver (though of course the lack of ECC 
increases the chances of a read error slipping past us).

> I had read below
> 
> 2004-10-26 15:46
> 
> Dan Brown dan_brown at ieee.org 
> Fri Jun 18 19:30:56 EDT 2004 
> Brief HOWTO (better HOWTO coming soon!):

Unfortunately, the email you're quoting from is out of date.  The better 
HOWTO never came, soon or otherwise.  Oops.  To the best of my 
recollection (I've been away from this code a bit lately), I'll try to 
address each of the points:

> - Have a DOC Millenium or DOC2000 TSOP.  Millenium+ is not supported
> (other
> folks are hard at work on this).

Kalev Lember added Millenium+ support to diskonchip.c.  I think he sent 
an announcement to the list, but since you're not using that device I 
won't go into detail.

> DOC2000 original does not have BBT
> handling yet (coming soon!) and should not be used with JFFS2 yet.

BBT handling was added for DOC2000 original after I wrote this email. 
It should work just fine with JFFS2 (it does for me).

> - Load the new diskonchip module (there is now a kernel configuration
> option
> for this under NAND devices).  If your DOC device is not at window D000,
> you'll have to edit the source or remap your chip.  Proper probing
> coming soon!

Proper probing did indeed come soon, as I copied it more-or-less 
verbatim from the old driver.  The kernel configuration options (and 
accompanying help text) should hopefully make this clear.

> - Assuming your BDTL partition is mtd3:
> 
>     flash_eraseall -j /dev/mtd3
>     mkfs.jffs2 -p -e 16384 -n -q -r <rootdir> -o <outputfile>
>     nandwrite /dev/mtd3 <outputfile from above>
>     mount -t jffs2 /dev/mtdblock3 <mountpoint>
> 
> So I follow it.
> I review the list of devices with 'cat /proc/mtd'
>  
> cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 02000000 00004000 "DiskOnChip 2000 (NFTL Model)"
> mtd1: 01fec000 00004000 " DiskOnChip BDTL partition"
> 
> flash_eraseall -j /dev/mtd1
> It doesn't recongize the device.
> what should i do??

Did you create the device nodes in /dev?  Unless you're using devfs or 
suchlike, device nodes are not automatically created for you (even 
though the devices themselves were created when you loaded the modules). 
  Try running the MAKEFILE script included in the mtd CVS (in the util 
directory).

Once you've created the devices nodes, the flash_eraseall command should 
work for you.  At that point you could follow my original sequence of 
commands.  I've seen some discussion on this list lately about changes 
in mkfs.jffs2 syntax, so be aware that the options I specify may not be 
exactly correct (I haven't kept up well enough to be sure).

Alternatively, there is a much simpler way to get started using JFFS2. 
After performing the flash_eraseall -j, just mount the device (in other 
words, skip the mkfs.jffs2 and nandwrite steps).  You should now have an 
empty, mounted jffs2 partition, and you can proceed to put whatever 
files you want on it.

Hope this helps,

	Dan Brown
