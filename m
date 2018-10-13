Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gBGIs-0005m6-Sc
 for linux-mtd@lists.infradead.org; Sat, 13 Oct 2018 09:33:48 +0000
Date: Sat, 13 Oct 2018 11:33:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dunlap@infradead.org
Subject: Re: [PATCH] ubifs: Fix WARN_ON logic in exit path
Message-ID: <20181013093334.GA11189@kroah.com>
References: <20181013081841.13369-1-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181013081841.13369-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Oct 13, 2018 at 10:18:41AM +0200, Richard Weinberger wrote:
> ubifs_assert() is not WARN_ON(), so we have to invert
> the checks.
> Randy faced this warning with UBIFS being a module, since
> most users use UBIFS as builtin because UBIFS is the rootfs
> nobody noticed so far. :-(
> Including me.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Fixes: 54169ddd382d ("ubifs: Turn two ubifs_assert() into a WARN_ON()")
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
> Greg,
> 
> can you please take this patch directly?
> It fixes a brown paper bug which was introduced in rc1, I'd like to avoid
> having it in a release and going the -stable path.

Now merged, thanks.

greg k-h
