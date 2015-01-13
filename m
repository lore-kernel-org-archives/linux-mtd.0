Received: from mail-yh0-x22c.google.com ([2607:f8b0:4002:c01::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YB6Zf-0004ku-Pk
 for linux-mtd@lists.infradead.org; Tue, 13 Jan 2015 18:52:20 +0000
Received: by mail-yh0-f44.google.com with SMTP id c41so2346956yho.3
 for <linux-mtd@lists.infradead.org>; Tue, 13 Jan 2015 10:51:58 -0800 (PST)
Date: Tue, 13 Jan 2015 10:51:53 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: fsl-quadspi: Fix module unbound
Message-ID: <20150113185153.GT9759@ld-irv-0074>
References: <1420626727-6929-1-git-send-email-festevam@gmail.com>
 <1420626727-6929-2-git-send-email-festevam@gmail.com>
 <20150109201743.GW9759@ld-irv-0074>
 <CAOMZO5BaEyU=qJfCsng+kPBcWSxb6wgJzzahgYvHn5Fqi_uoWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5BaEyU=qJfCsng+kPBcWSxb6wgJzzahgYvHn5Fqi_uoWA@mail.gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
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

Hi Fabio,

On Tue, Jan 13, 2015 at 01:35:02PM -0200, Fabio Estevam wrote:
> On Fri, Jan 9, 2015 at 6:17 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> > OK, I still don't think you've got things right here.
> >
> > Are you testing this with a two-flash system? What sort of tests?
> 
> Yes, there are two qspi flashes on imx6sx-sdb board.
> 
> The test I do are:
> 
> - module unload/load - When I was adding dts support for imx6sx-sdb I
> would like to be able to load/unload the qspi driver. This is not
> possible currently, and this was the motivation for this series.

Right. So that's a good test.

> - Read the two flashes.

Are you doing any verification to make sure you're reading the *correct*
data? I'd imagine from some what I see in your patches, that you might
actually be reading from the wrong flash.

> root@freescale /$ dd if=/dev/mtd0 of=/dev/null bs=1M count=1
> 1+0 records in
> 1+0 records out
> 1048576 bytes (1.0MB) copied, 0.047851 seconds, 20.9MB/s
> 
> root@freescale /$ dd if=/dev/mtd1 of=/dev/null bs=1M count=1
> 1+0 records in
> 1+0 records out
> 1048576 bytes (1.0MB) copied, 0.052515 seconds, 19.0MB/s
> 
> Not sure what is the correct way to fix this though.

Brian
