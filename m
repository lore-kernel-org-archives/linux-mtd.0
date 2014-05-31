Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WqWkT-0006jj-Tb
 for linux-mtd@lists.infradead.org; Sat, 31 May 2014 00:02:10 +0000
Received: by mail-pd0-f172.google.com with SMTP id fp1so1466337pdb.3
 for <linux-mtd@lists.infradead.org>; Fri, 30 May 2014 17:01:48 -0700 (PDT)
Date: Fri, 30 May 2014 17:01:44 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v2] nandtest: Introduce multiple reads & check iterations
Message-ID: <20140531000144.GB9970@ld-irv-0074>
References: <1399388869-5815-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1399388869-5815-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1401194435.1304.143.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1401194435.1304.143.camel@sauron.fi.intel.com>
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>,
 Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 27, 2014 at 03:40:35PM +0300, Artem Bityutskiy wrote:
> On Tue, 2014-05-06 at 12:07 -0300, Ezequiel Garcia wrote:
> > The current nandtest performs a simple test which consists of:
> > 
> >   1. erase block
> >   2. write data
> >   3. read and verify
> > 
> > In order to improve the nandtest strength, this commit adds a new parameter
> > to increase the number of "read and verify" iterations. In other words,
> > the test now consists of:
> > 
> >   1. erase block
> >   2. write data
> >   3. read and verify (N times)
> 
> I think this is reasonable, but there were some skeptic replies, so
> probably another approver's voice would not hurt. Let me give you my
> 
> Acked-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> and drop Brian a hint that if he things the same way, he could just push
> this driver, or approve and then I can push.

Thanks for the hint :)

Looks good to me. Pushed to mtd-utils.git. Thanks!

Brian
