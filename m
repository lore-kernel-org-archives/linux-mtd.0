Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fPOP-0003aU-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Feb 2002 17:58:29 +0000
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: "Robert Kaiser" <rob@sysgo.de>, "Adam Wozniak" <awozniak@comdev.cc>,
        <linux-mtd@lists.infradead.org>,
        "Jonas Holmberg" <jonas.holmberg@axis.com>
Subject: RE: Re-entrancy of flash erase/write 
Date: Mon, 25 Feb 2002 19:08:03 +0100
Message-ID: <IGEFJKJNHJDCBKALBJLLOEMNFBAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-reply-to: <29086.1014659686@redhat.com>
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

> 
> joakim.tjernlund@lumentis.se said:
> > The patch I sent a week or 2 ago support that for cmdset0001.c
> 
> Ah, sorry. Resend (or pointer)?
pointer, http://lists.infradead.org/pipermail/linux-mtd/2002-February/004117.html

But there is one problem, I did this against 1.91 so I don't know if it applies 
against latest CVS. Has anybody tried?

 Jocke
