Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17vtln-0006hW-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2002 07:11:03 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <33BB463469A3D411B08F00508BDD1626E1872C@ntsyork.adva_york> 
References: <33BB463469A3D411B08F00508BDD1626E1872C@ntsyork.adva_york> 
To: John Messenger <JMessenger@advaoptical.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: Trouble building mkfs.jffs2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 30 Sep 2002 07:10:59 +0100
Message-ID: <27336.1033366259@redhat.com>
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

JMessenger@advaoptical.com said:
> cd util
> make 
> ...
> compr_zlib.c:15:2: #error "The userspace support got too messy and was removed.  Update your mkfs.jffs2".

> Has this been fixed?  Any suggestions? 

rm compr_zlib. ; cvs up compr_zlib.c ; make

>  Related question: how do you build your initial JFFS2 images?  I am
> also trying to loopback mount a JFFS2 for a PPC machine on an i386 Red
> Hat 7.3 after loading JFFS2 modules, but no luck so far. 

mkfs.jffs2 will build a _populated_ image for you, containing all the files
in the directory you specify. It's more like mkisofs/mkcramfs than
mkfs.ext2, and should probably be renamed accordingly.

If you really want to mount the image on your PC, you need to be using the 
latest code which can handle byteswapping (see the #define in jffs2.h) and 
load an 'mtdram' module on the PC with size and erasesize matching your 
hardware. Then see http://www.handhelds.org/z/wiki/LoopBack

Don't forget the '-b' option to mkfs.jffs2.

--
dwmw2
