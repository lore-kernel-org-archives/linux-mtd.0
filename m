Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fP6I-0003YK-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Feb 2002 17:39:46 +0000
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>, "Robert Kaiser" <rob@sysgo.de>
Cc: "Adam Wozniak" <awozniak@comdev.cc>, <linux-mtd@lists.infradead.org>,
        "Jonas Holmberg" <jonas.holmberg@axis.com>
Subject: RE: Re-entrancy of flash erase/write 
Date: Mon, 25 Feb 2002 18:49:21 +0100
Message-ID: <IGEFJKJNHJDCBKALBJLLGEMMFBAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-reply-to: <22009.1014656857@redhat.com>
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

> I see the possibility, but surely that would only _actually_ happen if we 
> started to support writes during erase suspend? Otherwise, the only thing 
> that should happen during an erase is a _read_, which doesn't set and clear 
> vpp.
The patch I sent a week or 2 ago support that for cmdset0001.c

 Jocke
