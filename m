Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBCPt-0002jM-1D
 for linux-mtd@lists.infradead.org; Wed, 14 Jan 2015 01:06:37 +0000
Date: Wed, 14 Jan 2015 09:04:20 +0800
From: Huang Shijie <shijie.huang@intel.com>
To: "Frank.Li@freescale.com" <Frank.Li@freescale.com>
Subject: Re: [PATCH v3 2/2] mtd: fsl-quadspi: Fix module unbound
Message-ID: <20150114010419.GA10784@hsj.sh.intel.com>
References: <1420626727-6929-1-git-send-email-festevam@gmail.com>
 <1420626727-6929-2-git-send-email-festevam@gmail.com>
 <20150109201743.GW9759@ld-irv-0074>
 <CAOMZO5BaEyU=qJfCsng+kPBcWSxb6wgJzzahgYvHn5Fqi_uoWA@mail.gmail.com>
 <20150113185153.GT9759@ld-irv-0074>
 <CAOMZO5Cy39iC0CpvO0H6i6rX6YVyns-2tZi5-vU28hCM6kgu-w@mail.gmail.com>
 <20150113215817.GW9759@ld-irv-0074>
 <BY1PR0301MB12213C4577DB849CA161F51482400@BY1PR0301MB1221.namprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY1PR0301MB12213C4577DB849CA161F51482400@BY1PR0301MB1221.namprd03.prod.outlook.com>
Cc: "Fabio.Estevam@freescale.com" <Fabio.Estevam@freescale.com>,
 Huang Shijie <shijie8@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "han.xu@freescale.com" <han.xu@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, Fabio Estevam <festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 13, 2015 at 10:05:29PM +0000, Frank.Li@freescale.com wrote:
> 
> > Hi Fabio,
> > 
> > On Tue, Jan 13, 2015 at 07:45:22PM -0200, Fabio Estevam wrote:
> > > On Tue, Jan 13, 2015 at 4:51 PM, Brian Norris
> > > <computersforpeace@gmail.com> wrote:
> > >
> > > >> - Read the two flashes.
> > > >
> > > > Are you doing any verification to make sure you're reading the
> > > > *correct* data? I'd imagine from some what I see in your patches,
> > > > that you might actually be reading from the wrong flash.
> > >
> > > Yes, you are right. Just confirmed that with this v3 applied I erased
> > > /dev/mtd0, but that also incorrectly erased /dev/mtd1.
> > >
> > > Now I came back to the original v1 patch: isn't it the simpler
> > > approach for fixing the module load/unload crash problem?
> > >
> > > It only keeps the mtd unregistration index in sync with registration
> > > and doesn't touch other areas of the driver.
> > >
> > > IMHO it is an improvement over the current situation.
> > 
> > Right, I thought your original patch was an improvement, but it did still leave
> > some of the error path broken. And as Huang mentioned, multiple devices
> > were never actually *properly* supported, so there were problems there.
> > 
> > > I agree that this driver needs more rework, but I am not able to put
> > > it on such good state.
> > 
> > I might be OK with taking v1 if we can do the following:
> > 
> > (1) Identify who will take responsibility for testing and improving this driver.
> > We might even add a MAINTAINERS entry
> 
> Our QSPI driver owner Xu han (han.xu@freescale.com) will take responsibility to test and improve
> This driver.  I will help him to be familiar with linux kernel community work. 
Good news. 

Huang Shijie
