Received: from outbound.mailhop.org ([63.208.196.171])
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GaDEM-0002MH-OW
	for linux-mtd@lists.infradead.org; Wed, 18 Oct 2006 16:21:19 +0100
Received: from 84-216-44-108.sprayadsl.telenor.se ([84.216.44.108]
	helo=arbetsmyra.dyndns.org)
	by outbound.mailhop.org with esmtpa (Exim 4.51) id 1GaDE6-0002mi-TG
	for linux-mtd@lists.infradead.org; Wed, 18 Oct 2006 11:21:03 -0400
Content-Type: text/plain;
  charset="iso-8859-1"
From: Ronny L Nilsson <rln-mtd@arbetsmyra.dyndns.org>
To: Philippe Bentz <philippe.bentz@dialine.fr>, linux-mtd@lists.infradead.org
Subject: Re: M29W640DB bad address for writing (0x554)
Date: Wed, 18 Oct 2006 17:20:41 +0200
References: <200603061526.28697.philippe.bentz@dialine.fr>
In-Reply-To: <200603061526.28697.philippe.bentz@dialine.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20061018152100.556362DE@arbetsmyra.dyndns.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi
I've been bitten by the same bug as Philippe discovered in march:
http://lists.infradead.org/pipermail/linux-mtd/2006-March/014934.html


Using a 16-bit NOR flash in 8-bit mode doesn't work. (At least with 
chips from STMicroelectronics and kernel 2.6.18 and kernel 2.6.16). The 
function
	include/linux/mtd/cfi.h:cfi_build_cmd_addr()
makes a faulty address calculation so the chip doesn't receive commands 
properly. What cfi_build_cmd_addr() is doing is calculating: 
	0x2aa * 2 = 0x554
This is however a bad value! It should be 0x555 or the chip will simply 
ignore the command.



I can see no obvious clean method for fixing this issue. A Philippe 
mentions though, one can insert an ugly conditional statement and it'll 
work.

return ((cmd_ofs * type * interleave == 0x554u) ? 0x555u :
	cmd_ofs * type * interleave);



BR
/Ronny Nilsson
