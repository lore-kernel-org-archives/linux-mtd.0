Received: from tiger.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18VeBC-0005MQ-00
	for <linux-mtd@lists.infradead.org>; Mon, 06 Jan 2003 20:49:03 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: m.neiger@synergie-inf.com,
	"'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: 16 NANDS
Date: Tue, 7 Jan 2003 10:15:29 +1300
References: <515CABE7496FD111AA3300201829FCBE2FFC48@archie.gsi.synergie-inf.com>
In-Reply-To: <515CABE7496FD111AA3300201829FCBE2FFC48@archie.gsi.synergie-inf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20030106211949.6211B45AF@tiger.actrix.co.nz>
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

By this I expect you mean the NAND chips with a 16-bit wide interface.

There are really two sub-issues:
* Hook-up to the chips themselves (ie. doing x16 instead of x8 trasfers).
* The 16-bit wide chips have larger pages and blocks (2kB pages, 128kB 
blocks) than the previous generation stuff. This needs to be handled too at 
both the mtd and file system level. I believe (but don't quote me) that JFFS2 
will work as it is now. YAFFS is currently undergoing extensions/mods to 
support the larger pages/blocks.

-- Charles


On Fri, 03 Jan 2003 23:27, Marc Neiger wrote:
> Hi,
>
> what are the current status/plan regarding the use of 16 NAND Flash,
> including with JFFS2
>
> Cheers and happy new year,
> Marc Neiger
>
> Marc Neiger
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
