Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16awyb-0002X3-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Feb 2002 10:49:25 +0000
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "Robert Kaiser" <rob@sysgo.de>, <linux-mtd@lists.infradead.org>
Cc: "David Woodhouse" <dwmw2@infradead.org>,
        "J?rn Engel" <joern@wohnheim.fh-wedel.de>
Subject: RE: MTD concat layer
Date: Wed, 13 Feb 2002 12:00:03 +0100
Message-ID: <IGEFJKJNHJDCBKALBJLLOEGGFBAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.21.0202121938210.25544-102000@dagobert.svc.sysgo.de>
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

> Hi,
> 
> 
> I see two possible uses for this:
> 
> 1) Having flash filesystem volumes span multiple physical chips
>    I have recently seen several people ask for this on the mailing list.

I thougth this was already supported? Just create a mtd partition that will
span two or more banks and mount a JFFS2 FS on top of that partition.

 Jocke 
