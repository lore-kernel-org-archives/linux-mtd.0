Received: from blood.actrix.co.nz ([203.96.16.160])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D8Qmg-0001ja-8E
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2005 17:33:07 -0500
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: <extabe@bredband.net>, <linux-mtd@lists.infradead.org>
Date: Tue, 8 Mar 2005 11:40:22 +1300
References: <20050304184957.KWQO1243.mxfep04.bredband.com@mxfep04>
In-Reply-To: <20050304184957.KWQO1243.mxfep04.bredband.com@mxfep04>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20050307223255.495C54815@blood.actrix.co.nz>
Cc: 
Subject: Re: Trying to get 1Gb Samsung nand flash working
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

1Gb is not enough info.
The devices with 512-byte pages should work much the same (perhaps a 
difference in the addressing).
The devices with 2048-byte pages will work quite a bit differentrly.

Also, check that the pins are the same on the packages. I have seen some 
devices with extra pins that had to be held in a different state to work.


On Saturday 05 March 2005 07:49, extabe@bredband.net wrote:
> The flash works well in U-boot enviroment with jffs2 but I can´t get it
> running i Linux. The chip i detected but then it reads badblocks on the
> entire chip.
>
> "Scanning device for bad blocks
> nand_read_oob: from = 0x00000000, len = 2
> Bad eraseblock 0 at 0x00000000"
> ..and so on.
>  I´ve used the same driver running a 64Mb nandflash with good result.
>
> Anyone else who used this chip?
>
>
> /Andre
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
