From: David Woodhouse <dwmw2@infradead.org>
To: Stephan Wiebusch <stephanwib@t-online.de>
In-Reply-To: <1Cgmuu-1zfbjU0@fwd08.sul.t-online.com>
References: <1Cgmuu-1zfbjU0@fwd08.sul.t-online.com>
Content-Type: text/plain
Date: Tue, 21 Dec 2004 16:46:30 +0000
Message-Id: <1103647590.6111.107.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: DOC2000 bootloader
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-12-21 at 17:29 +0100, Stephan Wiebusch wrote:
> 
> Lilo is able to boot the Kernel, but it ends with: "Kernel panic - not
> syncing. VFS: Unable to mount root on device "<NULL>" or
> unknown-block(254,0)"

You aren't giving a correct 'root=' argument to the kernel.

-- 
dwmw2
