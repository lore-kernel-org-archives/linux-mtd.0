Received: from [64.46.100.7] (helo=wolverine.usa.assimilatedservers.net)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ACovf-0003U4-1A
	for <linux-mtd@lists.infradead.org>; Fri, 24 Oct 2003 00:31:43 +0100
Received: from dsl-217-155-44-202.zen.co.uk ([217.155.44.202]
	helo=192.168.0.4)
	by wolverine.usa.assimilatedservers.net with esmtp (Exim 4.24)
	id 1AClKm-0007QX-9l
	for linux-mtd@lists.infradead.org; Thu, 23 Oct 2003 19:41:24 +0000
From: david stevenson <david@avoncliff.com>
To: linux-mtd@lists.infradead.org
Date: Thu, 23 Oct 2003 20:40:22 +0100
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200310232040.23006.david@avoncliff.com>
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: 2.2.18 status + jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi
I am very new to this and am having problems understanding the current 
position.
I am trying to build a linux system for a amd cs400 based system with amd 
29f016 chips as the root fs.
I have the mtd-jffs-howto dated aug2001 and the mtd-patch-2.2.18 of 20001218, 
but following the instructions gives me compile errors with __exit. So I have 
added #define __exit to fix these and now I get "undefined reference to 
init_mtd". Looking through this list archives I find in feb2001 reference to 
changing the method of init calls. But I guess I do not have this change.
I did try applying the current CVS patch file, but it refuses to run on 
2.2.18.

Am I going in the wrong direction?
Is it possible to use jffs2 on these chips in 2.2.18?
The reason for not using a later kernel is problems booting it with the alios 
bootloader, but I guess I could revisit those.

If it is practical in 2.2.18 can you advise which patches I should be using.
Thanks
David
PS I am using mtd to write the pcmcia flash card on my host machine which is 
working very well - the code is much appreciated.
