Received: from real.realitydiluted.com ([208.242.241.164])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15tVo0-0001eU-00
	for <linux-mtd@lists.infradead.org>; Tue, 16 Oct 2001 16:06:56 +0100
Message-ID: <3BCC4D0F.891F2FF9@cotw.com>
Date: Tue, 16 Oct 2001 10:06:55 -0500
From: "Steven J. Hill" <sjhill@cotw.com>
Reply-To: sjhill@cotw.com
MIME-Version: 1.0
To: nagaraj trivedi <trina@rediffmail.com>
CC: linux-mtd@lists.infradead.org
Subject: Re: NAND flash
References: <20011016135145.7311.qmail@mailweb12.rediffmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

nagaraj trivedi wrote:
> 
> can I use the MTD NAND FLASH driver for smartmedia along with the jffs2? Does jffs2
> work with the MTD NAND flash driver ?
>
OK...let's break this into small pieces. First of all, the NAND FLASH driver was
written for raw NAND flash chips that were IO mapped into the address space. I
wrote
those drivers originally. Next, I got JFFS working on top of the NAND MTD driver
to the point that it could mount, read, write, delete, remove directories, etc.
I
and another person also did a fair amount of stress testing. That is where
things
currently stand.

SmartMedia is an entirely different beast in that has a some hardware between
the
CPU and the NAND flash chips inside. It is similar to Disk-On-Chip devices which
use NAND/NOR flash with wear-leveling, error correcting and other things done
transparently in the hardware. You would need to get the low-level
specifications
for SmartMedia and then write a SmartMedia driver. Once that is done, you could
then
work on the task of getting JFFS2 working. IIRC though, JFFS2 needs
modifications
to work with NAND flash. Myself and David could work out what changes need to be
in
fairly short order. Hope that helps.

-Steve

-- 
 Steven J. Hill - Embedded SW Engineer
