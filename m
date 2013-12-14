Received: from mail-pb0-x229.google.com ([2607:f8b0:400e:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VriBe-0006wu-6L
 for linux-mtd@lists.infradead.org; Sat, 14 Dec 2013 05:54:51 +0000
Received: by mail-pb0-f41.google.com with SMTP id jt11so3442621pbb.14
 for <linux-mtd@lists.infradead.org>; Fri, 13 Dec 2013 21:54:27 -0800 (PST)
Date: Fri, 13 Dec 2013 21:54:23 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 0/2] MTD maintenance updates
Message-ID: <20131214055423.GB2454@norris-Latitude-E6410>
References: <1386199726-28074-1-git-send-email-computersforpeace@gmail.com>
 <1386232488.23205.283.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1386232488.23205.283.camel@sauron.fi.intel.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 05, 2013 at 10:34:48AM +0200, Artem Bityutskiy wrote:
> On Wed, 2013-12-04 at 15:28 -0800, Brian Norris wrote:
> > BTW, I'd like to get David's "ack" for these patches, and it'd be nice
> > to hear
> > from Artem too, since he has previously been an unofficial maintainer
> > (and is
> > understandably distracted by non-MTD work these days).
> 
> Acked-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> Thanks Brian for taking care of the MTD subsystem.

Happy to!

Pushed both to l2-mtd.git. I'll give David a chance to yell before
3.14-rc1.

Brian
