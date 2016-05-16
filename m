Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b2LPc-0006vK-Od
 for linux-mtd@lists.infradead.org; Mon, 16 May 2016 16:30:33 +0000
Received: by mail-vk0-x22e.google.com with SMTP id s184so219389460vkb.3
 for <linux-mtd@lists.infradead.org>; Mon, 16 May 2016 09:30:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160516100511.360c89c9@bbrezillon>
References: <1462988859-32240-1-git-send-email-moritz.fischer@ettus.com>
 <20160516095534.727fcac6@bbrezillon>
 <20160516100511.360c89c9@bbrezillon>
Date: Mon, 16 May 2016 09:30:10 -0700
Message-ID: <CAAtXAHcbjH0FzK=tuvwFSjUA7jJ4CT76NWQR31YR1UmXcAX9sQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: Adding of_mtd_info_get to get mtd_info from
 devicetree
From: Moritz Fischer <moritz.fischer@ettus.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 moritz.fischer.private@gmail.com
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Mon, May 16, 2016 at 1:05 AM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:

>> Here are a few questions (I'm assuming the netdev + MAC address case):
>> - how would you link the net/PHY device to the MTD partition storing
>>   the MAC address

Well in my case I actually planned to use it with the OTP partition of my QSPI
device using spi_nor_read_usr_prot_reg and friends and I just needed a way
to get to the struct mtd_info from a child of my network device.

Right now the OTP 'partitions' are not really exposed to device tree afaik.
Maybe that would be worthwhile to further look into? Maybe exposing
(wrapping) that as nvmem
would be the way to go?

> Sorry, I sent it before asking all my questions :).
;-) (as you can see from this email, you're not the only one that
fails at email today, forgot to CC list ...)

> - it seems quite specific to MTD devices to me. What if the MAC address
>   is stored in something that is not exposed as an MTD device. I wonder
>   if we shouldn't add an nvmem wrapper around MTD devices.

That looks certainly worthwhile investigating for the general case.

Cheers,

Moritz
