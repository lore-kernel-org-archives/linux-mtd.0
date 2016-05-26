Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b5t9W-0000RB-W6
 for linux-mtd@lists.infradead.org; Thu, 26 May 2016 11:08:35 +0000
Date: Thu, 26 May 2016 13:08:12 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Mychaela Falconia  <falcon@ivan.Harhan.ORG>, Peter Pan
 <peterpansjtu@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: Supporting high-level NAND controllers like FTNANDC024
Message-ID: <20160526130812.04077161@bbrezillon>
In-Reply-To: <1464255950.25389.33.camel@gmail.com>
References: <1605260545.AA18874@ivan.Harhan.ORG>
 <20160526091521.722a573e@bbrezillon>
 <1464255950.25389.33.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 26 May 2016 12:45:50 +0300
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Thu, 2016-05-26 at 09:15 +0200, Boris Brezillon wrote:
> > - OneNAND NANDs  
> 
> While this should not stop you, you may have troubles finding a device
> with this kind of NAND where you could test your changes, though.

Brian already warned me that :). Let's focus on the rawNAND and SPINAND
cases for now, we'll see if someone wants to port the OneNAND code to
this new framework ;).

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
