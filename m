Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O7aDR-0002J5-Cs
	for linux-mtd@lists.infradead.org; Thu, 29 Apr 2010 20:20:10 +0000
Date: Thu, 29 Apr 2010 21:19:44 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: H Hartley Sweeten <hartleys@visionengravers.com>
Subject: Re: Potential namespace problem for 'struct flash_platfrom_data'
Message-ID: <20100429201944.GJ4877@n2100.arm.linux.org.uk>
References: <0D753D10438DA54287A00B0270842697636E305F88@AUSP01VMBX24.collaborationhost.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0D753D10438DA54287A00B0270842697636E305F88@AUSP01VMBX24.collaborationhost.net>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 29, 2010 at 03:06:37PM -0500, H Hartley Sweeten wrote:
> Hello all,
> 
> I was looking at an issue with a spi flash device and noticed a
> potential namespace problem.
> 
> arch/arm/include/asm/mach/flash.h has this:
> 
> struct flash_platform_data {
> 	const char	*map_name;
> 	const char	*name;
> 	unsigned int	width;
> 	int		(*init)(void);
> 	void		(*exit)(void);
> 	void		(*set_vpp)(int on);
> 	void		(*mmcontrol)(struct mtd_info *mtd, int sync_read);
> 	struct mtd_partition *parts;
> 	unsigned int	nr_parts;
> };
> 
> and include/linux/spi/flash.h has this:
> 
> struct flash_platform_data {
> 	char		*name;
> 	struct mtd_partition *parts;
> 	unsigned int	nr_parts;
> 
> 	char		*type;
> 
> 	/* we'll likely add more ... use JEDEC IDs, etc */
> };
> 
> Should anything be done?

How about unifying them both?
