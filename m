Received: from structure.biochem.nchu.edu.tw ([140.120.131.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Gb8f-0002DW-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2002 08:32:13 +0000
Date: Tue, 26 Nov 2002 05:16:39 +0800 (CST)
From: shadow <saturn@structure.biochem.nchu.edu.tw>
To: Charles Manning <manningc2@actrix.gen.nz>
cc: linux-mtd@lists.infradead.org
Subject: Re: SmartMedia Card need to create fs before mounting it ?
In-Reply-To: <20021126074041.D763F14C8B@dragon.actrix.co.nz>
Message-ID: <Pine.LNX.4.44.0211260511250.20708-100000@structure.biochem.nchu.edu.tw>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Tue, 26 Nov 2002, Charles Manning wrote:
Could you tell me how to format the partition ?
This is mkfs.jffs2's help..
--
/root>mkfs.jffs2 --help
Usage: mkfs.jffs2 [OPTIONS]
Make a JFFS2 filesystem image from an existing directory tree

Options:
  -p, --pad[=SIZE]       Pad output to SIZE bytes with 0xFF. If SIZE is
                         not specified, the output is padded to the end of
                         the final erase block
  -r, -d, --root=DIR     Build filesystem from directory DIR (default: 
cwd)
  -s, --pagesize=SIZE    Use page size (max data node size) SIZE (default: 
4KiB)
  -e, --eraseblock=SIZE  Use erase block size SIZE (default: 64KiB)
  -o, --output=FILE      Output to FILE (default: stdout)
  -l, --little-endian    Create a little-endian filesystem
  -b, --big-endian       Create a big-endian filesystem
  -D, --devtable=FILE    Use the named FILE as a device table file
  -f, --faketime         Change all file times to '0' for regression 
testing
  -q, --squash           Squash permissions and owners making all files be 
owned by root
  -U, --squash-uids      Squash owners making all files be owned by root
  -P, --squash-perms     Squash permissions on all files
  -h, --help             Display this help text
  -v, --version          Display version information
------
I read the help, but still don't understand how to do.
It seem only makes a filesystem image, but can't format partition.

Best regards,
Brian Lee


> On Tue, 26 Nov 2002 08:34, shadow wrote:
> > Hi.
> > When I mount a partition on the SmartMedia card, if I must need to put a
> > jffs2's image on it before mounting it ? Or existed a tool that can
> > directly make jffs2 on the nand flash ?
> 
> I believe you will need to run mkfs.jffs2 to format the nand first.
> 
> You will find this in mtd/util in the mtd cvs.
> 
> -- CHarles
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
