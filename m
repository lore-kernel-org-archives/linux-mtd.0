Received: from dsl-64-130-201-237.telocity.com ([64.130.201.237] helo=Dual166.localdomain)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16MX6S-0003cC-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 Jan 2002 16:21:57 +0000
Reply-To: <acurtis@onz.com>
From: "Allen Curtis" <acurtis@onz.com>
To: "Patrick Allaire" <pallaire@gameloft.com>, <linux-mtd@lists.infradead.org>
Subject: RE: From 2.4.9 to CVS ???
Date: Fri, 4 Jan 2002 08:24:57 -0800
Message-ID: <NCBBIINEHIPFGJPLBEIFOECPDDAA.acurtis@onz.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-reply-to: <9A1957CB9FC45A4FA6F35961093ABB8406456D89@srvmail-mtl.montreal.ubisoft.org>
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

We just had a similar problem. Perhaps since you just upgraded to another
kernel version, this may be your issue too. Our problem was that a symbolic
link to the loader was missing. (this seems to change between versions or
architectures)

Check /lib on the working file system. You should find a symbolic link
something like:

ld.so.1 -> ld.so.2.2.3

Make sure this is not different than what you have in cramfs.

Hope this helps.

> -----Original Message-----
> From: linux-mtd-admin@lists.infradead.org
> [mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Patrick Allaire
> Sent: Friday, January 04, 2002 8:19 AM
> To: linux-mtd@lists.infradead.org
> Cc: Patrick Allaire
> Subject: From 2.4.9 to CVS ???
>
>
>
> Hi,
>
> I was using the MTD drivers wich came with the linux 2.4.9 kernel source
> code ... now I have moved to 2.4.17 but I have also updated the
> mtd drivers
> with the CVS code, but I am no longer able to boot from my flash.
>
> MTD setup :
>
> MTD support
> MTD partitionning support
> Direct char device access to MTD devices
> Caching block device access to MTD devices
> Detect flash chips by Common Flash Interface (CFI) probe
>
> Support for ST flash chips (it a port from intel chips ... the only
> difference, is in the writing because st flash does not support word write
> ... only complete block writes, its a cfi_cmdset_0020 )
>
> CFI Flash device mapped on My Own Partitions ... same thing as 2.4.9
>
>
> Every thing is compiled fine ... at boot up, MTD find(probe) my flash, it
> printout the partioning it will do ... after that I get
>
> VFS: Mounted root (cramfs filesystem) readonly.
> Freeing unused kernel memory : 36k freed
> Kernel panic: No init found....
>
>
> I know from the last line that the problems is that the kernel cannot find
> /sbin/init ... but it is there, it is exactly the same cramfs I used on
> 2.4.9 when it was working !!! To be sure it was not corrupted, I redid the
> flashing of the /dev/mtdblock0 with my cramfs file ... with the same
> results.
>
> Any idea ???
>
> thank you.
>
> Patrick Allaire
> mailto:pallaire@gameloft.com
> If you can see it, but it's not there, it's virtual.
> If you can't see it, but it is there, it's hidden.
> It you can't see it and it isn't there, it's gone.
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
