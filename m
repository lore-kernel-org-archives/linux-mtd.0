Received: from imo-r01.mx.aol.com ([152.163.225.97])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eKJZ-00022h-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 19:25:33 +0000
Message-ID: <3E39852F.8020100@netscape.net>
Date: Thu, 30 Jan 2003 20:03:59 +0000
From: kokseng choo <Kschoo70C@netscape.net>
MIME-Version: 1.0
To: tglx@linutronix.de
CC: linux-mtd@lists.infradead.org
Subject: Re: Bad Block Handling in jffs2
References: <03E2B9D1.52EE4DE7.0265FBE9@netscape.net> <200301302016.00528.tglx@linutronix.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Hi Thomas,

Thanks for your reply.

Thomas Gleixner wrote:

>>   So, I write a program to skip the bad block, and copy the data to the
>>next block. The missing file seems to appear on the file system now, the
>>size looks correct. But when I diff the binary of the file to that of
>>original, they are different and the binary failed to execute.
>>    
>>
>Strange.
>Have you built your fs-image with the correct block size ?
>
  The command I used is as followed:
mkfs.jffs2 -p --eraseblock=16KiB -l -d ./jffsRoot -o jffs2.image
I changed the mkfs.jffs2 so that it allows me to create image with 16KiB 
erased size. I presumed it is not a problem to make the changed, but may 
be I was wrong. The raised the question about my changes sometimes ago 
in http://lists.infradead.org/pipermail/linux-mtd/2002-October/006273.html..
Please let me know, if my assumption is wrong.

>  
>
>> Is anyone manage to transfer an image to the nand device that has bad
>>blocks without losing any files ?
>>    
>>
>Yes, I do
>
>  
>
That sounds a lot more promising. Probably there is somthing wrong my 
configuration, I will look into my configuration again.

cheers
choo
