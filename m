Received: from 235-216.205.122.dellhost.com ([216.205.122.235] helo=imagequestdesign.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17FmyE-0007BI-00
	for <linux-mtd@lists.infradead.org>; Thu, 06 Jun 2002 03:25:51 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: linux-mtd@lists.infradead.org
Subject: Re: GRUB on DoC Millenium
Date: Wed, 5 Jun 2002 22:24:58 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200206052223203.SM02488@there>
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

On Wed, 5 Jun 2002, Dzuy Nguyen wrote: 

> Has anyone got it working.  If so, please help.

I have an 8MB DoC Milennium that will boot using GRUB - for now, it's on a PC 
in the M-Sys ISA Card.  I've also had it booting on a small 386-based 
embedded board.

As Ilguiz pointed out, you probably need the "-diskonchip-biosnetboot" 
option.  If that doesn't work for you, I'd be glad to write up the procedure 
I used to get this working.   Let me know.

Regards,

Mark
