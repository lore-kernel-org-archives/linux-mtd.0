Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1URlUP-0006DG-EV
 for linux-mtd@lists.infradead.org; Mon, 15 Apr 2013 15:38:41 +0000
Message-ID: <1366040431.2768.83.camel@sauron.fi.intel.com>
Subject: Re: UBIFS Problems After Upgrading Kernel
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Paul Black <paul.0000.black@gmail.com>
Date: Mon, 15 Apr 2013 18:40:31 +0300
In-Reply-To: <51682A79.1010307@gmail.com>
References: <51682A79.1010307@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Fri, 2013-04-12 at 16:38 +0100, Paul Black wrote:
> [    1.650000] UBIFS error (pid 1): ubifs_read_node: bad node type (255
> but expected 6)
> [    1.660000] UBIFS error (pid 1): ubifs_read_node: bad node at LEB
> 0:0, LEB mapping status 0
> [    1.660000] Not a node, first 24 bytes:
> [    1.670000] 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff       

UBIFS says that the eraseblock where it expects to find the Master node
is empty. Somehow the data is not there anymore. Can you compare the
contents of the corresponding /dev/mtd and /dev/ubi* before and after
upgrade?

-- 
Best Regards,
Artem Bityutskiy
