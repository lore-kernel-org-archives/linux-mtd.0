Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14snqG-0002x4-00
	for mtd-list@infradead.org; Thu, 26 Apr 2001 16:38:04 +0100
Received: from moe.webcom.com ([209.1.28.141])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14snqE-0002wx-00
	for mtd@infradead.org; Thu, 26 Apr 2001 16:38:03 +0100
Message-Id: <3AE8404E.7030305@onelabs.com>
Date: Thu, 26 Apr 2001 10:35:42 -0500
From: Bari Ari <bari@onelabs.com>
Reply-To: bari@onelabs.com
Mime-Version: 1.0
To: "chris.read@activesilicon.co.uk" <chris.read@activesilicon.co.uk>
Cc: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: Power blackouts and brownouts
References: <01C0CE5A.276D58F0.chris.read@activesilicon.co.uk>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Chris Read wrote:

> Does anyone know what actually happens to a flash chip when the power 
> starts to fail during an erase or a write cycle? We are all trying to write 
> code which can recover when abruptly halted at any point, but can all the 
> devices which we are using claim the same?
> 
> I have noticed that several flash devices have a power on reset line; most 
> however do not. Whilst I appreciate that flash devices are not fully static 
> like SRAM or EPROM, and therefore must have some way of initialising in a 
> known state at power up; most devices appear to not need this external 
> signal. My hypothesis is therefore that this line may be more for abruptly 
> stopping any internal state machine during the first stages of a brown-out 
> whilst there is still sufficient power available to do so.
> 
> Any thoughts?
> 
> Chris Read

The answer depends on how the circuit designer engineered the power 
supplies and reset circuitry. How well was the circuit engineered to 
account for power failure and to minimize data corruption? The flash 
device characteristics are only part of the puzzle.

In one scenario the power supply for the flash device may hold within 
spec longer than the driver writing the data to it, in this scenario the 
flash device operates correctly and latches the data to its input 
register but the data latched may already be garbage based on the output 
driver from the device writing data to the data inputs on the flash 
since the drivers supply voltage is below spec at that clock edge when 
the data is latched.

Bari Ari                         email: bari@onelabs.com 
<mailto:bari@onelabs.com> <mailto:bari@onelabs.com>
O.N.E. Technologies
1505 Old Deerfield Road        tel: 773-252-9607
Highland Park, IL 60035        fax: 773-252-9604

http://www.onelabs.com




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
