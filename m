Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16qCSn-0001Yh-00
	for <linux-mtd@lists.infradead.org>; Wed, 27 Mar 2002 12:23:37 +0000
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: Unable to recover from CRC failiure 
Date: Wed, 27 Mar 2002 13:22:34 +0100
Message-ID: <IGEFJKJNHJDCBKALBJLLMELKFCAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <28320.1017226494@redhat.com>
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


> joakim.tjernlund@lumentis.se said:
> >  I have no problem with getting a bad CRC on the JFFS2 FS at times,
> > but that I am unable to get rid of the offending file(utmp).
> 
> perl -e "unlink 'utmp';"

I don't have perl on this system. It's an emmbedded system. Is there another
way? Why can I not just do a rm?

> 
> I, on the other hand, _do_ have a problem with you getting a bad CRC, if it 
> means you lose data. How did it happen?

:-) According to our system test it was after installing a new version of our SW and
reboot. 
The reason I not too troubled is that we got a batch of bad Strata Flash:es a while
back ago. They carry FPO revision P and no one seems to know what revision P is. I think
it's some pre production crap. We already know that erase suspend does not work so I attribute
this CRC problem to bad flash until the HW department has proven otherwise.

    Jocke
