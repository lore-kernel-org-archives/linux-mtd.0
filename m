Received: from mail-yk0-x22c.google.com ([2607:f8b0:4002:c07::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X4h9m-0001Xa-Da
 for linux-mtd@lists.infradead.org; Wed, 09 Jul 2014 01:58:51 +0000
Received: by mail-yk0-f172.google.com with SMTP id 142so2620210ykq.3
 for <linux-mtd@lists.infradead.org>; Tue, 08 Jul 2014 18:58:28 -0700 (PDT)
Date: Tue, 8 Jul 2014 18:58:24 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] UBI: fastmap: correct error check
Message-ID: <20140709015824.GG7537@ld-irv-0074>
References: <1400650538-11234-1-git-send-email-computersforpeace@gmail.com>
 <537C55DC.6090808@nod.at> <20140609170139.GI3599@ld-irv-0074>
 <1402383372.20454.57.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1402383372.20454.57.camel@sauron.fi.intel.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Tue, Jun 10, 2014 at 09:56:12AM +0300, Artem Bityutskiy wrote:
> On Mon, 2014-06-09 at 10:01 -0700, Brian Norris wrote:
> > On Wed, May 21, 2014 at 09:29:32AM +0200, Richard Weinberger wrote:
> > > Am 21.05.2014 07:35, schrieb Brian Norris:
> > > > The return value from ubi_io_read_ec_hdr() was stored in 'err', not in
> > > > 'ret'.
> > > > 
> > > > This issue was reported by Coverity Scan.
> > > 
> > > I begin to love Coverity. :-)
> > > Thanks for the patch, Brian!
> > > 
> > > > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > > > Cc: Richard Weinberger <richard@nod.at>
> > > 
> > > Acked-by: Richard Weinberger <richard@nod.at>
> > 
> > Ping.
> 
> Ooops, missed this completely. Let me merge it a bit later, after
> 3.16-rc1. Thanks!

'Tis after 3.16-rc1!

Brian
