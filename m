Received: from desire.actrix.co.nz ([203.96.16.164])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DSKTK-000891-O6
	for linux-mtd@lists.infradead.org; Sun, 01 May 2005 15:51:23 -0400
Received: from there (unknown [203.96.30.19])
	by desire.actrix.co.nz (Postfix) with SMTP id 2F61115607
	for <linux-mtd@lists.infradead.org>;
	Mon,  2 May 2005 07:51:19 +1200 (NZST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Date: Mon, 2 May 2005 07:51:43 +1200
References: <20050429212410.49709.qmail@web54109.mail.yahoo.com>
In-Reply-To: <20050429212410.49709.qmail@web54109.mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20050501195119.2F61115607@desire.actrix.co.nz>
Subject: Re: mtd emulation --> NAND?
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 30 April 2005 09:24, Sam Pham wrote:
> I'd like to evaluate JFFS2.  Has anyone done this
> before?  Does linux have the capability of emulating
> mtd block device and mtd memory so that I can run
> JFFS2 on top of it without using the actual flash?
>

Further to this question, is there an emulation of NAND?

I use a "high level"  mtd NAND emulation that I wrote for YAFFS testing. This 
just provides the NAND mtd functions and uses none of the mtd.

I'm hoping there's a NAND emulation that emulates NAND at a very low level by 
accepting ALE/CLE and byte read/writes. This would provide, say, emulation of 
a 256Mbyte NAND part while exercising the whole of nand.c etc. This allows 
complete testing of file system + mtd code without having any hardware on 
hand.

-- Charles
