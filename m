Received: from shyguy.smb.utfors.se ([195.58.112.21])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17uXbQ-0005ky-00
	for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2002 13:18:44 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "John Hall" <john.hall@optionexist.co.uk>,
	"Linux MTD list \(E-mail\)" <linux-mtd@lists.infradead.org>
Subject: RE: set_user_nice in 2.4.18
Date: Thu, 26 Sep 2002 14:18:42 +0200
Message-ID: <IGEFJKJNHJDCBKALBJLLEELGFGAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <541025071C7AC24C84E9F82296BB9B950806E5@OPTEX1.optex.local>
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

Hi John

I fixed this earlier today, but I changed the test to < 2.4.21 since it's supposed(as I understand it)
to be in 2.4 but havn't been merged yet.

 Jocke

> 
> Hi,
> 
> I found a problem compiling the latest cvs version against armlinux 2.4.18-rmk7. It seems that this kernel doesn't have 
> set_user_nice defined; compatmac.h checks for versions less than 2.4.18 before defining set_user_nice. I checked vanilla 
> 2.4.18 and 2.4.19 and they don't have it either. A patch is attached that changes the check to check for less than 2.5.0, 
> assuming this is correct.
> 
> regards,
> John
