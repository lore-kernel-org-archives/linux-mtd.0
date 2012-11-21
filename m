Received: from mail.free-electrons.com ([88.190.12.23])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tb76r-0002fe-N0
 for linux-mtd@lists.infradead.org; Wed, 21 Nov 2012 10:00:46 +0000
Date: Wed, 21 Nov 2012 11:00:22 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Ezequiel Garcia <elezegarcia@gmail.com>
Subject: Re: [RFC/PATCH 0/1] ubi: Add ubiblock driver
Message-ID: <20121121110022.35db364f@skate>
In-Reply-To: <CALF0-+WuaUn5b=2XrzqW7pvM=N1MfQf=sFwLFOrokTkHbOXh3w@mail.gmail.com>
References: <CALF0-+WuaUn5b=2XrzqW7pvM=N1MfQf=sFwLFOrokTkHbOXh3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Tim Bird <tim.bird@am.sony.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Ezequiel Garcia,

On Tue, 20 Nov 2012 19:39:38 -0300, Ezequiel Garcia wrote:

> * Read/write support
> 
> Yes, this implementation supports read/write access.

While I think the original ubiblk that was read-only made sense to
allow the usage of read-only filesystems like squashfs, I am not sure a
read/write ubiblock is useful.

Using a standard block read/write filesystem on top of ubiblock is going
to cause damage to your flash. Even though UBI does wear-leveling, your
standard block read/write filesystem will think it has 512 bytes block
below him, and will do a crazy number of writes to small blocks. Even
though you have a one LEB cache, it is going to be defeated quite
strongly by the small random I/O of the read/write filesystem.

I am not sure letting people use read/write block filesystems on top of
flashes, even through UBI, is a good idea.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
