Received: from node0.rtunet.com ([209.144.26.106])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RBO1c-0007Ki-Dc
	for linux-mtd@lists.infradead.org; Wed, 05 Oct 2011 09:44:29 +0000
Received: from [172.25.110.84] (249.248-240-81.adsl-static.isp.belgacom.be
	[81.240.248.249])
	by node0.rtunet.com (Postfix) with ESMTP id 378EA10CD3E
	for <linux-mtd@lists.infradead.org>;
	Wed,  5 Oct 2011 04:43:54 -0500 (CDT)
Message-ID: <4E8C26DB.8040105@cse-semaphore.com>
Date: Wed, 05 Oct 2011 11:43:55 +0200
From: Gil Weber <gilw@cse-semaphore.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Flash corruption
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

Hi all,
We are using jffs2 in an embedded system with a kernel 2.6.27 and 
sometimes,
we see a file system corruption that we can't explain (no power fail, ...).
This corruption follows some basic write operations to update our software.

Once the update failed, if we connect to the device, we are unable to
write anything and we see this kind of error in the logs:

   Write of 145 bytes at 0x0096e490 failed. returned -5, retlen 144
   Write of 145 bytes at 0x0096e524 failed. returned -5, retlen 144
   Node totlen on flash (0x00000000) != totlen from node ref (0x000003e4)

We first suspect an hardware issues, because it only occurs on new devices.
But the strange thing is that we are unable to reproduce it. If we get a
device that already had a corruption and reinitialize its flash, all works
perfect! Even if we do hundreds of update, continuously, during a few week!
I also run different stresstest for jffs2 and the flash, and all seems ok.

This is why I now suspect a timing problem... and it seems that it occurs
only on new devices with a "fresh" flash. Is it possible?
Or maybe it can depends of an external factor, like the temperature?

Our flash is a Spansion GL128N90 16Mb and we are using CFI command set 
0002.
I see that it may have a weakness in the cfi_cmdset0002.c as the write and
erase timeouts are hardcoded. Can these timeouts be to small?

What do you think?

Best regards,
Gil Weber
