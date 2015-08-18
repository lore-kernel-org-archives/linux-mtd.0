Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRcdY-0008G8-FX
 for linux-mtd@lists.infradead.org; Tue, 18 Aug 2015 08:52:52 +0000
Message-ID: <1439887948.31419.118.camel@gmail.com>
Subject: Re: [PATCH] mkfs.ubifs: remove the check for UBIFS_MAX_LEB_SZ
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 richard.weinberger@gmail.com,  computersforpeace@gmail.com
Cc: linux-mtd@lists.infradead.org
Date: Tue, 18 Aug 2015 11:52:28 +0300
In-Reply-To: <1439873555-5352-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1439873555-5352-1-git-send-email-yangds.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2015-08-18 at 12:52 +0800, Dongsheng Yang wrote:
> There is a commit 92ed6c0 to increase UBIFS_MAX_LEB_SZ
> to 2MiB. But recently, as the leb size become larger and
> larger, 2MiB is not a suitable limit any more.
> 
> Then remove this check in mkfs.ubifs
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
> NOTE:
> 	I am not sure the reason why we have to
> limit the leb size in mkfs.ubifs. Because
> I did not find any reason for it, I send
> this patch out. It's very possible I am
> mising something.

Well, this is sanity check for the user input. If you accidentally
added few zeroes, we want to spot this and inform you, and you may
appreciate that we did not just created a bugus image for you. That's
the idea.

Another point is that UBIFS and UBI reads eraseblocks entirely into
memory from time to time, e.g., when scanning the journal (UBIFS) or
when doing wear-levelling (UBI). Too large eraseblocks will affect the
UBI/UBIFS drivers negatively - the latency may increase significantly
(thing reading eraseblock, modifying, writing it), as well as memory
consumption.

I personally like to be strict, and if I am not sure about something, I
put limits, assuming that others may later change the limits.

That said, I'd prefer to increase the limit instead of removing it
altogether. I suggest to make it reasonably large, so that it suits
your purposes.

Artem.
