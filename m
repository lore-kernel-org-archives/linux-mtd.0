Received: from [200.53.172.155] (helo=qis)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15gvOS-0007pD-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Sep 2001 22:48:33 +0100
Message-ID: <20010911205853.21285.qmail@qis>
References: <20010911201345.19481.qmail@qis>
            <20010911182623.15217.qmail@qis>
            <8583.1000239450@redhat.com>
            <9772.1000243426@redhat.com>
In-Reply-To: <9772.1000243426@redhat.com> 
From: "Nikolai Vladychevski" <niko@isl.net.mx>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: duplicate DoC millenium with dd
Date: Tue, 11 Sep 2001 20:58:53 GMT
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

David Woodhouse writes: 


> 
>> > What are you partitioning it for, btw?
>> It's a firewall. I place linuxbios & kernel first, then I nftl_format
>> /dev/mtd0 0xFIRST_FREE_BLOCK and place a minimal filesystem (cramfs)
>> on the  rest of the chip.....
> 
> You nftl_format it with the offset, which gives you a block device /dev/
> nftla. Then you use sfdisk rather than mkcramfs -o /dev/nftla. If you only 
> have one partition, then a partition table is just a waste of space.

right! thanks, didn't note it.... 

>  
> 
>> since you say nftl_format removes
>> original badblocks  table M-Systems put on the chip at fabrication
>> time, I kinda dislike this  util..... 
> 
> It's now better than it was. And you shouldn't need to use it more than 
> once, if the total size of your LinuxBIOS and kernel don't change (or if 
> you left enough space for a little bit of expansion).

yes, this is the problem... right now I'm leaving 1 Meg for the linuxBIOS 
and kernel and right now there is left as little as 40 K bytes free space of 
that meg. 

I beleive the kernel will grow very soon and 40 K will not be enough. 
Allocating more space, 1.5Meg for example seems to be a huge waste of space.
I think I will have to nftl_format with a variable offset every time I do an 
update..... you say nftl_format is better, but how much? If I update the 
software on the chip once a week (it's an automatic update via remote 
server), will it survive for 2 years without errors, for example ? 

> 
>>  is there any way to avoid nftl_format and boot my cramfs from /dev/
>> mtdblockX  or /dev/mtd0 with an 0xXXXX offset or something like this? 
> 
> Not out of the box. It's trivial to do that though, by using the mtd
> version of partitions, which makes it look like two (or more) separate MTD
> devices. 

Wow! that sounds cool! I have to try it, but would linuxBIOS conflict with 
it? 


Nikolai 
