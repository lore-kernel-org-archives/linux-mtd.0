Received: from pd9e413bf.dip.t-dialin.net ([217.228.19.191] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fmFV-0005OK-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Feb 2002 18:22:49 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: Radu Corlan <rcorlan@pcnet.ro>
Subject: Re: nftl problem
Date: Tue, 26 Feb 2002 19:37:40 +0100
Cc: linux-mtd@lists.infradead.org
References: <Pine.LNX.4.10.10202262018550.952-100000@pinot.profis.ro>
In-Reply-To: <Pine.LNX.4.10.10202262018550.952-100000@pinot.profis.ro>
MIME-Version: 1.0
Message-Id: <0202261937400K.10190@thomas>
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

On Wednesday, 27. February 2002 02:30, Radu Corlan wrote:

> I didn't do the 16-bit stuff yet - use just one chip at this time. when i
> try to mount the jffs2 fisesystem, i get a loong delay; with debug
> enabled, it seems that it scans the device for freespace markers or
> something; After that, is mounts the filesystem, shows the right amount of
> free space, but when i write to it, the changes are not maintained over a
> remount or reboot.
>
> But i'm just thinking: the ppc is big endian; maybe i must set the option
> on mkfs?
Due to the fact, that we changed the complete layout, there's currently no 
support to use a Image, which was built on your development system. Use the 
raw flash. mount it. copy files to it. Please get the latest source out of 
CVS. There was a change in nand.c concerning the delays and the ECC_LAYOUT.
Enable Use JFFS2 layout for OOB area (CONFIG_MTD_NAND_ECC_JFFS2). 

-- 
Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
