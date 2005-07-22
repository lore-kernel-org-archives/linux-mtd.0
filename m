From: David Woodhouse <dwmw2@infradead.org>
To: Shankari <shankari82@yahoo.com>
In-Reply-To: <20050722171510.55261.qmail@web51007.mail.yahoo.com>
References: <20050722171510.55261.qmail@web51007.mail.yahoo.com>
Content-Type: text/plain
Date: Fri, 22 Jul 2005 15:48:00 -0400
Message-Id: <1122061681.12630.29.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Flash memory PCI Add in card
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-07-22 at 10:15 -0700, Shankari wrote:
> I wanted to know if there are any boards that
> interfaces flash through PCI? 

It's not a particularly difficult thing to make. You just need to stick
a bunch of NOR flash in a BAR. 

M-Systems have a PCI eval board which is based on a simple PCI device
ASIC, but I don't think it supports NOR flash -- it's designed for their
DiskOnChip devices.

Some of the ARM eval boards can plug into a PCI slot too and have their
flash accessed directly from the host.

> Also, are there any open source PCI drivers that I
> might look into for a better idea.

linux/drivers/mtd/maps/pci.c

-- 
dwmw2
