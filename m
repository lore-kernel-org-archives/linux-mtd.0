Received: from server.bluewater.co.nz ([203.167.251.250]
	helo=smtp.bluewaternz.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19IRqN-0003Aw-8B
	for <linux-mtd@lists.infradead.org>; Wed, 21 May 2003 12:33:15 +0100
Received: from benmore.bluewaternz.com
	([192.168.2.3] helo=bluewatersys.com ident=gordon)
	by smtp.bluewaternz.com with esmtp (Exim 3.03 #1 (Debian))
	id 19IRqf-0000dQ-00
	for <linux-mtd@lists.infradead.org>; Wed, 21 May 2003 23:33:33 +1200
Message-ID: <3ECB640C.5040305@bluewatersys.com>
Date: Wed, 21 May 2003 23:33:32 +1200
From: Gordon J Milne <gordon@bluewatersys.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <1028064443.23642.52.camel@mahi190.austin.ibm.com>
	<14660.1028067926@redhat.com>
In-Reply-To: <14660.1028067926@redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: "Read-only file system" error while writing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

David Woodhouse wrote:
 > gromit1463@mailworks.org said:
 >
 >>When I write to the chips using either cat, dd, stdout redirection, or
 >>cp, the CFI driver complains of attempting to write to a "Read-only
 >>file system", even after unlocking all blocks in the partition and
 >>erasing the partition.  I can mount /dev/mtdblock*, but mount
 >>complains and I still can't put anything into the mounted partition.
 >>do_write_buffer() in cfi_cmdset_0001.c is returning the error (EROFS).
 >
 > The only case in which do_write_buffer() should return -EROFS is if the
 > status bit is set which means that the block in question was locked. Try
 > using the MEMUNLOCK ioctl to unlock it?

I am having exactly the same problem with the same ST part (M28W320CB). I am 
running uClinux (based on Linux 2.4.20). I modified the do_write_buffer() 
code to print out the status value that was read back. The value is 0xffff. 
It seems a bit strange to me that ALL the bist should be 1s.

I have tried using "unlock" to unlock the device (/dev/mtd3) but I get the 
same result.

The device (1f:03) is the root device and it has been remounted rw. I 
verified this by checking /proc/mounts - everything was rw, as expected. My 
system successfully boots and I can execute commands. It is just the 
filesystem writes that are not working for me.

Any further ideas?

Gordon
