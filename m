Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15lAh0-0001QM-00
	for <linux-mtd@lists.infradead.org>; Sun, 23 Sep 2001 15:57:14 +0100
Received: from Win1 (hidden-user@[212.105.56.242])
	by mail.utfors.se (8.8.8/8.8.8) with SMTP id RAA08516
	for <linux-mtd@lists.infradead.org>; Sun, 23 Sep 2001 17:05:45 +0200 (MET DST)
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: <linux-mtd@lists.infradead.org>
Subject: jffs2_gcd_mtd4 <defunct>
Date: Sun, 23 Sep 2001 17:06:36 +0200
Message-ID: <IGEFJKJNHJDCBKALBJLLEEDLEPAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20010922160958.5797.qmail@qis>
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

Hi all

Small bug:
When i mount a jffs2 FS as root FS I get this [jffs2_gcd_mtd4 <defunct>]
process(and a [jffs2_gcd_mtd4] process as well). This will not happen
if I mount jffs2 as a extra FS after boot(mount /dev/mtdblock4 /jffs2)

Another thing:
We are suffering somewhat from long mount times and I remember something
about checkpoints in jffs2 would solve this problem. Correct?

Anybody working on this? I would be happy to do some testing if needed.

Yet another thing:
I remember seeing something about beeing alble to control the compression
level in jffs2(at mount time?), but I can not find in the sources. Is it
implemented yet?

    Joakim
