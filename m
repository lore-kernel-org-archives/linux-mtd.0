Received: from snifit.smb.utfors.se ([195.58.112.20])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A1NwD-00086U-PD
	for <linux-mtd@lists.infradead.org>; Mon, 22 Sep 2003 11:29:01 +0100
Received: from LUMENTIS02 ([212.105.56.242])
 by snifit.smb.utfors.se (iPlanet Messaging Server 5.2 Patch 1 (built Aug 19
 2002)) with SMTP id <0HLM008CD2F2EZ@snifit.smb.utfors.se> for
 linux-mtd@lists.infradead.org; Mon, 22 Sep 2003 12:28:14 +0200 (MEST)
Date: Mon, 22 Sep 2003 12:28:14 +0200
From: Joakim Tjernlund <joakim.tjernlund@lumentis.se>
To: linux-mtd@lists.infradead.org
Message-id: <IGEFJKJNHJDCBKALBJLLCEHKFPAA.joakim.tjernlund@lumentis.se>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Subject: GC does not handle big syslog files
Reply-To: joakim.tjernlund@lumentis.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

By mistake I left syslog running on one of our boards. The syslog file
has grown to 1.2 MB and is cuasing major problem for our app. Syslog just
appends a line at time and that leads to LOTS of small data nodes.

It takes about 10 minutes for jfs2_gcd to "check" this file during which writes
to the FS hangs. Moreover this file is never GC:ed since theres is
lots of free space left.

1) Should I expect writes to hang while jffs2_gcd is "checking" a file?

2) I think JFFS2 needs GC files even when there is plenty of room left in the
   FS since fragmentation can get really bad. Comments?

  Jocke
