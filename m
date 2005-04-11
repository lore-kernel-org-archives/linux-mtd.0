Received: from wproxy.gmail.com ([64.233.184.193])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DKwZJ-0002IC-7l
	for linux-mtd@lists.infradead.org; Mon, 11 Apr 2005 06:55:02 -0400
Received: by wproxy.gmail.com with SMTP id 37so1873565wra
	for <linux-mtd@lists.infradead.org>;
	Mon, 11 Apr 2005 03:55:03 -0700 (PDT)
Message-ID: <f96d234e050411035522064e02@mail.gmail.com>
Date: Mon, 11 Apr 2005 05:55:01 -0500
From: Cliff Brake <cliff.brake@gmail.com>
To: "Robert P. J. Day" <rpjday@mindspring.com>
In-Reply-To: <Pine.LNX.4.61.0504101735390.8617@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
References: <Pine.LNX.4.61.0504101735390.8617@localhost.localdomain>
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: how little do i have to do to define flash layout on my system?
Reply-To: Cliff Brake <cliff.brake@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Apr 10, 2005 4:41 PM, Robert P. J. Day <rpjday@mindspring.com> wrote:
> 
>   currently, my 8xx 2.4 kernel-based system defines its flash layout
> with a proprietary driver file we installed into the "maps" directory,
> but i'd like to simplify that approach.
> 
>   certainly, i can use command-line partitioning to define all of the
> partitions, making the driver file *way* simpler.  can i somehow avoid
> even the creation of that driver file (so i don't have to mess with
> the kernel source tree at all)?
> 
>   i just read that there is a generic driver for accessing CFI flash
> chips on systems that have no specific mapping driver.  does this mean
> what i think it means?  that i can somehow take advantage of that
> generic driver to avoid having to write my own?

I am using the MTD mechanism for defining the physical area where the
flash lives on several PXA systems:

CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_START=0x0
CONFIG_MTD_PHYSMAP_LEN=0x4000000
CONFIG_MTD_PHYSMAP_BANKWIDTH=4

You can then use the kernel command line to define the partitions:

mtdparts=phys_mapped_flash:256k(boot)ro,0x1C0000(kernel),-(root)

The only tricky part was figuring out the above name
(phys_mapped_flash).  From reading the documentation, I thought I
could leave the name blank, but did not work for me.
 
>   i need to be able to concatenate 2 16M chips into a single 32M
> address space, then partition into 5 or 6 partitions.  am i being too
> optimistic about not needing my own driver map program if i can use
> the "generic" one?

I have not used the above with multiple chips.  MTD layer does have a 
CONFIG_MTD_CONCAT config parameter ...

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com
