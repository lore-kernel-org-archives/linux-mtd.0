Received: from pd953a73b.dip.t-dialin.net ([217.83.167.59] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16bPhM-0004SQ-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Feb 2002 17:29:32 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: David Woodhouse <dwmw2@infradead.org>, gleixner@autronix.de
Subject: Re: JFFS2 & NAND
Date: Thu, 14 Feb 2002 18:43:35 +0100
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
References: <02021416570005.29375@thomas> <1035.1013707668@redhat.com>
In-Reply-To: <1035.1013707668@redhat.com>
MIME-Version: 1.0
Message-Id: <02021418433508.29375@thomas>
Content-Transfer-Encoding: 8bit
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

On Thursday, 14. February 2002 18:27, David Woodhouse wrote:
> gleixner@autronix.de said:
> I'm sorry I haven't been particularly responsive for the last few days.
> It's not that I'm not interested, more that the last few days included 24
> hours in a tin can coming back from linux.conf.au and I don't think I'm
> awake enough yet to attempt it :)
Ok no problem, i was a little bit irritated, that a lot of other issues were 
answered and did not know, why the discussion was broken. So this was only a 
well meant wakeup call.

I Include my latest statement on this, to have this new thread up to date.

Actual state of JFFS2 on NAND

I implemented a new structure into nand_chip structure, which describes the 
usage of the oob area. You can read and modify this structure from the 
filesystem driver via two functions, which i have implemented into the mtd 
structure. (get_oobcfg, set_oobcfg).
The mtd_oob_config structure is:
/* configuration for out of band data (NAND,DOC...) */
struct mtd_oob_config {
         int     oob_size;       /* size of out of band area */
         int     ecc_pos[6];     /* position of ECC bytes inside oob */
         int     badblock_pos;   /* position of bad block flag inside oob -1 
= inactive */
         int     eccvalid_pos;   /* position of ECC valid flag inside oob -1 
= inactive */
         int     fsdata_pos;     /* position to store filesystem specific 
information */
         int     fsdata_len;     /* length available for filesystem specific 
data */
};
With this structure we can decide at mount time, which scheme we use. Either 
the fs driver modifies it to match it's requirements or the fs driver uses 
the information given by the device driver. At the moment i use the 
information given by the device driver.

I have now fixed the most NAND related FIXME's inside JFFS2, except the 
problem with wbuf_flush fail. The cleanmarker in the oob area and the bad 
block marking is working pretty good. I modified the scan routine to collect 
bad block information. I have a old SmartMediaCard, which has bad blocks on 
it. The information is collected correct. Then I erased one of the bad blocks 
and destroyed the bad block flag. When gc erased this block again it was 
detected as bad (not totaly erased) and marked bad again. 

I ran some stress tests on the filesystem and encountered no serious problem, 
except when i used a wornout old SMCard from a digicam i ran into the 
flush_wbuf bug.

Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
