Received: from cmsout02.mbox.net ([165.212.64.32])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IZotS-0007AP-Di
	for linux-mtd@lists.infradead.org; Mon, 24 Sep 2007 10:26:45 -0400
Message-ID: <adca01c7feb6$d4ea5b20$fd0ba8c0@BrianPC>
From: "Brian T" <btuch@usa.net>
To: "Jon Ringle" <JRingle@vertical.com>,
	"David Woodhouse" <dwmw2@infradead.org>
References: <4DD3AF7ECBBC43409BA36508938D01851B0072@CVAEX1.VERTICAL.COM>
Subject: Re: Clobbered file after jffs2 mount
Date: Mon, 24 Sep 2007 09:26:00 -0500
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: Brian T <btuch@usa.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi John,

>How did you determine that the modem was causing your problem? It sure
>sounds like similar symptoms.

I talked to our hardware engineer this morning who reminded me of what the problem was.  It was with 
a Conexant modem ( not Multitech like I had stated before ).  These are basically his words, though 
I don't follow it fully ( which is why I am in software, and not hardware ;)  )

"Basically, on our hardware, the Conexant modem was connected using it's Parallel port to save a 
UART on the main board.  But while in this mode, it's address lines could become "output".  The 
Intel flash we use is on 0xa0-0xa2, and the Conexant modem could sometimes "jam" 0xa1-0xa2 and cause 
use to see a temp corruption on the file system. "

After a new firmware for the modem was released, it should have fixed the problem, but by that time, 
our hardware engineer has switched the modem to be connected through it's serial interface.

Not sure if this makes sense.  If you need me to revise I can ask him to clarify the fuzzy parts. 
Not sure if this helps you identify the problem you are seeing, but it might accidentally =)

-Brian
