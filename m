Received: from dsl-210-15-250-78.nsw.netspace.net.au ([210.15.250.78]
	helo=mail.magtech.com.au)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DDsin-00050u-J4
	for linux-mtd@lists.infradead.org; Tue, 22 Mar 2005 18:23:38 -0500
Received: from mail.magtech.com.au (localhost [127.0.0.1])
	by localhost.magtech.com.au (Postfix) with ESMTP id CC163894002
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Mar 2005 10:23:32 +1100 (EST)
Received: from [192.168.65.196] (unknown [192.168.65.196])
	by mail.magtech.com.au (Postfix) with ESMTP id 068EC894002
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Mar 2005 10:23:32 +1100 (EST)
Message-ID: <4240A8F3.1070203@magellan-technology.com>
Date: Wed, 23 Mar 2005 10:23:31 +1100
From: Aras Vaichas <arasv@magellan-technology.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <1ffb4b0705032109224f2c7805@mail.gmail.com>
	<423FBE7F.6090700@magellan-technology.com>
In-Reply-To: <423FBE7F.6090700@magellan-technology.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: mtd permission denied
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Aras Vaichas wrote:
> Mike Lee wrote:
> 
>> Hi all
>>   i tried to flash_erase and other flash_* tools to my mtd device, the
>> return value is permission denied, but i am already root login. I have
>> selected MTD_CHAR and MTD_BLOCK in kernel.  Do i miss somethings?
> This is spookey, I just got the exact same problem at the same time(!)
> 
> I'm trying to write data to my Dataflash device, but I get a "permission 
> denied" error whenever I try to fopen the file "/dev/mtd/2" to write the 
> data into it. I can read data from it with no problems.

Sorry to answer my owns post ... but Mike gave me a hint as to what the problem 
was.

Mike had MTD_WRITEABLE set in the mask_flags for his partitions, so they were 
read-only.

My "permission denied" was caused because I'd left the default Dataflash 
partition settings in at91_dataflash.c from the MTD backporting work I did last 
year. The default settings don't honour erase block boundaries and thus the 
partitions were being mounted "read only". Silly me didn't look at dmesg ...


regards,

Aras
