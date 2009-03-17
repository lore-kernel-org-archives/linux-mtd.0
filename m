Received: from xenbox.codefidence.com ([92.48.73.16])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ljbfs-0003M5-3q
	for linux-mtd@lists.infradead.org; Tue, 17 Mar 2009 15:58:00 +0000
Message-ID: <49BFC87D.5050608@codefidence.com>
Date: Tue, 17 Mar 2009 17:57:49 +0200
From: Gilad Ben-Yossef <gilad@codefidence.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Loop back mounted files on UBIFS file system
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,


I am trying to loop back mount a file (which contains a FAT32 file 
system image), which resides on a UBIFS file system.



Command I try:

*# losetup -o 4096 /dev/loop/0 /mnt/ubifs/fat32
***


Where /nnt/ubifs/ is the mount point of a valid UBIFS file system.


The response I get is:


losetup: /dev/loop/0: No such device or address


Trying a loopback mount from any other file system (such as tmpfs) works.


Trying to do any other activity with the UBIFS file system works as well.


Please note that I am NOT trying to loop back mount a file containing a 
UBIFS file system image and I read the FAQ and understand that this is 
not directly possible, disregarding nandsim. I am trying to do the 
opposite - loopback mount a file residing on an UBIFS file system.


Googling around I've found another post citing what seems like the very 
same behaviour. The answer there was a reference to the above mentioned 
FAQ entry, which I believe is not relevant for the aforementioned reasons.


Kernel version is 2.6.24 with the last back ported UBIFS support. I 
realize that this is an old version and no longer maintained and I'd be 
happy to try the latest and greatest, just wanted to make sure this is 
something that is supposed to work rather then that I am trying to do 
the impossible.



Many thanks,

Gilad

-- 
Gilad Ben-Yossef 
Chief Coffee Drinker

Codefidence Ltd.
The code is free, your time isn't.(TM)

Web:    http://codefidence.com
Email:  gilad@codefidence.com
Office: +972-8-9316883 ext. 201
Fax:    +972-8-9316885
Mobile: +972-52-8260388

	The Doctor: Don't worry, Reinette, just a nightmare. 
	Everyone has nightmares. Even monsters from under the 
	bed have nightmares, don't you, monster?
	Reinette: What do monsters have nightmares about?
	The Doctor: Me! 
