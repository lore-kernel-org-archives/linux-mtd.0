Received: from 12-234-34-139.client.attbi.com ([12.234.34.139] helo=heavens.murgatroid.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17tvly-0001eu-00
	for <linux-mtd@lists.infradead.org>; Tue, 24 Sep 2002 20:55:06 +0100
From: "Christopher Hoover" <ch@murgatroid.com>
To: "'Simon Posnjak'" <simon@activetools.si>,
	"'linux-mtd'" <linux-mtd@lists.infradead.org>
Subject: RE: jffs, jffs2
Date: Tue, 24 Sep 2002 12:54:54 -0700
Message-ID: <001501c26404$40977630$7e00000a@bergamot>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1032892912.2909.139.camel@klada.dyndns.org>
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

Use jffs2 over jffs.

Caveat with 2.5: if your flash has variable-sized blocks (e.g. Intel C3
flash), you'll need to either use the mtd CVS or patch the 2.5 sources
accordingly. 

Use mkfs.jffs2 to build the image.

With blob, just pretend "ramdisk" is "root".  You'll need to have
configured the proper partitioning into both blob and the sa1100 mtd
partition code. 

Write the image by doing "erase ramdisk; xdownload ramdisk; {send the
file}; flash ramdisk".  The erase is important.    

One final thing: be sure to configure your blob parameters to tell it
not to load the ramdisk automatically.  

-ch
