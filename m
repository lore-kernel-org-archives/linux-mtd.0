Received: from [64.46.100.7] (helo=wolverine.usa.assimilatedservers.net)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ALkug-0005X8-AT
	for <linux-mtd@lists.infradead.org>; Mon, 17 Nov 2003 15:03:38 +0000
Received: from dsl-217-155-44-202.zen.co.uk ([217.155.44.202]
	helo=192.168.0.4)
	by wolverine.usa.assimilatedservers.net with esmtp (Exim 4.24)
	id 1ALkJe-0008Da-2a
	for linux-mtd@lists.infradead.org; Mon, 17 Nov 2003 14:25:22 +0000
From: david stevenson <david@rondotheatre.co.uk>
To: linux-mtd@lists.infradead.org
Date: Mon, 17 Nov 2003 14:25:19 +0000
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200311171425.19219.david@rondotheatre.co.uk>
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: 8bit / 16bit access amd29f016 success
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Appolgies if this is a double posting as the first time I got the from: wrong.

Hi
This is for information, unless anyone knows more and can improve it.

I have 4off amd29F016 2megx8bit chips arranged as 4meg 16bit words.
(on a amd sc400).
I have hacked the elan-104nc.c map file to work for me. (I can post this if 
anyone wants).
I found I needed to set the proccessor to 8bit bus access mode before calling 
cfi_probe, the chips were then detected correctly, but then I needed to reset 
the bus mode to 16bit before any reading or writing.

With this slightly odd switch all works fine.
Thanks
David
