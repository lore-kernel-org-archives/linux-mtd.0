Received: from f132.law11.hotmail.com ([64.4.17.132] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Bfpz-0003dm-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Nov 2002 18:32:35 +0000
From: "J B" <mad_flasher@hotmail.com>
To: Wolfram.Gettert@fci.com, linux-mtd@lists.infradead.org
Subject: Re: Problem writing to flash with writeb()
Date: Tue, 12 Nov 2002 13:02:27 -0600
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F132Y30kkZIhTrBoe2U00000281@hotmail.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

>   	physmap_map.map_priv_1 = (unsigned 
>long)ioremap_nocache(WINDOW_ADDR,WINDOW_SIZE);
>
>	...
>
>	//Read Manufacturer and Device code
>	physmap_write8(&physmap_map,0x90,physmap_map.map_priv_1);

Are you sure you want to pass physmap_map.map_priv_1 as the address?  That 
would imply that the address you are writing 0x90 to is (2 * 
physmap_map.map_priv_1) because physmap_writeX will add map->map_priv_1 to 
whatever address you pass it.  If that is bigger than WINDOW_SIZE, I don't 
think the command will actually reach the flash chip because the address 
isn't mapped to a flash chip.  I am assuming you are using a cfi compliant 
flash chip and 0x90 is putting it into "Read Identifier Codes".  Try using 0 
for the address instead, which is what you did below.

>If I do it like this:
>
>	p = physmap_map.map_priv_1;
>	p[0] = 0x90;

Looks like this is the equivalent of:
physmap_write8(&physmap_map,0x90,0);


I could be very wrong however.  I still consider myself a newbie, so sorry 
if this doesn't make any sense.  Hope it helps though.


Josh

_________________________________________________________________
The new MSN 8: smart spam protection and 2 months FREE*  
http://join.msn.com/?page=features/junkmail
