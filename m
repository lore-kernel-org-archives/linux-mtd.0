Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xdi26-0002Of-Tl
 for linux-mtd@lists.infradead.org; Mon, 13 Oct 2014 15:59:39 +0000
Message-ID: <1413215953.7906.63.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v3] mtd: ubi: Extend UBI layer debug/messaging capabilities
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Tanya Brokhman <tlinder@codeaurora.org>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>
Date: Mon, 13 Oct 2014 18:59:13 +0300
In-Reply-To: <1413214637.7906.49.camel@sauron.fi.intel.com>
References: <1412593268-12377-1-git-send-email-tlinder@codeaurora.org>
 <1413214637.7906.49.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-10-13 at 18:37 +0300, Artem Bityutskiy wrote:
> On Mon, 2014-10-06 at 14:01 +0300, Tanya Brokhman wrote:
> > If there is more then one UBI device mounted, there is no way to
> > distinguish between messages from different UBI devices.
> > Add device number to all ubi layer message types.
> 
> Looks good to me, pushed to the master branch of the linux-ubifs.git
> tree. Later, when the merge window is closed, I'll merge this patch to
> the linux-next branch too.

Tanya,

sorry, I was not careful enough, I merged it and tested against the
Linuses head, it is fine.

But it does not apply the the linux-ubifs.git tree. There are conflicts.

But more importantly, you did not get the 'block.c' right. There we use
the same printing macros, but we do not have 'struct ubi_info' there at
all.

Please, enable the R/O block layer feature and try to compile, it'll
fail.

The block driver is in 'drivers/mtd/ubi', but it is kind of a separate
driver - it does not access the internal UBI data structures.

I guess the solution would be to just use pr_* functions there instead.

CCing Ezequiel.

Please, submit a patch against the 'linux-next' branch of this tree:

git://git.infradead.org/linux-ubifs.git


Artem.
