Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1616Pg-0007wF-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Nov 2001 13:37:12 +0000
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: mkfs.jffs2 propsal and a question about burst reads 
Date: Tue, 6 Nov 2001 14:45:11 +0100
Message-ID: <IGEFJKJNHJDCBKALBJLLMENKEPAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <15058.1005052844@redhat.com>
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
> joakim.tjernlund@lumentis.se said:
> >    I find it unconvinient and time consuming to erase the WHOLE flash partiton
> >    before I can install a new FS image. Therefore I wonder if it would
> >    be possible to add some flag/end marker in JFFS2 that mkfs.jffs2 could
> >    set, so that JFFS2 knows that the flash space after the maker does not
> >    contain valid JFFS2 data. Once JFFS2 has recongnized its FS, JFFS2 would
> >    delete the end marker and resume normal behaviour. 
> 
> Then JFFS2 would just have to erase the blocks in question anyway. Better 
> to just fix your bootloader or whatever you use to program the image in the 
> first place so that it erases any sectors which need it, and puts a clean 
> marker in them.

hmm, I don't follow you here. I don't mind that much that the blocks are erased
again by JFFS2, since it will(should) be a background job, but I would like
like to be able to tell JFFS2 whatever is after the initial image should be
considered non valid JFFS2 data and be put on the "to be erased" queue. 

> 
> >    I am using Intel Strata Flash and this flash can do burst reads, so was
> >    thinking that if I were to enable burst read I would gain performance. 
> 
> You need chipset magic to do that.

I have the chipset magic(I think). I am using a MPC860 that has 
User Programmable Machine's(UPM). I am using one UPM to control my SDRAM
and the other UPM could be used to control the Flash. 

> 
> --
> dwmw2
> 
> 
