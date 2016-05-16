Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b2M69-0003E2-Vl
 for linux-mtd@lists.infradead.org; Mon, 16 May 2016 17:14:30 +0000
Date: Mon, 16 May 2016 19:14:07 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>,
 moritz.fischer.private@gmail.com
Subject: Re: [PATCH] mtd: Adding of_mtd_info_get to get mtd_info from
 devicetree
Message-ID: <20160516191407.1dbb3028@bbrezillon>
In-Reply-To: <CAAtXAHcbjH0FzK=tuvwFSjUA7jJ4CT76NWQR31YR1UmXcAX9sQ@mail.gmail.com>
References: <1462988859-32240-1-git-send-email-moritz.fischer@ettus.com>
 <20160516095534.727fcac6@bbrezillon>
 <20160516100511.360c89c9@bbrezillon>
 <CAAtXAHcbjH0FzK=tuvwFSjUA7jJ4CT76NWQR31YR1UmXcAX9sQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 16 May 2016 09:30:10 -0700
Moritz Fischer <moritz.fischer@ettus.com> wrote:

> Hi Boris,
> 
> On Mon, May 16, 2016 at 1:05 AM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> 
> >> Here are a few questions (I'm assuming the netdev + MAC address case):
> >> - how would you link the net/PHY device to the MTD partition storing
> >>   the MAC address  
> 
> Well in my case I actually planned to use it with the OTP partition of my QSPI
> device using spi_nor_read_usr_prot_reg and friends and I just needed a way
> to get to the struct mtd_info from a child of my network device.
> 
> Right now the OTP 'partitions' are not really exposed to device tree afaik.
> Maybe that would be worthwhile to further look into? Maybe exposing
> (wrapping) that as nvmem
> would be the way to go?

I think so. Now that MTD partitions are defined in a 'partitions'
subnode (see MTD binding doc), we can define an 'otp-partitions'
subnode and define nvmem cells in there.


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
