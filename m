Received: from h1.handhelds.org ([192.58.209.91] helo=handhelds.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C0S9D-0007Wy-Ee
	for linux-mtd@lists.infradead.org; Thu, 26 Aug 2004 17:51:08 -0400
Message-ID: <412E5AFC.5050000@joshuawise.com>
Date: Thu, 26 Aug 2004 17:49:48 -0400
From: Joshua Wise <joshua@joshuawise.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, Kernel-discuss@handhelds.org,
	h2200-port mailing list <h2200-port@handhelds.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 
Subject: HAMCOP NAND driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,

Is there any reason why HAMCOP NAND driver is not in the MTD directory 
and MTD CVS as all the other NAND drivers are?

Also, what is the status of that driver? A quick flip through seems to 
show that it's only got support for read-in commands, although I'm not 
too familiar with the HAMCOP's NAND architecture. If it's only got read 
support, is someone already working on write? (If not, I will volunteer 
to do that... don't want to duplicate work, though.)

Thanks,
joshua
