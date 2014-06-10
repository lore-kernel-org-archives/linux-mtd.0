Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WuFzA-000459-U3
 for linux-mtd@lists.infradead.org; Tue, 10 Jun 2014 06:56:45 +0000
Message-ID: <1402383372.20454.57.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: fastmap: correct error check
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 10 Jun 2014 09:56:12 +0300
In-Reply-To: <20140609170139.GI3599@ld-irv-0074>
References: <1400650538-11234-1-git-send-email-computersforpeace@gmail.com>
 <537C55DC.6090808@nod.at> <20140609170139.GI3599@ld-irv-0074>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-06-09 at 10:01 -0700, Brian Norris wrote:
> Hi Artem,
> 
> On Wed, May 21, 2014 at 09:29:32AM +0200, Richard Weinberger wrote:
> > Am 21.05.2014 07:35, schrieb Brian Norris:
> > > The return value from ubi_io_read_ec_hdr() was stored in 'err', not in
> > > 'ret'.
> > > 
> > > This issue was reported by Coverity Scan.
> > 
> > I begin to love Coverity. :-)
> > Thanks for the patch, Brian!
> > 
> > > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > > Cc: Richard Weinberger <richard@nod.at>
> > 
> > Acked-by: Richard Weinberger <richard@nod.at>
> 
> Ping.

Ooops, missed this completely. Let me merge it a bit later, after
3.16-rc1. Thanks!

-- 
Best Regards,
Artem Bityutskiy
