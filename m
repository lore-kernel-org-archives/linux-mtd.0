Received: from ganon.smb.utfors.se ([195.58.112.27])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 189hYL-0004tT-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2002 07:58:13 +0000
Received: from LUMENTIS02 ([212.105.56.242])
 by ganon.smb.utfors.se (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H5700FD567L6G@ganon.smb.utfors.se> for
 linux-mtd@lists.infradead.org; Thu, 07 Nov 2002 09:28:34 +0100 (MET)
Date: Thu, 07 Nov 2002 09:28:33 +0100
From: Joakim Tjernlund <joakim.tjernlund@lumentis.se>
Subject: RE: seeking help on JFFS2
In-reply-to: <4556.1036599271@passion.cambridge.redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Reply-to: joakim.tjernlund@lumentis.se
Message-id: <IGEFJKJNHJDCBKALBJLLOELLFHAA.joakim.tjernlund@lumentis.se>
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

David

Why does JEDEC end up in cfi_cmdset_0001.c?
If it should end up in cfi_cmdset_0001.c, why does it not set cmdset_priv?

 Jocke
> 
> 
> JZhang@erinc.com said:
> > 0xc00e0008 is in do_read_onechip (cfi_cmdset_0001.c:473).
> > 473         if (!(((struct cfi_pri_intelext*)cfi->cmdset_priv)->FeatureSupport & 2))
> 
> Why didn't you say so before? :)
> 
> cvs up
> 
