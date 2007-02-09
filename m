Subject: Re: [PATCH] Don't include linux/mtd/map.h from linux/mtd/physmap.h
From: David Woodhouse <dwmw2@infradead.org>
To: Haavard Skinnemoen <hskinnemoen@atmel.com>
In-Reply-To: <20070209153029.1ffe2420@dhcp-252-105.norway.atmel.com>
References: <20070209153029.1ffe2420@dhcp-252-105.norway.atmel.com>
Content-Type: text/plain
Date: Fri, 09 Feb 2007 15:07:50 +0000
Message-Id: <1171033670.29713.51.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-02-09 at 15:30 +0100, Haavard Skinnemoen wrote:
> Replace the inclusion of linux/mtd/map.h with a forward-declaration
> of struct map_info. This allows linux/mtd/physmap.h to be included by
> e.g. board code even if the MTD subsystem is disabled.
> 
> Signed-off-by: Haavard Skinnemoen <hskinnemoen@atmel.com> 

Applied; thanks.

-- 
dwmw2
