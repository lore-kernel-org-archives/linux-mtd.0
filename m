Received: from sccrmhc01.attbi.com ([204.127.202.61])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17zmr8-0004Ry-00
	for <linux-mtd@lists.infradead.org>; Fri, 11 Oct 2002 00:36:38 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: juanba romance gallego <juanbaromance@yahoo.es>
Subject: Re: Newbie question
Date: Thu, 10 Oct 2002 19:33:59 -0400
References: <20021010204449.84623.qmail@web21504.mail.yahoo.com>
In-Reply-To: <20021010204449.84623.qmail@web21504.mail.yahoo.com>
Cc: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20021010233606.GMTD28253.sccrmhc01.attbi.com@there>
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

If I remember correctly, the modules shipped with earlier versions of 
Mandrake did not have all the proper options enabled to support DiskOnChip 
out of the box.  This may also be true with 9.0.

You may need to rebuild the modules with the following options:
 
                CONFIG_MTD=m
                CONFIG_MTD_DEBUG=y 
                CONFIG_MTD_CHAR=m
                CONFIG_NFTL=m
                CONFIG_NFTL_RW=y 
                CONFIG_MTD_DOC2000=m
                CONFIG_MTD_DOCPROBE=m

juanba romance gallego wrote:
> No recognised DiskOnChip devices found
> Uhmm i am using the modules provided by Mandrake-9.0
> which holds a 2.4.19-9 linux kernel.
