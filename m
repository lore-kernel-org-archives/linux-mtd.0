Received: from crl-mail.crl.dec.com ([192.58.206.9])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17h7gH-0005xb-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Aug 2002 13:00:17 +0100
Message-ID: <3D623224.1090604@hp.com>
Date: Tue, 20 Aug 2002 08:12:20 -0400
From: Jamey Hicks <jamey.hicks@hp.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: Christopher Hoover <ch@murgatroid.com>, "'Conn Clark'"
 <clark@esteem.com>,
       =?ISO-8859-1?Q?=27J=F6rn_Engel=27?=
 <joern@wohnheim.fh-wedel.de>,
       "'MTD Mailing List'"
 <linux-mtd@lists.infradead.org>
Subject: Re: How does one mount an existing jffs2 partition so it is writeable?
References: <007201c247e0$1022fcd0$a15f040f@SNAGGLE> <32719.1029838865@redhat.com>
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

David Woodhouse wrote:

>ch@murgatroid.com said:
>  
>
>> Do you need to unlock your flash before you can write to it?  That's
>>not done automatically by mtd or jffs2.  There's a diff in the ARM
>>patch system by me that might be applicable. 
>>    
>>
>
>I'm beginning to wonder if we should make JFFS2 unlock automatically if it 
>finds at least some JFFS2 nodes. Or put in the 'is_flash_locked' method and 
>make JFFS2 notice that it's locked _before_ trying to write to it, and 
>print an appropriate message and mount in read-only mode so it doesn't even 
>let you _try_ to write to it.
>  
>
I would much rather that JFFS2 not unlock blocks automatically.  We tend 
to lock blocks for a reason (e.g., so that we don't accidentally erase 
the boot loader with incorrect mount options).  I think it would be 
reasonable for JFFS2 to query whether flash is locked beforehand and to 
mount read-only.  I think it would also be reasonable to provide a mount 
option directing it to unlock flash.  

Jamey
