Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16160u-0007u3-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Nov 2001 13:11:36 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLGENIEPAA.joakim.tjernlund@lumentis.se> 
References: <IGEFJKJNHJDCBKALBJLLGENIEPAA.joakim.tjernlund@lumentis.se> 
To: joakim.tjernlund@lumentis.se
Cc: linux-mtd@lists.infradead.org
Subject: Re: mkfs.jffs2 propsal and a question about burst reads 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 06 Nov 2001 13:20:44 +0000
Message-ID: <15058.1005052844@redhat.com>
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

joakim.tjernlund@lumentis.se said:
>    I find it unconvinient and time consuming to erase the WHOLE flash partiton
>    before I can install a new FS image. Therefore I wonder if it would
>    be possible to add some flag/end marker in JFFS2 that mkfs.jffs2 could
>    set, so that JFFS2 knows that the flash space after the maker does not
>    contain valid JFFS2 data. Once JFFS2 has recongnized its FS, JFFS2 would
>    delete the end marker and resume normal behaviour. 

Then JFFS2 would just have to erase the blocks in question anyway. Better 
to just fix your bootloader or whatever you use to program the image in the 
first place so that it erases any sectors which need it, and puts a clean 
marker in them.

>    I am using Intel Strata Flash and this flash can do burst reads, so was
>    thinking that if I were to enable burst read I would gain performance. 

You need chipset magic to do that. 

--
dwmw2
