Received: from sccrmhc03.attbi.com ([204.127.202.63])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 188gxa-0005ya-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 Nov 2002 13:08:06 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: Joseph Teichman <af671@osfn.org>,
 linux-mtd@lists.infradead.org
Subject: Re: Problems with GRUB & nftl_format
Date: Mon, 4 Nov 2002 08:35:55 -0500
References: <1036364578.1604.12.camel@localhost.localdomain>
In-Reply-To: <1036364578.1604.12.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20021104133752.KDZS16414.sccrmhc03.attbi.com@there>
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

Is the nftl driver part of your kernel, or compiled as a module?  Bad things 
can happen if the nftl driver is loaded when nftl_format is run:

http://lists.infradead.org/pipermail/linux-mtd/2002-June/005123.html
http://lists.infradead.org/pipermail/linux-mtd/2002-August/005831.html

As Henrik mentioned, you could try the 5.x dformat utility (under DOS) to 
install Grub and format the DoC.  After that, the normal Linux tools (fdisk, 
mke2fs, etc) can be used to partition and create the filesystem.

The other alternative is to compile the MTD code as modules, and make sure 
nftl is not loaded when running nftl_format.

See http://lists.infradead.org/pipermail/linux-mtd/2002-October/006166.html 
for details on both methods.

Regards,

Mark

Joseph Teichman wrote:
> I have a Virgin Webplayer with a doc2000. I had completely hosed the doc
> after trying to write somebody's image to the doc. So, I did an erase
> all and used nftl_format to set up the doc again. I used fdisk to
> partition it and set up an ext2 file system. Then, I used doc_loadbios
> tool to install GRUB. GRUB Installed successfully, and it works, but at
> the same time, it seems to have hosed up the doc again. The only thing
> that I can do is to reformat the doc, which of course overwrites GRUB,
> leaving back to square one. I am using a 2.4.19 kernel, with the latest
> cvs grab of mtd-linux. Can anyone tell me what is happening and how I
> can work around it?
