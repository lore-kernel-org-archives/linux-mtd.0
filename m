Received: from mail.i-bucks.com ([216.2.101.40] helo=speedy.i-bucks.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178pIc-0006n6-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 22:30:07 +0100
Message-Id: <3.0.32.20020517142924.0074ef10@mail.i-bucks.com>
Date: Fri, 17 May 2002 14:29:50 -0700
To: Robert Kaiser <rob@sysgo.de>
From: john riehl <jr@i-bucks.com>
Subject: Re: Getting big flash onto motherboards. Will CF work? what
  will?
Cc: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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

At 08:51 PM 5/17/02 +0200, Robert Kaiser wrote:
>
>>> 
>> These are called DiskonModule  (as opposed to diskonchip).  
>> 
>> They come in both 40 and 44 pin connections.  They arent very big, they
>> look like a terminator.  Most are flat, like a hard drive (but much shorter
>> & smaller), some have an L-shape.
>
>So, except for the form factor, what is the difference beween these and
>a CompactFlash (wrt to reliabilty on power failure, etc.) ?
>

I dont know.  I dont know about CF.  how does cf connect to a system?  what
happens when cf loses power?  how do you write to a cf system?  can you
boot from it?

afaik, dom keeps info despite a power loss.

I have seen non-dom flash drives, arrays of flash chips with battery
backups which mimic hard drives, similar to dom.  these flash disk arrays
require power to retain their info.  These devices are NOT small, taking up
about the same size as a 5.25 floppy drive. 

jr
