Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1614SK-0007ke-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Nov 2001 11:31:48 +0000
Received: from Win1 (hidden-user@[212.105.56.242])
	by mail.utfors.se (8.8.8/8.8.8) with SMTP id MAA12224
	for <linux-mtd@lists.infradead.org>; Tue, 6 Nov 2001 12:40:39 +0100 (MET)
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: <linux-mtd@lists.infradead.org>
Subject: mkfs.jffs2 propsal and a question about burst reads
Date: Tue, 6 Nov 2001 12:40:18 +0100
Message-ID: <IGEFJKJNHJDCBKALBJLLGENIEPAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <15375.1005031664@redhat.com>
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

Hi it's me again ..

with some more questions/suggestions

1)
   Before I can install a new JFFS2 FS image(produced with mkfs.jffs2) I have
   to erase the whole flash partition, then copy the image(with cp image /dev/mtdlock4)
   the device. Then I boot linux and now JFFS2 will re-erase all unused blocks. 
   If I skip the initial erase, then JFFS2 will be confused by the earlier
   JFFS2 contens which remain after the previous JFFS2 FS that were on the flash.

   I think this is the expected behavior, correct?

   I find it unconvinient and time consuming to erase the WHOLE flash partiton
   before I can install a new FS image. Therefore I wonder if it would
   be possible to add some flag/end marker in JFFS2 that mkfs.jffs2 could
   set, so that JFFS2 knows that the flash space after the maker does not
   contain valid JFFS2 data. Once JFFS2 has recongnized its FS, JFFS2 would
   delete the end marker and resume normal behaviour. 
   
   What do you think?  

2)
   I am using Intel Strata Flash and this flash can do burst reads, so was
   thinking that if I were to enable burst read I would gain performance.

   I rember some discussion about this a while back, but I did not see 
   any positive reports about gained performance. Has anybody done
   this and did you gain any performance?

  Joakim 
