Date: Tue, 2 Dec 2014 10:01:01 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v6 0/3] mtd: nand: gpmi: add proper raw access support
Message-ID: <20141202180101.GK21347@ld-irv-0074>
References: <1417371030-24015-1-git-send-email-boris.brezillon@free-electrons.com>
 <20141201084709.GI29070@brian-ubuntu>
 <20141201095858.75ac3889@bbrezillon>
 <20141202004743.GB11370@shldeISGChi005.sh.intel.com>
 <20141202092150.738a53bb@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20141202092150.738a53bb@bbrezillon>
Cc: Mike Voytovich <mvoytovich@paypal.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Roy Lee <roylee@paypal.com>,
 Huang Shijie <shijie.huang@intel.com>, Huang Shijie <shijie8@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 02, 2014 at 09:21:50AM +0100, Boris Brezillon wrote:
> On Tue, 2 Dec 2014 08:47:43 +0800 Huang Shijie <shijie.huang@intel.com> wrote:
> > On Mon, Dec 01, 2014 at 09:58:58AM +0100, Boris Brezillon wrote:
> > > On Mon, 1 Dec 2014 00:47:09 -0800 Brian Norris <computersforpeace@gmail.com> wrote:
> > > > Also, is it time to yank / fixup some of these comments from
> > > > gpmi-nand.c?
> > > 
> > > I was asking myself the same question...
> > > 
> > > > 
> > > >  ...
> > > >  * FIXME: The following paragraph is incorrect, now that there exist
> > > >  * ecc.read_oob_raw and ecc.write_oob_raw functions.
> > > >  *
> > > >  * Since MTD assumes the OOB is not covered by ECC, there is no pair of
> > > >  * ECC-based/raw functions for reading or or writing the OOB. The fact that the
> > > >  * caller wants an ECC-based or raw view of the page is not propagated down to
> > > >  * this driver.
> > > >  */
> > > 
> > > I guess we can remove them.
> > > Huang can you confirm that the raw access functions introduced in this
> > > series are covering what's described here ?
> > I think we can remove these comments now.
> 
> Brian, do you want me to send this patch or are you taking care of it ?

Go ahead and send a patch.

Brian
