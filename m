Received: from ganon.smb.utfors.se ([195.58.112.27])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GLhg-0000Uv-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2002 16:03:20 +0000
Received: from LUMENTIS02 ([212.105.56.242])
 by ganon.smb.utfors.se (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H6500LMT4OCNP@ganon.smb.utfors.se> for
 linux-mtd@lists.infradead.org; Mon, 25 Nov 2002 17:33:49 +0100 (MET)
Date: Mon, 25 Nov 2002 17:33:48 +0100
From: Joakim Tjernlund <joakim.tjernlund@lumentis.se>
Subject: RE: mkfs.jffs2.c rework
In-reply-to: <5873.1038241237@passion.cambridge.redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: johan.adolfsson@axis.com, andersen@codepoet.org,
 linux-mtd@lists.infradead.org
Reply-to: joakim.tjernlund@lumentis.se
Message-id: <IGEFJKJNHJDCBKALBJLLGEEPFIAA.joakim.tjernlund@lumentis.se>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
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
> >  If my memory serves me correct, I think the semantics of the clean
> > marker has changed somewhat. A clean erase block with only a clean
> > maker on it will have the ACCURATE bit set, but once you write to it
> > you should clear the ACCURATE bit. This is an optimization that
> > enables JFFS2 to avoid scanning empty erase blocks. 
> 
> Er, I'm not convinced we ever actually did that. You may be right though.
> 
> --
> dwmw2

Well, I had a look. It's in CVS HEAD(nodemgmt.c, do_reserve_space()) but not in the 2.4 branch.
Or am I misreading it?
