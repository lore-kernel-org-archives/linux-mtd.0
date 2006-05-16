From: David Woodhouse <dwmw2@infradead.org>
To: Adrian Bunk <bunk@stusta.de>
In-Reply-To: <20060516114644.GN6931@stusta.de>
References: <20060515005637.00b54560.akpm@osdl.org>
	<20060516114644.GN6931@stusta.de>
Content-Type: text/plain
Date: Tue, 16 May 2006 13:14:31 +0100
Message-Id: <1147781671.27870.20.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Andrew Morton <akpm@osdl.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [-mm patch] drivers/mtd/devices/docprobe.c: correct #if's
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-05-16 at 13:46 +0200, Adrian Bunk wrote:
> If we correct the names of the config options, the code might actually
> work as intended...

S'true. Applied; thanks.

I've dug out one or two of these devices from the toy cupboard -- I want
to make sure we get the new version of the driver, using the generic
NAND code, working with all of them... and then we can drop the old
drivers altogether.

-- 
dwmw2
