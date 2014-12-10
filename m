Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XylIS-00065Y-Uk
 for linux-mtd@lists.infradead.org; Wed, 10 Dec 2014 17:43:33 +0000
Message-ID: <548885BB.8050105@imgtec.com>
Date: Wed, 10 Dec 2014 14:41:15 -0300
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
To: Andrew Bresticker <abrestic@chromium.org>, Ionela Voinescu
 <ionela.voinescu@imgtec.com>, James Hartley <james.hartley@imgtec.com>, Brian
 Norris <computersforpeace@gmail.com>, <bpqw@micron.com>,
 <arnaud.mouiche@invoxia.com>, <frankliu@micron.com>
Subject: Re: [PATCH 0/6] SPI NAND for everyone
References: <1417525136-25731-1-git-send-email-ezequiel.garcia@imgtec.com>
In-Reply-To: <1417525136-25731-1-git-send-email-ezequiel.garcia@imgtec.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

On 12/02/2014 09:58 AM, Ezequiel Garcia wrote:
> During the discussion of Ionela Voinescu's patch to support GD5F SPI NAND
> devices [1], it was decided that a proper SPI NAND framework was needed
> to support the mt29f device (driver currently in staging area) and the new
> gd5f.
> 
> This patchset is a first attempt to address this.
> 
> The SPI NAND framework allows devices to register as NAND drivers. This is
> useful to take advantage of the bad block management code. Given the
> SPI NAND and the bare NAND commands are different, the SPI NAND framework
> implements its own .cmdfunc callback, which is in charge of calling
> device-specific hooks for each of the flash operations (read, program, erase,
> etc).
> 
> The SPI NAND framework does not deal with SPI transactions per-se. Instead,
> the SPI messages should be prepared by the users of the SPI NAND framework
> (those that implement the device-specific hooks).
> 
> The result can be expressed in the following hierarchy:
> 
>     Userspace
>   ------------------
>     MTD
>   ------------------
>     NAND core
>   ------------------
>     SPI NAND core
>   ------------------
>     SPI NAND device
>   ------------------
>     SPI core
>   ------------------
>     SPI master
>   ------------------
>     Hardware
> 
> Notice there was a previous attempt to propose an SPI NAND framework,
> by Sourav Poddar and Mona Anonuevo. We didn't find this proposal suitable,
> so this series is a completely new work.
> 
> This series is based on v3.18-rc7. Tests have been performed with a Gigadevice
> GD5F 4 Gbit device, including nandtest runs and filesystem testing on top
> of UBI. I don't have MT29F devices yet, but the amount of changes required to
> support it should be fairly small.
> 
> I don't intend this first proposal to be complete, but I hope it's a good
> starting point to support SPI NAND properly.
> 

I'm aware we are in the middle of the merge window, and probably
everyone is getting ready for Christmas and holidays.

However, if anyone can take a look at the proposal, and in particular at
the SPI NAND framework API, it would be awesome to move forward wit this
discussion so we can get mt29f out of staging and support gd5f.

Thanks a lot!
-- 
Ezequiel
