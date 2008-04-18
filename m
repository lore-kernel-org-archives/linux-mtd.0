Received: from mersenne.largestprime.net ([203.56.168.14])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jmuil-0002JO-Oj
	for linux-mtd@lists.infradead.org; Fri, 18 Apr 2008 17:50:00 +0000
Message-ID: <4808DF3B.2080702@largestprime.net>
Date: Sat, 19 Apr 2008 01:49:47 +0800
From: Bernard Blackham <bernard@largestprime.net>
MIME-Version: 1.0
To: u-boot-users@lists.sourceforge.net, linux-mtd@lists.infradead.org
Subject: Re: [U-Boot-Users] ubi and u-boot
References: <4808AE6F.4030505@largestprime.net>
	<1208536808.6654.6.camel@vader.jdub.homelinux.org>
	<20080418165957.GG31520@shareable.org>
In-Reply-To: <20080418165957.GG31520@shareable.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jamie Lokier wrote:
> Josh Boyer wrote:
>>> Is anyone working on ubi/ubifs support in u-boot?
>> I am not aware of anyone actively working on porting UBI to upstream
>> U-Boot at this exact moment.
> 
> Is it even a good idea?

 From what I've seen, UBI is the first solution with the potential for 
reliably booting from NAND flash - specifically, dealing with 
read-disturbance from adjacent blocks causing bit errors in critical 
boot blocks. This could save useful things like your kernel image (where 
it's rarely written, but it and blocks around it are read often enough 
to cause an annoying bitflip or two). The rewriting can be done once 
userspace boots, but having it in UBI to begin with makes this easier.

(Unless there's a much easier way to deal with read-disturbance that 
I've missed, in which case please lart me).

Wolfgang showed some interest briefly too.[1]

 > The UBI (version 1 :-) initial scan is not
> fast for large flash, and if the bootloader does it too, that's twice
> as much time to boot.
 >
> However, if there was a protocol for bootloader to pass the scan
> results to the booted kernel, that would be very nice.

If there's no compelling reasons not to, I'll try and find some time to 
work on ubi in uboot. I'm not expecting it to be easy though :)

Cheers,
Bernard.

[1] http://article.gmane.org/gmane.comp.boot-loaders.u-boot/32602
