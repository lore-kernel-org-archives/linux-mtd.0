Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aFj7s-0000AW-Ec
 for linux-mtd@lists.infradead.org; Sun, 03 Jan 2016 13:55:16 +0000
Message-ID: <1451829283.13942.6.camel@gmail.com>
Subject: Re: [PATCH] ubifs: Fix error codes in ubifs_iget()
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Cc: adrian.hunter@intel.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Sun, 03 Jan 2016 15:54:43 +0200
In-Reply-To: <1451829092.13942.4.camel@gmail.com>
References: <1451772666-2139-1-git-send-email-richard@nod.at>
 <1451829092.13942.4.camel@gmail.com>
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

On Sun, 2016-01-03 at 15:51 +0200, Artem Bityutskiy wrote:
> On Sat, 2016-01-02 at 23:11 +0100, Richard Weinberger wrote:
> > We cannot use positive error codes in ERR_PTR().
> > IS_ERR() won't catch them.
> 
> Right, but why there is a "err = -EINVAL;" when at 'out_invalid'.

Sorry Richard, I edited the sentence and did not notice it was messy.

Here is what I wanted to say: right, but there is a "err = -EINVAL' at
the end of 'out_invalid'.
