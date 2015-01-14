Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBWov-0005UG-8L
 for linux-mtd@lists.infradead.org; Wed, 14 Jan 2015 22:53:49 +0000
Received: by mail-pa0-f52.google.com with SMTP id eu11so13326133pac.11
 for <linux-mtd@lists.infradead.org>; Wed, 14 Jan 2015 14:53:27 -0800 (PST)
Date: Wed, 14 Jan 2015 14:53:23 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: fsl-quadspi: Fix module unbound
Message-ID: <20150114225323.GZ9759@ld-irv-0074>
References: <1420626727-6929-1-git-send-email-festevam@gmail.com>
 <1420626727-6929-2-git-send-email-festevam@gmail.com>
 <20150109201743.GW9759@ld-irv-0074>
 <CAOMZO5BaEyU=qJfCsng+kPBcWSxb6wgJzzahgYvHn5Fqi_uoWA@mail.gmail.com>
 <20150113185153.GT9759@ld-irv-0074>
 <CAOMZO5Cy39iC0CpvO0H6i6rX6YVyns-2tZi5-vU28hCM6kgu-w@mail.gmail.com>
 <20150113215817.GW9759@ld-irv-0074>
 <BY1PR0301MB12213C4577DB849CA161F51482400@BY1PR0301MB1221.namprd03.prod.outlook.com>
 <CAOMZO5Cfe8rmsQPg1xdwwrQxsesqd1k1E80oKuiG78P77CYBcw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5Cfe8rmsQPg1xdwwrQxsesqd1k1E80oKuiG78P77CYBcw@mail.gmail.com>
Cc: "Fabio.Estevam@freescale.com" <Fabio.Estevam@freescale.com>,
 Huang Shijie <shijie8@gmail.com>,
 "Frank.Li@freescale.com" <Frank.Li@freescale.com>,
 "han.xu@freescale.com" <han.xu@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 14, 2015 at 06:26:38PM -0200, Fabio Estevam wrote:
> On Tue, Jan 13, 2015 at 8:05 PM, Frank.Li@freescale.com
> <Frank.Li@freescale.com> wrote:
> 
> > Our QSPI driver owner Xu han (han.xu@freescale.com) will take responsibility to test and improve
> > This driver.  I will help him to be familiar with linux kernel community work.
> 
> That's great!

Yes, it'll be great to be sure there is at least one "owner" who gets
CC'd on these types of patches.

> Could you please send a patch adding yourself as the maintainer for
> the fsl-quadspi driver?

I'd be OK with multiple developers as reviewers if more desire to do so,
given that Xu sounds to be new to our development model. Mainly I'm
interested in at least one developer who has access to and knowledge of
the hardware, and who can test, review, and ack/nak patches. I'll still
handle merging the patches, of course.

Brian
