Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dtg7-0003hf-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 13:54:32 +0000
Received: from LUMENTIS02 (hidden-user@[212.105.56.242])
	by mail.utfors.se (8.8.8/8.8.8) with SMTP id PAA22997
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 15:05:13 +0100 (MET)
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: <linux-mtd@lists.infradead.org>
Subject: jffs2_scan_make_ino_cache() in scan.c very slow
Date: Thu, 21 Feb 2002 15:05:12 +0100
Message-ID: <IGEFJKJNHJDCBKALBJLLOEKHFBAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <200202211355.g1LDtdL04701@skylab.outpostsentinel.com>
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

I have made some crude measures in jffs2_scan_medium() and friends to
see where most of the time is spent. It turns out that
jffs2_scan_make_ino_cache() is takes about 50 % of the total mount time!

What can be done to decrease this time?

 Jocke

PS.
    I sent a patch (Subject:  cfi_cmdset0001.c: bug fixes and new features) a week ago
    and I haven't got any comments so far.
