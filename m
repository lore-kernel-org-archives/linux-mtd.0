Received: from [67.15.60.3] (helo=mail.aftek.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E6CQ3-0003UF-9v
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2005 15:20:52 -0400
Message-ID: <9291.59.95.3.108.1124479910.squirrel@59.95.3.108>
In-Reply-To: <1124475944.23647.389.camel@tglx.tec.linutronix.de>
References: <430675EB.9030905@aftek.com>
	<1124457591.23647.382.camel@tglx.tec.linutronix.de>
	<43068933.1080609@aftek.com>
	<1124475944.23647.389.camel@tglx.tec.linutronix.de>
Date: Fri, 19 Aug 2005 14:31:50 -0500 (CDT)
From: ashwinc@aftek.com
To: tglx@linutronix.de
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: is this a bug ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> So what ? You were asking a question about 2.4.19 and you got an answer
> related to that. It's coded that way in the ancient, broken and obsolete
> 2.4.19...

Couldnt agree more. But the deadlines prohibit us from upgrading it right
now. In fact I  have already fired up the board with 2.6.12-2 as stated
earlier, but theres still a while till I get everything we have running on
it.

>
> Where is the bug ?

Well, the fact that it works without any changes in 2.6.x, and that I had
to change it in 2.4. Basically, it seemed strange that rootflags is just
passed in from do_mount, remains unchanged, and later reassigned to
sb->flags in super.c.... seemed strange thats all. BTW I still need to
find out whats done differently in 2.6.x. I'm not implying this is a jffs2
bug anywhere, I just posted this to see if anyone else observed this,
since there are several others still using 2.4.19. Also, I didnt know of
the cmdline way of doing this without hacking into the source. Call me a
rookie if you want.

Well, now I know :)

Cheers,
Ashwin






**************************Disclaimer************************************
Information contained in this E-MAIL being proprietary to Aftek Infosys Limited 
is 'privileged' and 'confidential' and intended for use only by the individual
or entity to which it is addressed. You are notified that any use, copying 
or dissemination of the information contained in the E-MAIL in any manner 
whatsoever is strictly prohibited.
***************************************************************************
http://www.aftek.com/
