Received: from [202.37.96.11] (helo=gatekeeper.tait.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AAFiN-0007CJ-Nn
	for <linux-mtd@lists.infradead.org>; Thu, 16 Oct 2003 22:31:24 +0100
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id h9GLULS19552
	for <linux-mtd@lists.infradead.org>; Fri, 17 Oct 2003 10:30:21 +1300
Received: from sunstorm.tait.co.nz (sunstorm.tait.co.nz [172.25.40.9])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id h9GLUKS19546
	for <linux-mtd@lists.infradead.org>; Fri, 17 Oct 2003 10:30:20 +1300
Received: from tait.co.nz ([172.25.110.7])
 by sunstorm.tait.co.nz (iPlanet Messaging Server 5.1 (built May  7 2001))
 with ESMTP id <0HMV0069BD2IXL@sunstorm.tait.co.nz> for
 linux-mtd@lists.infradead.org; Fri, 17 Oct 2003 10:30:18 +1300 (NZDT)
Date: Fri, 17 Oct 2003 10:30:09 +1300
From: Robin Gilks <robin.gilks@tait.co.nz>
In-reply-to: <3F8DBD52.1020100@tait.co.nz>
To: mtd list <linux-mtd@lists.infradead.org>
Message-id: <3F8F0DE1.9030207@tait.co.nz>
MIME-version: 1.0
References: <3F8B814D.3050408@tait.co.nz>
 <1066111497.3172.37.camel@imladris.demon.co.uk> <3F8DBD52.1020100@tait.co.nz>
Content-type: text/plain; charset=us-ascii; format=flowed
Content-transfer-encoding: 7BIT
Subject: Re: Mount of jffs2 partition fails
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Robin Gilks wrote:
> David Woodhouse wrote:
> 
>> On Tue, 2003-10-14 at 17:53 +0000, Robin Gilks wrote:
>>
>>
>>> / # mount -t jffs2 /dev/mtdblock1 /mnt
>>> Write clean marker to block at 0x000d0000 failed: -30
>>
>>
>>
>> -30 is also -EROFS but we don't normally see it there so we don't have a
>> nice helpful message telling you the reason :)
>>
>> I have no clue why your flash allows erases but not writes. This is a
>> flash hardware/driver problem, not JFFS2. Can you do more testing on the
>> raw /dev/mtd0 device itself using
>> read/write/ioctl(MEMERASE)/ioctl(MEMUNLOCK) to see what you need to do
>> to make it work?
> 
> 
> I've concluded that the ST chip I'm using, although being Intel command 
> set compatible, requires a different approach. That being the case I 
> enabled the ST chip option and on booting I now get the following.
> 


In a message from Stuart Menefy on (CFI fixup code ref:
<20030523235020.3ca198e1.stuart.menefy@st.com>) on 24th May 2003, this 
exact problem was highlighted and is due to the ST chip not supporting 
the buffer write mode of the Intel CFI chips. I'll try applying Stuarts 
patches to 2.4.22 stock kernel and see how I get on!!

I'm still working on why the lock/unlock is operating correctly (or 
should I just unprotect the block that MTD is using in the bootstrap?)



-- 
Robin Gilks
Senior Design Engineer          Phone: (+64)(3) 357 1569
Tait Electronics                Fax  :  (+64)(3) 359 4632
PO Box 1645 Christchurch        Email : robin.gilks@tait.co.nz
New Zealand
