Received: from [203.199.83.248] (helo=mailFA12.rediffmail.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17dZ8f-0004tf-00
	for <linux-mtd@lists.infradead.org>; Sat, 10 Aug 2002 17:30:53 +0100
Date: 10 Aug 2002 16:30:19 -0000
Message-ID: <20020810163019.19590.qmail@mailFA12.rediffmail.com>
MIME-Version: 1.0
From: "sriram  neelakandan" <oops2k@rediffmail.com>
Reply-To: "sriram  neelakandan" <oops2k@rediffmail.com>
To: linux-mtd@lists.infradead.org
Subject: tiny JFFS2 Reader
Content-type: text/plain;
	format=flowed
Content-Disposition: inline
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

Hi group,
I am looking for a tiny jffs2 reader that can read a file from a 
jffs2 partition..
the code in jffs2reader.c in the MTD utils tar
mtd-20000704.tar.gz (hope this is the latest)
does not have the logic to read beyond the first node of the 
file.
basically the following func is called and it doesnt read beyond 
the first inode !
--snip--
putblock(char *b, size_t bsize, size_t * rsize,
 			  struct jffs2_raw_inode *n)
{
 	uLongf dlen = n->dsize;

if (*rsize < n->isize)
 		bzero(b + *rsize, n->isize - *rsize);

 	switch (n->compr) {
 	case JFFS2_COMPR_ZLIB:
 		uncompress((Bytef *) b + n->offset, &dlen,
 				   (Bytef *) ((char *) n) + sizeof(struct jffs2_raw_inode),
 				   (uLongf) n->csize);
 		break;

 	case JFFS2_COMPR_NONE:
 		memcpy(b + n->offset,
 			   ((char *) n) + sizeof(struct jffs2_raw_inode), dlen);
 		break;

 	case JFFS2_COMPR_ZERO:
 		bzero(b + n->offset, dlen);
 		break;

 		/* [DYN]RUBIN support required! */

 	default:
 		fprintf(stderr, "Unsupported compression method!\n");
 		exit(EXIT_FAILURE);
 	}

 	*rsize = n->isize;
}



How to get the compelete file from the partition? any ideas or is 
there any other code.

i looked at the actual JFFS2 kernel code , it uses pretty huge 
inode caches which is initted  during sys_mount...but i cant 
afford to put the MTD & FS code in my tiny bootloader!

TIA
sriram
__________________________________________________________
Give your Company an email address like
ravi @ ravi-exports.com.  Sign up for Rediffmail Pro today!
Know more. http://www.rediffmailpro.com/signup/
