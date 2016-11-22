Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c9A6b-000078-W1
 for linux-mtd@lists.infradead.org; Tue, 22 Nov 2016 12:23:23 +0000
Date: Tue, 22 Nov 2016 13:22:59 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>
Subject: Re: ONFI timing mode with onfi_set_features unsupported
Message-ID: <20161122132259.47ee0138@bbrezillon>
In-Reply-To: <20161122111854.wgwrloa2xgjez3xn@pengutronix.de>
References: <20161121132327.hup6bi7zqu54jsia@pengutronix.de>
 <20161121145104.376349f8@bbrezillon>
 <20161122110227.6m4waiv4odpl7qep@pengutronix.de>
 <20161122121047.5a28734b@bbrezillon>
 <20161122111854.wgwrloa2xgjez3xn@pengutronix.de>
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

On Tue, 22 Nov 2016 12:18:54 +0100
Sascha Hauer <s.hauer@pengutronix.de> wrote:

> On Tue, Nov 22, 2016 at 12:10:47PM +0100, Boris Brezillon wrote:
> > On Tue, 22 Nov 2016 12:02:27 +0100
> > Sascha Hauer <s.hauer@pengutronix.de> wrote:
> >   
> > > On Mon, Nov 21, 2016 at 02:51:04PM +0100, Boris Brezillon wrote:  
> > > > Hi Sascha,
> > > > 
> > > > On Mon, 21 Nov 2016 14:23:27 +0100
> > > > Sascha Hauer <s.hauer@pengutronix.de> wrote:
> > > >     
> > > > > Hi all,
> > > > > 
> > > > > I have a i.MX6ul here with a Cypress S34ML04G2 connected. This Nand chip
> > > > > has ONFI support, but onfi_set_features is unsupported (opt_cmd is
> > > > > 0x3b). Currently the gpmi Nand driver calls nand_onfi_set_features(),
> > > > > gets -EINVAL as error and continues with a very slow default timing.
> > > > > 
> > > > > I assume the nand_onfi_set_features() call is just unnecessary for this
> > > > > chip, if I skip it, the chip works with the fast timing.
> > > > > 
> > > > > Any idea how to cope with this situation? I attached the most obvious
> > > > > patch, but it looks a bit hackish. Any suggestions or is the patch fine
> > > > > as is?    
> > > > 
> > > > It looks good to me. Why do you find this code hackish?
> > > > Of course, it would be even better to implement the    
> > > > ->setup_data_interface() method.    
> > > 
> > > Indeed, but my current project doesn't allow to spend that much time at
> > > the moment.  
> > 
> > Understood. Let's wait for Han's review.
> >   
> > >   
> > > > 
> > > > BTW, can you patch the core to only send the ->set_feature() command
> > > > (to change the timings mode) when the chip supports it?    
> > > 
> > > With hackish I mean that I think the problem should be solved in the
> > > core. How about returning -EOPNOTSUPP from onfi_set_features() when the
> > > operation is not supported? The caller could then decide what to do
> > > without testing for bits in the onfi param page.  
> > 
> > The problem is, ->onfi_set_feature() is a method that can be overloaded
> > by NAND controller drivers. Of course, we could add a wrapper around  
> > ->onfi_set_feature() (nand_set_feature()?),  
> 
> Such a wrapper would have the advantage that we wouldn't have to repeat
> the
> 
> 	if (!chip->onfi_version ||
> 		    !(le16_to_cpu(chip->onfi_params.opt_cmd)
> 		    	      & ONFI_OPT_CMD_SET_GET_FEATURES))
> 
> test in each driver with a special onfi_get_features() implementation.

You're right.

> 
> > but then, the meaning of
> > -ENOTSUPP is not clear. It could be returned if the  
> > ->onfi_set_feature() is NULL or if the requested feature is not  
> > supported  
> 
> ->onfi_set_feature() will never be NULL as it's set to nand_onfi_set_features  
> if it's NULL in during registration.

You're right, that's actually one of the problem with calling
->onfi_set_feature() without having any guarantee that the underlying
->cmdfunc() will implement it properly. But that's another story.

> Also I would suggest -ENOSYS if the
> driver is lacking support for an operation.

ENOSYS is documented as "Invalid system call number". Not sure it is
appropriate to describe a missing operation.

> 
> > 
> > Another solution would be to add an extra helper to check if a specific
> > feature is supported:
> > 
> > bool nand_feature_supported(nand, feature_id);  
> 
> Yes, that would work aswell. Up to you to decide ;)

Let's go for the first proposal: nand_{get,set}_feature() wrappers
returning -ENOTSUP if ONFI_OPT_CMD_SET_GET_FEATURES is not set.
Note that even non-ONFI NANDs support the SET/GET_FEATURE commands, so
the test you suggested above is incorrect.

Ideally, we should have an extra bitmap marking features as supported or
not, and let NAND id detection code set these flags. But in the
meantime, we can just use your test with a comment saying that this
should be reworked if we want to support SET/GET_FEATURE on non-ONFI
NANDs.

Regards,

Boris
