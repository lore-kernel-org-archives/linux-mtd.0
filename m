From: David Woodhouse <dwmw2@infradead.org>
To: Han Chang <posaune@hotmail.com>
In-Reply-To: <BAY110-F56850C54FA653AED377E3BCAC0@phx.gbl>
References: <BAY110-F56850C54FA653AED377E3BCAC0@phx.gbl>
Content-Type: text/plain
Date: Wed, 17 May 2006 00:38:22 +0100
Message-Id: <1147822702.30771.17.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND/JFFS2 utility tools.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-05-12 at 11:17 -0700, Han Chang wrote:
> Now, I realized those tools don't work with /dev/mtdblock2, so i tried 
> /dev/mtd2, which is the char driver. For flash_info, which tries to open 
> /dev/mtd2 in RDONLY mode, it opened file ok, but got msg "Device /dev/mtd2 
> has 0 erase regions". For flash_erase and flash_eraseall, which try to open 
> /dev/mtd2 in RDWR mode, it got "File open error".
> 
> Anyone has any advices on making these tools working? 

Do you have the correct major and minor numbers for /dev/mtd2 ?

-- 
dwmw2
