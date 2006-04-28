Received: from anchor-post-32.mail.demon.net ([194.217.242.90])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FZRqB-0002ls-Kf
	for linux-mtd@lists.infradead.org; Fri, 28 Apr 2006 08:13:02 -0400
Message-ID: <445206A9.7040803@lougher.demon.co.uk>
Date: Fri, 28 Apr 2006 13:12:25 +0100
From: Phillip Lougher <phillip@lougher.demon.co.uk>
MIME-Version: 1.0
To: Josh Boyer <jwboyer@gmail.com>
References: <BAY19-F25626592BB956CC2B586828BBF0@phx.gbl>	
	<003301c66852$c7371280$153335bf@cabletime.com>	
	<f9d2a5e10604271433y34b72c19p22bb10c79b305d97@mail.gmail.com>	
	<44515552.6040606@lougher.demon.co.uk>
	<625fc13d0604271806q422fb20cm2f748cd669d5080@mail.gmail.com>
In-Reply-To: <625fc13d0604271806q422fb20cm2f748cd669d5080@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Russ Dill <russ.dill@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: squashfs and NAND flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer wrote:
> On 4/27/06, Phillip Lougher <phillip@lougher.demon.co.uk> wrote:
> 
>> A couple of years ago I did some work making Squashfs work with NAND.
>> Because of the inherent unreliability of NAND, and the constant MTD code
>> base changes, I decided not to make this work publically available.
> 
> 
> Just out of curiosity, did you do this in the filesystem itself or via
> a FTL like what has been discussed so far?

It was done in the filesystem itself, in a way similar to that which has 
been discussed.  Bad blocks were skipped, and on good blocks the block 
number of the stored block was written to the OOB data area.  Blocks 
were accessed by going to the expected block, and (if this wasn't the 
expected block due to bad block skipping) then scanning forwards until 
the expected block was found.

> 
>> Providing native NAND support in Squashfs represents too much work for
>> absolutely no gain.  It is unlikely this is going to change in the near
>> future.
> 
> 
> There is gain in providing a generic mechansim that block type
> filesystems can use to do this though.  Simple economics are going to
> drive more devices to have NAND parts than NOR, so something needs to
> eventually fill this gap.
> 

I think I was maybe a little unclear as to what I meant.  I think a 
generic mechanism that block filesystems could use would be very useful. 
  What I meant was providing NAND support in Squashfs would generate a 
lot more support requests and require more maintenance.  Unfortunately, 
I don't have the resources to do this.

Phillip
