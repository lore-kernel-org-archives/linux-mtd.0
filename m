Received: from dragon.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 4.12 #3 (Red Hat Linux))
	id 18fkrK-0000wM-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Feb 2003 17:58:19 +0000
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: Vishal <vishal@laser5.co.jp>, linux-mtd@lists.infradead.org
Date: Tue, 4 Feb 2003 06:52:48 +1300
References: <3E3E517F.9010908@laser5.co.jp>
In-Reply-To: <3E3E517F.9010908@laser5.co.jp>
MIME-Version: 1.0
Message-Id: <20030203175813.BBA8415576@dragon.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Subject: Re: help: bootloader for loading kernel from mtdblock device on flash........
Content-Transfer-Encoding: 8bit
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

There is a bootloader in the YAFFS CVS that works with a YAFFS formatted 
image. Luckily there is also a tool for converting the image into YAFFS 
format too.

-- Charles

On Tue, 04 Feb 2003 00:24, Vishal wrote:
> Hi all,
>   I am a mtd newbie, and have been assigned the task of writting a boot
> loader that can boot a kernel file placed in a mtdblock device, on NAND
> flash( Samsung K9F2808U08). I would like suggestions on going about with
> this process. If some one could take some time to at least list down the
> steps involved in the same, it would be of immense help me.
>   Thanks in Advance!!
> regards,
> Vishal
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
