Received: from ganon.smb.utfors.se ([195.58.112.27])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GLQ4-0000RK-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2002 15:45:08 +0000
Received: from LUMENTIS02 ([212.105.56.242])
 by ganon.smb.utfors.se (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H6500LEK3U1NP@ganon.smb.utfors.se> for
 linux-mtd@lists.infradead.org; Mon, 25 Nov 2002 17:15:38 +0100 (MET)
Date: Mon, 25 Nov 2002 17:15:37 +0100
From: Joakim Tjernlund <joakim.tjernlund@lumentis.se>
Subject: RE: JFFS2 Config / FAQ
In-reply-to: <3DE24AA0.9040106@WirelessNetworksInc.com>
To: Herman Oosthuysen <Herman@WirelessNetworksInc.com>,
 linux-mtd@lists.infradead.org
Reply-to: joakim.tjernlund@lumentis.se
Message-id: <IGEFJKJNHJDCBKALBJLLOEENFIAA.joakim.tjernlund@lumentis.se>
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
> Stupid question of the month:
> I need to know how many blocks to leave for the GC at a minimum.
> 
> One?

I think it's 5 blocks currently. It should be possible to lower that count,
but that needs testing.

    Jocke 
