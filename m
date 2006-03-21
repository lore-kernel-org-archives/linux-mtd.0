Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLcwJ-0005VG-Et
	for linux-mtd@lists.infradead.org; Tue, 21 Mar 2006 04:14:16 -0500
Message-ID: <441FC3DC.4000909@mw-itcon.de>
Date: Tue, 21 Mar 2006 10:14:04 +0100
From: Peter Menzebach <pm-mtd@mw-itcon.de>
MIME-Version: 1.0
To: "Lakshmi N. Sundararajan" <lakshmi.s@promise.com>
References: <B70A50D07063384EB9BCE3330D18414F024CCD28@nonameb.ptu.promise.com>
In-Reply-To: <B70A50D07063384EB9BCE3330D18414F024CCD28@nonameb.ptu.promise.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: boot issue.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Lakshmi N. Sundararajan wrote:
> I have a compressed ext2 filesystem on a FLASH partition which I would
> like
> to use as a root file system mounted in RAM. The FLASH is accessed via
> MTD layer.
So you have *no* filesystem in the flash, but a compressed image. This 
is not usable as a filesystem directly in this format. Afaik, only the 
initrd code can use this...

> The kernel parameters are "console=ttyS0,115200  noinitrd mem=128M
> root=/dev/mtdblock5"
> But kernel panics saying "VFS: Cannot mount root unknown device (31,5)".
> 
which is correct, since there is no fs there...

> If I were to use cramfs on FLASH and use the same kernel command line,
> I am able to bringup the system.I am using 2.6 linux.
which would save the RAM space. You can still put some directories into 
RAM...

> Would anyone know about this issue? Is there any thing I got to do?
> Any pointers would be helpful.
The only solution I know is (assuming parallel flash) to give the 
compressed image as an initrd=<address>,<size> to the kernel.


Best regards
Peter
-- 
Peter Menzebach
Menzebach und Wolff IT-Consulting GbR
Phone +49 751 355 387 1
