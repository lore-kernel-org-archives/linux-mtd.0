Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16MRWi-0003GQ-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 Jan 2002 10:24:40 +0000
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: CLEANMARKER question 
Date: Fri, 4 Jan 2002 11:33:55 +0100
Message-ID: <IGEFJKJNHJDCBKALBJLLOEIIFAAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1002.1010137321@redhat.com>
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


> From: David Woodhouse [mailto:dwmw2@redhat.com]On Behalf Of David
> Woodhouse
> Joakim.Tjernlund@lumentis.se said:
> > I have problems to understand the CLEANMARKER concept. Can a flash
> > erase  sector which has a CLEANMARKER in the beginning contain any
> > data or can one  assume that the rest of the erase sector is erased?
> 
> Yes, it can contain data. The CLEANMARKER is there just to show that the 
> erase completed successfully. It's not erased before the block is actually 
> filled with data.
OK, I suspected that much. So after a CLEANMARKER there can be a NODETYPE_INODE or
a NODETYPE_DIRENT?

Why do you do 2 scan_empty() calls in scan_eraseblock() ?

> 
> What are your plans for improving the mount speed?
Well, sofar I have only identified one improvement. One could add an isempty() function
in the mtd layer. That would improve scaning for empy flash so that you dont
have to mtd->read() into a buffer and then check the buffer for 0xffffffff. How
does that sound?
