Subject: Re: [PATCH] [MTD][OneNAND] Multi Level Chip (MLC) OneNAND support
From: David Woodhouse <dwmw2@infradead.org>
To: Kyungmin Park <kyungmin.park@samsung.com>
In-Reply-To: <20080103000350.GA12237@party>
References: <20080103000350.GA12237@party>
Content-Type: text/plain
Date: Tue, 22 Apr 2008 16:06:56 +0100
Message-Id: <1208876816.9212.609.camel@pmac.infradead.org>
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

On Thu, 2008-01-03 at 09:03 +0900, Kyungmin Park wrote:
> This patch enables the MLC OneNAND support
> Now it's basic support. We need to work more.
> 
> In MLC, we use the 4KiB BufferRam instead of 2KiB.
> With this reason it is changed to read/write data from/to BufferRAM 0 and
> we can't use read-while-load.
> 
> It passed the nand-tests module and it diffed against the OneNAND MTD tree instead of MTD one.

Did you intend this to be merged?

-- 
dwmw2
