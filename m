Received: from mail1.bluewin.ch ([195.186.1.74])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18be4m-0006se-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 Jan 2003 09:55:12 +0000
Received: from [192.168.0.15] (213.3.72.145) by mail1.bluewin.ch (Bluewin AG 6.7.015)
        id 3E102592002854FE for linux-mtd@lists.infradead.org; Thu, 23 Jan 2003 10:26:06 +0000
Subject: Lilo-mtd passes garbage as kernel command line
From: Raphael Hertzog <eng@eipm.ch>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Message-Id: <1043317565.559.24.camel@localhost>
Mime-Version: 1.0
Date: 23 Jan 2003 11:26:05 +0100
Content-Transfer-Encoding: 8bit
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

Hello,

I'm using lilo-mtd (lilo 21 with the patch available on the website) to
boot on a DOC. It works but I have a little problem. It looks like lilo
is passing garbage to the kernel as kernel command line.

During the boot there's a message saying: 
Kernel command line: <insert esoteric garbage here>

Also I noticed that any argument given in the append configuration item
in lilo.conf is not used... which is understandable if the kernel really
see the garbage as its command line.

Does anyone else experience the same problem ? How can I help you track
this bug down ?

I use a stock 2.4.19 kernel.

I tried to understand where the kernel looks for its command line
arguments and where lilo puts them but it's a bit complicated for me.

Cheers,
-- 
Raphaël Hertzog - EIPM SA
