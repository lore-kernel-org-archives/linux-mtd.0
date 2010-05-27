Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OHf8H-00073A-0e
	for linux-mtd@lists.infradead.org; Thu, 27 May 2010 15:36:29 +0000
Subject: Re: SELinux and UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Steve Iribarne <siribarne@grid-net.com>
In-Reply-To: <4BFE8ECC.8080404@grid-net.com>
References: <4BFE8ECC.8080404@grid-net.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 27 May 2010 18:34:43 +0300
Message-ID: <1274974483.15516.72.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-05-27 at 08:25 -0700, Steve Iribarne wrote:
> I've been searching the net and have yet to find any sort of reliable 
> "HOWTO" or "does it work" regarding SELinux, UBIFS and the extended 
> attributes.
> 
> We have need to use this here at Grid-Net and I'm trying to get a handle 
> on if the work is done or is there something else I need to do to 
> complete it.
> 
> I see that there is extended attribute support in the UBIFS, but I've 
> also seen articles (emails/etc..) claiming that the support is not fully 
> there.
> 
> Can someone point me to the right place if there is a right place?

Hi, I added basic xattr support, but never tested xattrs very well. I
did not implement ACL support. And I do not really know SELinux
requirements. So just try it and let us know, better with a patch to the
UBIFS FAQ which you can find here:
http://www.linux-mtd.infradead.org/faq/ubifs.html

and the website sources here:
http://git.infradead.org/mtd-www.git

Here is a comment from fs/ubifs/xattr.c:

/*
 * This file implements UBIFS extended attributes support.
 *
 * Extended attributes are implemented as regular inodes with attached data,
 * which limits extended attribute size to UBIFS block size (4KiB). Names of
 * extended attributes are described by extended attribute entries (xentries),
 * which are almost identical to directory entries, but have different key type.
 *
 * In other words, the situation with extended attributes is very similar to
 * directories. Indeed, any inode (but of course not xattr inodes) may have a
 * number of associated xentries, just like directory inodes have associated
 * directory entries. Extended attribute entries store the name of the extended
 * attribute, the host inode number, and the extended attribute inode number.
 * Similarly, direntries store the name, the parent and the target inode
 * numbers. Thus, most of the common UBIFS mechanisms may be re-used for
 * extended attributes.
 *
 * The number of extended attributes is not limited, but there is Linux
 * limitation on the maximum possible size of the list of all extended
 * attributes associated with an inode (%XATTR_LIST_MAX), so UBIFS makes sure
 * the sum of all extended attribute names of the inode does not exceed that
 * limit.
 *
 * Extended attributes are synchronous, which means they are written to the
 * flash media synchronously and there is no write-back for extended attribute
 * inodes. The extended attribute values are not stored in compressed form on
 * the media.
 *
 * Since extended attributes are represented by regular inodes, they are cached
 * in the VFS inode cache. The xentries are cached in the LNC cache (see
 * tnc.c).
 *
 * ACL support is not implemented.
 */

It seems like the following xattr namespaces are supported:

/*
 * Extended attribute type constants.
 *
 * USER_XATTR: user extended attribute ("user.*")
 * TRUSTED_XATTR: trusted extended attribute ("trusted.*)
 * SECURITY_XATTR: security extended attribute ("security.*")
 */

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
