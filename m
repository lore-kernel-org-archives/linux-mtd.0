Subject: Re: [RFC PATCH 4/9] nand/denali: split the generic driver and PCI
	layer
From: David Woodhouse <dwmw2@infradead.org>
To: dedekind1@gmail.com
Date: Thu, 12 May 2011 09:15:48 +0100
In-Reply-To: <1305187710.2713.61.camel@localhost>
References: <1304692143-22432-1-git-send-email-jamie@jamieiles.com>
	<1304692143-22432-5-git-send-email-jamie@jamieiles.com>
	<1305187710.2713.61.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1305188149.30435.199.camel@i7.infradead.org>
Mime-Version: 1.0
Cc: Jamie Iles <jamie@jamieiles.com>, linux-mtd@lists.infradead.org,
	chuanxiao.dong@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-05-12 at 11:08 +0300, Artem Bityutskiy wrote:
> 
> I do not know for sure, but I bet there is a way to avoid adding
> another
> config option. In general - the Linux kernel is overloaded with config
> options and we try to avoid adding new ones.
> 
> Can this be done the following way? - you check if there is a PCI bus,
> if no - try mmio. If yes, try to discover the device in PCI.

Better still, support *only* device-tree. The Intel board should have
been doing that instead of its stupid fake-pci thing anyway, and using
device properties instead of that stupid hack with putting information
at an MMIO address.

Let the Moorestown *platform* code register the device-tree at startup,
if the NAND code is present, and don't worry about that crap in the
generic driver.

-- 
dwmw2
