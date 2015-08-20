Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSO2p-0002lD-Eb
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 11:30:08 +0000
Message-ID: <1440070182.31419.200.camel@gmail.com>
Subject: Re: [PATCH 2/2] ubifs: Allow O_DIRECT
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, Dongsheng
 Yang <yangds.fnst@cn.fujitsu.com>
Date: Thu, 20 Aug 2015 14:29:42 +0300
In-Reply-To: <1440016553-26481-2-git-send-email-richard@nod.at>
References: <1440016553-26481-1-git-send-email-richard@nod.at>
 <1440016553-26481-2-git-send-email-richard@nod.at>
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

On Wed, 2015-08-19 at 22:35 +0200, Richard Weinberger wrote:
> Currently UBIFS does not support direct IO, but some applications
> blindly use the O_DIRECT flag.
> Instead of failing upon open() we can do better and fall back
> to buffered IO.
> 
> Cc: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> Cc: dedekind1@gmail.com
> Suggested-by: Dave Chinner <david@fromorbit.com>
> Signed-off-by: Richard Weinberger <richard@nod.at>

Richard,

The idea was to explicitly reject what we do not support. Let's say I
am an app which requires O_DIRECT, and which does not want to work with
non-O_DIRECT. What would I do to ensure O_DIRECT?

Could you please check what other file-systems which do not support
O_DIRECT do in this case? Do they also fall-back to normal IO instead
of explicitly failing? If yes, we can do what is considered to be the
"standard" behavior.

Thanks!
