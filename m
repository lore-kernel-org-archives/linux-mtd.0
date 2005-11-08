From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20051108183339.GB31446@wohnheim.fh-wedel.de>
References: <20051105162650.620266000@b551138y.boeblingen.de.ibm.com>
	<20051105162712.921102000@b551138y.boeblingen.de.ibm.com>
	<20051108105923.GA31446@wohnheim.fh-wedel.de>
	<m3zmofovsc.fsf@maxwell.lnxi.com>
	<20051108183339.GB31446@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Nov 2005 19:03:24 +0000
Message-Id: <1131476604.27347.115.camel@baythorne.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christoph Hellwig <hch@lst.de>, linux-mtd@lists.infradead.org,
	"Eric W. Biederman" <ebiederman@lnxi.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/25] mtd: move ioctl32 code to mtdchar.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-11-08 at 19:33 +0100, Jörn Engel wrote:
> mtdblock.c, while being quite a bit more complicated, does not require
> a ton of ioctls, will not confuse users with minor number 7 actually
> being device number 3 and magically being read-only despite unix
> permissions and hardware properties. 

MAKEDEV and the documentation and udev ought to be perfectly sufficient
to deal with the slight inconvenience caused by the use of minor
numbers. The protection afforded by the read-only devices has its uses.

> Can you name a few examples, where mtdchar.c makes sense?  I've found
> it to be quite useless.

mtdchar allows you to explicitly control erases and per-byte writes. You
can't do that with mtdblock. And you might not even want CONFIG_BLK_DEV
enabled.

-- 
dwmw2
