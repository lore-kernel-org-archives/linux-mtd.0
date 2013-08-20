Received: from mail-pb0-x232.google.com ([2607:f8b0:400e:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBd5x-0000sP-FK
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2013 03:59:02 +0000
Received: by mail-pb0-f50.google.com with SMTP id uo5so5724169pbc.23
 for <linux-mtd@lists.infradead.org>; Mon, 19 Aug 2013 20:58:40 -0700 (PDT)
Date: Mon, 19 Aug 2013 20:58:36 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: [PATCH v2] mtd: remove alauda driver
Message-ID: <20130820035836.GD28421@norris.computersforpeace.net>
References: <20130819145234.GB24136@logfs.org>
 <CAFLxGvzbQH5v38NRinsphoyFHZMA5g680B2zWwd4YCYDVi715g@mail.gmail.com>
 <20130819152831.GC24136@logfs.org>
 <20130819153011.GD24136@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20130819153011.GD24136@logfs.org>
Cc: richard -rw- weinberger <richard.weinberger@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 19, 2013 at 11:30:12AM -0400, Jörn Engel wrote:
> The driver has very low utility.  Devices in question are limited to
> about 400kB/s and the only known user (me) discarded the hardware
> several years back.
> 
> Signed-off-by: Joern Engel <joern@logfs.org>

Pushed to l2-mtd.git.

Thanks,
Brian
