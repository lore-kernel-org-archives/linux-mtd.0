Received: from mx10.lb01.inode.at ([62.99.145.10] helo=mx.inode.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Un5w3-0001Uz-GI
 for linux-mtd@lists.infradead.org; Thu, 13 Jun 2013 11:43:24 +0000
Received: from [83.64.51.210] (port=13850 helo=gateway1.hale)
 by smartmx-10.inode.at with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.69) (envelope-from <helmut.raiger@hale.at>)
 id 1Un5vf-0002Bz-0t
 for linux-mtd@lists.infradead.org; Thu, 13 Jun 2013 13:42:59 +0200
Received: from mail.hale (mail.hale [192.168.100.5])
 by gateway1.hale (8.13.8/8.13.7) with ESMTP id r5DBgfR7007584
 for <linux-mtd@lists.infradead.org>; Thu, 13 Jun 2013 13:42:41 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.hale (Postfix) with ESMTP id 5883E664517
 for <linux-mtd@lists.infradead.org>; Thu, 13 Jun 2013 13:42:47 +0200 (CEST)
Received: from mail.hale ([127.0.0.1])
 by localhost (mail.hale [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jy+ZJvJP4WOq for <linux-mtd@lists.infradead.org>;
 Thu, 13 Jun 2013 13:42:47 +0200 (CEST)
Received: from uni24.hale (uni24.hale [192.168.100.108])
 by mail.hale (Postfix) with ESMTPSA id 195F76643CB
 for <linux-mtd@lists.infradead.org>; Thu, 13 Jun 2013 13:42:47 +0200 (CEST)
Message-ID: <51B9B01A.1090504@hale.at>
Date: Thu, 13 Jun 2013 13:42:18 +0200
From: Helmut Raiger <helmut.raiger@hale.at>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: UBIFS: How to reserve space to be used right before power cut
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

     we try the following:

1) setup some data in an 8kByte block in RAM
2) frequently modify this data during normal operation
3) on a power fail signal write the block to a file on an UBIFS partition
4) recover from the written data after the power cut

   The time between power failure notification and the uP-reset is 
guaranteed by hardware
and is about 20ms.

We first thought about using fallocate() to allocate a corresponding 
block on the partition
but soon found that UBIFS does not implement a native fallocate() and 
thus the generic
one simply wrote the file to 8k of zeros. This of course will not help.

Simply fsync()ing the file in case of a power cut does not seem 
reliable, for
   - the file system might be full
   - write back cache operation may interfere with the synch-ing of our file
   - the garbage collector might run to free dirty LEBs and erase the 
corresponding PEBs
The latter 2 overstretching our timing requirements.

This is on an embedded system (i.mx31, arm1136@532MHz) running Linux 
3.something
(we are quite flexible in adapting new kernel versions), currently 
testing on 3.0.45.

Could someone hint the course to follow for this szenario?

Any pointers appreciated,
Helmut


--
Scanned by MailScanner.
