Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15tWxD-0002Ae-00
	for <linux-mtd@lists.infradead.org>; Tue, 16 Oct 2001 17:20:31 +0100
Received: from Win1 (hidden-user@[212.105.56.242])
	by mail.utfors.se (8.8.8/8.8.8) with SMTP id SAA06317
	for <linux-mtd@lists.infradead.org>; Tue, 16 Oct 2001 18:29:13 +0200 (MET DST)
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: <linux-mtd@lists.infradead.org>
Subject: Question/suggestion
Date: Tue, 16 Oct 2001 18:29:23 +0200
Message-ID: <IGEFJKJNHJDCBKALBJLLEEJHEPAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <18185.1003209961@redhat.com>
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

Hi All

First: 
I have noticed that when I mount a jffs2 FS(created with mkfs.jffs2) for the
first time and look at the output of the df command, I see that "Use%" field
slowly rise to 100% and then it drops back to ~15% and then it stays there.
During this rise I also noticed that kupdate was eating alot of CPU(~80%)

Is this normal?

Second:
I have been playing with compression a bit. I changed the compress order so
that RTIME is tried before ZLIB and this is what I got:

                     zlib            rtime
RootFS image size    7582088 bytes   9295044 bytes
mount time           10 sek          10 sek

The system also feels a bit faster with RTIME than ZLIB when execute
programs like ls, du. Is RTIME faster to decompress data than ZLIB or is it
just in my mind? :-) I am on a custom MPC860 board 80 MHz.

Is there any point to have a config option for preferred compression algorithm order?

 Joakim 
