Received: from tweedy.ksc.nasa.gov ([128.217.76.165])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17DUc0-0005Sp-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 May 2002 19:25:24 +0100
Subject: Re: Grub Booting Disk On Chip
From: Bob Chiodini <Robert.Chiodini-1@ksc.nasa.gov>
To: Ilguiz Latypov <ilatypov@superbt.com>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <Pine.LNX.4.44.0205301054300.16783-100000@server.superbt.com>
References: <Pine.LNX.4.44.0205301054300.16783-100000@server.superbt.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 30 May 2002 14:25:20 -0400
Message-Id: <1022783120.19406.108.camel@tweedy.ksc.nasa.gov>
Mime-Version: 1.0
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

I did some digging, however dangerous that may be.

I put a "phword" call in doc_stage1.S to print out the value of
"doc_seg".  It looks like the routine runs 4 times.  Once for each d000,
d200, d400, and d600, leaving d600 in doc_seg.

The DOC2000 I have is 32M.

Bob...

On Thu, 2002-05-30 at 10:59, Ilguiz Latypov wrote:
    On 30 May 2002, Bob Chiodini wrote:
    
    > 1.  I get "DoC 2000 at D600".  The DOC is really at D000.
    
    Weird.  Looks like BIOS calls DoC 2000 firmware with a different value of
    Command Segment register.  I don't know if addressing D000:0 by offsetting
    the D600 segment with a different value of IP register is possible.
    
    > default=1
    > [...]
    > 2.  I get several messages about GRUB trying to find
    > /boot/grub/menu.lst.  None of the messages indicate drive 0xE0.
    
    Does the "default" parameter in menu.lst makes GRUB attempt to load the
    second entry which refers to the disk 0x80?
    
    Ilguiz
-- 
Bob Chiodini
Sr. Communications Engineer
Dynacs Engineering Company, Inc.
DNX-18
Kennedy Space Center, Florida 32899
321-867-6313 (voice)
321-867-6300 (fax)
