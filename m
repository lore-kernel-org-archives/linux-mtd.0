Date: Thu, 30 Apr 2015 17:46:35 -0500
From: Ben Shelton <ben.shelton@ni.com>
To: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH] mtd: Introduce CONFIG_MTD_RESERVE_END
Message-ID: <20150430224635.GA18985@bshelton-desktop>
References: <1430335682-6174-1-git-send-email-ben.shelton@ni.com>
 <1430431357.2187.43.camel@x220>
MIME-Version: 1.0
In-Reply-To: <1430431357.2187.43.camel@x220>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 Jeff Westfahl <jeff.westfahl@ni.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Paul,

On 05/01, Paul Bolle wrote:
> While you're discussing more substantial questions with Brian, I found
> some nits.
> 
> On Wed, 2015-04-29 at 14:28 -0500, Ben Shelton wrote:
> > --- a/drivers/mtd/Kconfig
> > +++ b/drivers/mtd/Kconfig
> 
> 
> > +config MTD_RESERVE_END
> > +	int "Reserved space at the end of an all remaining space partition"
> > +	depends on MTD_CMDLINE_PARTS = "y"
> 
> (The quotes are unneeded.)
> 
> MTD_CMDLINE_PARTS is tristate. Why does it need to be built-in for this
> symbol?

Good catch -- MTD_RESERVE_END should apply whether MTD_CMDLINE_PARTS is
built-in or a module.  I'll fix that in the next version of the patch.

Thanks,
Ben
