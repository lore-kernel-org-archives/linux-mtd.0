Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1616fZ-0007xm-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Nov 2001 13:53:37 +0000
Message-ID: <3fab01c166cb$c9155fe0$0a070d0a@axis.se>
From: "Johan Adolfsson" <johan.adolfsson@axis.com>
To: <joakim.tjernlund@lumentis.se>, <linux-mtd@lists.infradead.org>
References: <IGEFJKJNHJDCBKALBJLLGENIEPAA.joakim.tjernlund@lumentis.se>
Subject: Re: mkfs.jffs2 propsal and a question about burst reads
Date: Tue, 6 Nov 2001 15:03:18 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

----- Original Message ----- 
From: Joakim Tjernlund <joakim.tjernlund@lumentis.se>
To: <linux-mtd@lists.infradead.org>
Sent: Tuesday, November 06, 2001 12:40
Subject: mkfs.jffs2 propsal and a question about burst reads


> Hi it's me again ..
> 
> with some more questions/suggestions
> 
> 1)
>    Before I can install a new JFFS2 FS image(produced with mkfs.jffs2) I have
>    to erase the whole flash partition, then copy the image(with cp image /dev/mtdlock4)
>    the device. Then I boot linux and now JFFS2 will re-erase all unused blocks. 
>    If I skip the initial erase, then JFFS2 will be confused by the earlier
>    JFFS2 contens which remain after the previous JFFS2 FS that were on the flash.
> 
>    I think this is the expected behavior, correct?
> 
>    I find it unconvinient and time consuming to erase the WHOLE flash partiton
>    before I can install a new FS image. Therefore I wonder if it would
>    be possible to add some flag/end marker in JFFS2 that mkfs.jffs2 could
>    set, so that JFFS2 knows that the flash space after the maker does not
>    contain valid JFFS2 data. Once JFFS2 has recongnized its FS, JFFS2 would
>    delete the end marker and resume normal behaviour. 
>    
>    What do you think?  

Perhaps we should give the erase command a "jffs2-format" option
so that it erases and writes the proper erase marker on the sectors to prevent
JFFS2 to erase them again?
The erase ulitity should then also skip erasing sectors that has the erased 
marker already which might speed up the erase a little.
I guess copying an image to the formatted flash should work even if it contains
erase marks?

/Johan
