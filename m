Received: from smtp.argonst.com ([72.165.80.10])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Ke9Bo-0000CF-5g
	for linux-mtd@lists.infradead.org; Fri, 12 Sep 2008 14:00:00 +0000
Mime-Version: 1.0 (Apple Message framework v753.1)
In-Reply-To: <565805.47147.qm@web63403.mail.re1.yahoo.com>
References: <565805.47147.qm@web63403.mail.re1.yahoo.com>
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Message-Id: <85A33091-283C-48B9-AD6B-01E3E4BECD94@argonst.com>
Content-Transfer-Encoding: 7bit
From: Allon Stern <allon.stern@argonst.com>
Subject: Re: Flash Mapping and gpio
Date: Fri, 12 Sep 2008 10:00:02 -0400
To: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sep 11, 2008, at 6:23 PM, Fundu wrote:
>
> these are on 2.6 kernel. i'm using 2.4.20.
>
> how about this error
>
> MTD do_erase_oneblock(): Wacky!  Unable to decode failure status
> MTD do_erase_oneblock(): 0x07f40000(0x00ff00ff): 0x27051956
> 0x27051956 0x27051956 0x27051956
>
> any ideas here, this hasn't changed much.  i still get these even  
> after backing out my changes that i mentioned in the original post.


Dunno about that one, but here is what I did on my system, where I
have a 64MB part in a 16MB address window. It was on 2.6.26 (get
current, man!) so I don't know how closely it will match what you
need, but the basic technique should be very similar.


in drivers/mtd/maps, I added a new mapping, let's call it "custom.c".
Add it to the makefile and KConfig so you can select it.

in custom.c, I added a "CUSTOM_BANKSWITCH(x)" macro, which takes an
address, and sets the GPIOs for the flash to access that address.

In my case, I based it on the "avnet5282.c" map file, except instead
of using

simple_map_init(&avnet5282_map);

I created my own "custom_map_init", which looks something like:

void custom_map_init(struct map_info *map)
{
	BUG_ON(!map_bankwidth_supported(map->bankwidth));

	map->read = custom_map_read;
	map->write = custom_map_write;
	map->copy_from = custom_map_copy_from;
	map->copy_to = custom_map_copy_to;
}


then for the individual map functions, implemented them something like:

static map_word __xipram custom_map_read(struct map_info *map,
unsigned long ofs)
{
      CUSTOM_BANKSWITCH(ofs);
      return inline_map_read(map, ofs & BANK_MASK); // mask out the bank
}

individual
The inline_map will do 99% of what you need - you just have to bank
switch.

Note that in the custom_map_copy_from and custom_map_copy_to, you
need to figure out what happens if a read or read spans banks.
In my case, I asserted that a copy won't be more than 16MB, and two
the copy in two chunks, switching banks in the middle, if need be.

HTH.
-
allon
