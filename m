Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fFhZ-0002vI-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Feb 2002 07:37:38 +0000
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: Slow jffs2 startup on DOM 
Date: Mon, 25 Feb 2002 08:47:53 +0100
Message-ID: <IGEFJKJNHJDCBKALBJLLOEMCFBAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-reply-to: <14164.1014588644@redhat.com>
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

> >    Any chance to see this patch in the jffs2-2_4-branch too? 
> 
> Have you tested it? I haven't :)

Not yet. I will start with the other stuff that went in during the weekend :-)
 
> I've actually changed round a lot of that code in the trunk now, fixing the
> NAND problem I mentioned - that cleanup won't go into the stable branch, but
> the original one probably can.
> 
> To be honest, I'm more interested in working out why kupdated blocks and 
> fixing that, rather than trying to work around it by reducing the symptoms.

hmm, thinking of it, I remember something about kupdate on LK. A quick
search gives: http://www.cs.helsinki.fi/linux/linux-kernel/2002-07/0213.html
Looks like Andrew Morton is on it.

 Jocke
