From: David Woodhouse <dwmw2@infradead.org>
To: Chris Ellec <cellec@celerity.net>
In-Reply-To: <3FA0119A.9020003@celerity.net>
References: <3FA0119A.9020003@celerity.net>
Content-Type: text/plain
Message-Id: <1067514777.3423.11.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 30 Oct 2003 11:52:58 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: jffs2 vs NFTL
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-10-29 at 11:14 -0800, Chris Ellec wrote:
> A couple years ago I developped a system wih DOC using [N]FTL and an 
> ext2 file system which was working fine.
> 
> Now I have a new project where we'll use JFFS2 for reliability instead 
> of ext2, but I am confused as to the relationship between JFFS2 and NFTL.

JFFS2 is a file system which works directly on flash. The MTD API below
it, the Linux VFS above it.

NFTL, INFTL etc. are a kind of pseudo-filesystem which emulates a normal
block device with overwritable 512-byte sectors. The MTD API below them,
the Linux block layer above. On these, you are expected to use a
'normal' file system such as ext2, ext3, Reiserfs, etc.

> For example the help provided in the Configuration steps says that 
> CONFIG_MTD_PARTITIONS is not needed for Diskonchip, however
> http://www.linux-mtd.infradead.org/tech/nand.html
> says that the same flag is needed for JFFS2

CONFIG_MTD_PARTITIONS just gives you a way to divide a single MTD device
into many logical MTD devices. You do not need it for the DiskOnChip
because you do not use multiple logical flash devices there. If you have
'partitions' on your DiskOnChip, then you're probably thinking of
block-device partitions, which are an entirely different thing, at a
higher level.

> Does that mean that the JFFS2 driver does not use the NFTL driver ? What 
> about the new chips that need the INFTL driver ?

JFFS2 does not use the NFTL or INFTL code. JFFS2 operates directly on
flash, not on a block device.

-- 
dwmw2
