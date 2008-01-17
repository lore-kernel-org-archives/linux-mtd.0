Received: from co203.xi-lite.net ([149.6.83.203] helo=toronto.xi-lite.net)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JFXMu-0004bY-4E
	for linux-mtd@lists.infradead.org; Thu, 17 Jan 2008 16:13:35 +0000
Message-ID: <478F7E6D.8010300@parrot.com>
Date: Thu, 17 Jan 2008 17:12:29 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Jffs2 and big file = very slow jffs2_garbage_collect_pass
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

Hi,


we have a 240 MB jffs2 partition with summary enabled and no 
compression. We use 2ad8ee713566671875216ebcec64f2eda47bd19d git jffs2 
version 
(http://git.infradead.org/?p=mtd-2.6.git;a=commit;h=2ad8ee713566671875216ebcec64f2eda47bd19d)


On this partition we have several file (less than 1 MB) and a big file 
in the root (200 MB).

The big file is a FAT image that is exported with usb-storage (with usb 
device) or mounted on a loopback device.

After some FAT operations, we manage to get in a situation were the 
jffs2_garbage_collect_pass take 12 minutes.

jffs2_lookup for the big file (triggered with a ls in the root) take 12 
minutes.

If we do a ls without waiting that jffs2_garbage_collect_pass finish, ls 
takes 12 minutes to complete.

We applied the 4 patches starting from "Trigger garbage collection when 
very_dirty_list size becomes excessive" to "Don't count all 'very dirty' 
blocks except in debug mode", but it doesn't change anything.


Why jffs2 take so much time in jffs2_garbage_collect_pass for checking 
the nodes ?
Reading the whole raw flash take about 40s-1min.
Does it read the flash in a random order ?

What does the jffs2_lookup ?
Why it is so long.


What are the alternative ?
Trying yaffs2 ?
Export a smaller file ?

Matthieu


PS : if the big file is moved in a subdirectory, then the ls in the root 
dir is fast, but access to the big file is slow (12 Minutes).
