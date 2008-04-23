Subject: Re: [PATCH] fix cfi for collie flash
From: David Woodhouse <dwmw2@infradead.org>
To: Thomas Kunze <thommycheck@gmx.de>
In-Reply-To: <480E7784.6030902@gmx.de>
References: <480E7784.6030902@gmx.de>
Content-Type: text/plain
Date: Wed, 23 Apr 2008 01:30:18 +0100
Message-Id: <1208910618.9212.701.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-04-23 at 01:40 +0200, Thomas Kunze wrote:
> Hi,
> 
> collie seems to contain LH28F640BF flash chips. According to 
> http://sharp-world.com/products/device/flash/pdf/*FUM00701*@E.pdf
> (page 83) if they have 0x51 of Extended Query Table (number of hardware 
> partitions) set to zero, they have a single fixed partition.
> This patch makes those chips work.

fatal: corrupt patch at line 8
Patch failed at 0001.

-- 
dwmw2
