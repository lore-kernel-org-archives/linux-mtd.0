Received: from mail-qc0-x235.google.com ([2607:f8b0:400d:c01::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wu2xR-0002PI-SB
 for linux-mtd@lists.infradead.org; Mon, 09 Jun 2014 17:02:07 +0000
Received: by mail-qc0-f181.google.com with SMTP id x3so943736qcv.26
 for <linux-mtd@lists.infradead.org>; Mon, 09 Jun 2014 10:01:43 -0700 (PDT)
Date: Mon, 9 Jun 2014 10:01:39 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] UBI: fastmap: correct error check
Message-ID: <20140609170139.GI3599@ld-irv-0074>
References: <1400650538-11234-1-git-send-email-computersforpeace@gmail.com>
 <537C55DC.6090808@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <537C55DC.6090808@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Wed, May 21, 2014 at 09:29:32AM +0200, Richard Weinberger wrote:
> Am 21.05.2014 07:35, schrieb Brian Norris:
> > The return value from ubi_io_read_ec_hdr() was stored in 'err', not in
> > 'ret'.
> > 
> > This issue was reported by Coverity Scan.
> 
> I begin to love Coverity. :-)
> Thanks for the patch, Brian!
> 
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > Cc: Richard Weinberger <richard@nod.at>
> 
> Acked-by: Richard Weinberger <richard@nod.at>

Ping.

Brian
