Received: from snifit.smb.utfors.se ([195.58.112.20])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17NFKu-0002Jf-00
	for <linux-mtd@lists.infradead.org>; Wed, 26 Jun 2002 17:08:04 +0100
Received: from LUMENTIS02 ([212.105.56.242]) by
          snifit.smb.utfors.se (Netscape Messaging Server 4.15) with SMTP
          id GYBM5E00.BBC for <linux-mtd@lists.infradead.org>; Wed, 26 Jun
          2002 18:08:02 +0200
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: <linux-mtd@lists.infradead.org>
Subject: LZO compression?
Date: Wed, 26 Jun 2002 18:08:02 +0200
Message-ID: <IGEFJKJNHJDCBKALBJLLKEPKFEAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20020626120136.A18668@wohnheim.fh-wedel.de>
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

Hi 

While surfing the net I came across this link:
http://www.oberhumer.com/opensource/lzo/

It's a compression lib that is very fast and uses little memory.
Has anybody looked into using this lib instead of zlib in JFFS2?

   Jocke
