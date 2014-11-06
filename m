Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmICx-0004FI-4D
 for linux-mtd@lists.infradead.org; Thu, 06 Nov 2014 08:14:19 +0000
Message-ID: <1415261634.958.175.camel@sauron.fi.intel.com>
Subject: Re: The future of ubi_assert()
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Thu, 06 Nov 2014 10:13:54 +0200
In-Reply-To: <545B2C30.2010206@nod.at>
References: <545A9E6E.3000208@nod.at>
 <1415258504.958.151.camel@sauron.fi.intel.com> <545B2C30.2010206@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-11-06 at 09:07 +0100, Richard Weinberger wrote:
> I think we can do better.
> Think of wl.c, if an ubi_assert() in wl.c does not hold, we can put the UBI device
> into read-only mode and continue execution.
> BUG_ON() would be too much and WARN_ON() would lead to data corruption as the execution
> would go on...
> Something like ext4's errors=remount-ro. :)

If you are willing to do the work, and if it is needed, and actually
tested, sure.
