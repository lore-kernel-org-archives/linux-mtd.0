Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8fpy-0001sG-EX
 for linux-mtd@lists.infradead.org; Wed, 07 Jan 2015 01:55:06 +0000
Date: Wed, 7 Jan 2015 09:52:56 +0800
From: Huang Shijie <shijie.huang@intel.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd: fsl-quadspi: Fix module unbound
Message-ID: <20150107015255.GA32086@shldeISGChi005.sh.intel.com>
References: <1417814086-30512-1-git-send-email-festevam@gmail.com>
 <20150106064931.GB13447@norris-Latitude-E6410>
 <20150107011242.GA30740@shldeISGChi005.sh.intel.com>
 <CAOMZO5CO2QYdmXUECizoV+76v9Woc=v31HHYjcORYUXoYxLibQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5CO2QYdmXUECizoV+76v9Woc=v31HHYjcORYUXoYxLibQ@mail.gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Huang Shijie <shijie8@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Frank Li <Frank.Li@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 06, 2015 at 11:41:42PM -0200, Fabio Estevam wrote:
> Hi Huang,
> 
> On Tue, Jan 6, 2015 at 11:12 PM, Huang Shijie <shijie.huang@intel.com> wrote:
> 
> > The qspi controller can connect with two SPI flashes at the same time.
> > Most of the time, we only connect one flash to it.
> >
> > Use this property can makes the DTS file simple. If we remove this
> > propery, we have to add a long same child node for the qspi.
> >
> > But i think it is ok to remove it, if Brian thinks it is odd.
> >
> > Hi Fabio, could you please create a correct patch based on Brian's sample patch?
> >
> > If you do not have time, please tell me. :)
> 
> It would be nice if you could generate such patch, if possible. Thanks
okay. Thank you all the same.

I will generate this patch if Allan Xu is busy too.

thanks
Huang Shijie
