Received: from ipmail04.adl6.internode.on.net ([2001:44b8:8060:ff02:300:1:6:4])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tb8ja-0006Db-Na
 for linux-mtd@lists.infradead.org; Wed, 21 Nov 2012 11:44:52 +0000
Subject: Re: BUG at kernel/timer.c:1100 when using JFFS2
From: Nathan Williams <nathan@traverse.com.au>
To: dedekind1@gmail.com
In-Reply-To: <1353496126.2378.6.camel@laptop>
References: <1353483457.9160.26.camel@laptop>
 <1353484194.2701.5.camel@sauron.fi.intel.com>
 <1353496126.2378.6.camel@laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 21 Nov 2012 22:44:47 +1100
Message-ID: <1353498287.2378.9.camel@laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2012-11-21 at 22:08 +1100, Nathan Williams wrote:
> On Wed, 2012-11-21 at 09:49 +0200, Artem Bityutskiy wrote:
> > You probably use 3.5? There was a bug which was fixed, try the latest
> > stable 3.5 version, the fix must be there.
> > 
> 
> No I'm using 3.6.  Do you know what the patch was so I can look it up?
> 
Ok I'll try 3.6.7.  "JFFS2: fix unmount regression" seems to be your
patch.  Thanks for your help.

Regards,
Nathan
