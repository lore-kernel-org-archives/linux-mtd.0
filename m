Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BnLyL-0007Fh-NR
	for linux-mtd@lists.infradead.org; Wed, 21 Jul 2004 14:37:46 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: "dibacco@inwind.it" <dibacco@inwind.it>
In-Reply-To: <I17SEM$1DC26B36820863BFFC1F5CC60A6B7223@libero.it>
References: <I17SEM$1DC26B36820863BFFC1F5CC60A6B7223@libero.it>
Content-Type: text/plain
Date: Wed, 21 Jul 2004 14:37:19 -0400
Message-Id: <1090435039.4245.11.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: mmap on jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-07-21 at 20:23 +0200, dibacco@inwind.it wrote:
> Hi,
> 
> I have a problem mapping a file opened with flag O_RDWR. This file is
> housed on a jffs2 file system that currently lives on simple ram.
> Could you give me an hint where to search for a possible solution? If
> I open the file in O_RDONLY mode the mapping is done, instead with
> O_RDWR mmap returns -EINVAL.

JFFS2 does not support shared writable mapping. This is a feature :)

Use MAP_PRIVATE instead of MAP_SHARED.

-- 
dwmw2
