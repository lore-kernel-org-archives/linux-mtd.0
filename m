Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12As0I-0003KS-00
	for mtd-list@infradead.org; Wed, 19 Jan 2000 10:06:18 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12As0G-0003KM-00
	for mtd@infradead.org; Wed, 19 Jan 2000 10:06:16 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0001171855040.29220-100000@sunapee.transcept.com> 
References: <Pine.LNX.4.21.0001171855040.29220-100000@sunapee.transcept.com> 
To: Pavel Roskin <pavel_roskin@geocities.com>
Cc: mtd@infradead.org, linux-kernel@vger.rutgers.edu,
    Jes.Sorensen@cern.ch
Subject: Re: Patch for PowerPC 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 19 Jan 2000 10:15:24 +0000
Message-Id: <E12As96-0001Tn-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


pavel_roskin@geocities.com said:
>  - Some macros are not constants on PPC and cannot be used after "case".
>   Converted to if-else chains.

Then either the cpu_to_le16 macro is buggy, gcc is buggy,
 or we should be using __constant_cpu_to_le16 or some such routine. 

I don't think reverting to if-else chains is the right thing to do.

Comments, anyone?

                
-               switch(bci.Status) {
-               case cpu_to_le16(BLOCK_FREE):
+               if (bci.Status == cpu_to_le16(BLOCK_FREE))
                        thisEUN = 0;
-                       break;
-               case cpu_to_le16(BLOCK_USED):
+               else if (bci.Status == cpu_to_le16(BLOCK_USED))
                        lastgoodEUN = thisEUN;
-                       break;
-               case cpu_to_le16(BLOCK_IGNORE):
-               case cpu_to_le16(BLOCK_DELETED):
-                       break;
-               default:
+               else if (bci.Status != cpu_to_le16(BLOCK_IGNORE) &&
+                        bci.Status != cpu_to_le16(BLOCK_DELETED))
                        printk("Unknown status for block %d in EUN %d: %x\n",block,thisEUN, bci.Status);
-               }
 


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
