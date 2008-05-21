Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JyjtV-0002ys-WA
	for linux-mtd@lists.infradead.org; Wed, 21 May 2008 08:41:58 +0000
Date: Wed, 21 May 2008 10:41:45 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alex Dubov <oakad@yahoo.com>
Subject: Re: Support of removable MTD devices and other advanced features
	(follow-up from lkml)
Message-ID: <20080521084144.GA20195@logfs.org>
References: <411628.55054.qm@web36703.mail.mud.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <411628.55054.qm@web36703.mail.mud.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 20 May 2008 06:59:18 -0700, Alex Dubov wrote:
> 
> Therefore, I propose (and intend to implement) a new architecture for MTD core,
> modeled after the block device API. The "alpha" version of it is here:
> 
> http://gentoo-wiki.com/User:Oakad/mtd_proposal

Excellent!  I was just about to write my own proposal for some of this
today.  In particular I need asynchronous read, writes and erases.

So here is a lightly modified version of your mtd_request bits.  Apart
from reformatting and adding some documentation, the changes are:

- No flag for MTD_DATA, as this should be the default
- flags argument becomes int for natural alignment
- struct mtd_address introduced
- added length fields and data pointer

enum mtd_command {
	MTD_READ,
	MTD_WRITE,
	MTD_ERASE,
	MTD_COPY,
	MTD_INVALIDATE
};

/**
 * @block_no:	physical eraseblock number
 * @block_ofs:	offset within physical eraseblock
 */
struct mtd_address {
	u32	block_no;
	u32	block_ofs;
};

#define MTD_FLAG_OOB	0x01
/**
 * @mtd:	underlying memory technology device
 * @command:	read, write, erase, etc.
 * @flags:	additional flags to modify commands
 * @dst:	destination address
 * @len:	length for read/write
 * @src:	source address - only used for MTD_COPY
 */
struct mtd_request {
	struct mtd_device *mtd;
	enum mtd_command command;
	int		flags;

	u32		dst;
	void		*buf;
	u32		len;
	u32		src;
};


Jörn

-- 
My second remark is that our intellectual powers are rather geared to
master static relations and that our powers to visualize processes
evolving in time are relatively poorly developed.
-- Edsger W. Dijkstra
