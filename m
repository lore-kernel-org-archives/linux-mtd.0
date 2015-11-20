Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zzv0l-0000Cp-0M
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 23:22:35 +0000
Received: by pabfh17 with SMTP id fh17so133848298pab.0
 for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2015 15:22:14 -0800 (PST)
Date: Fri, 20 Nov 2015 15:22:11 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Michal Suchanek <hramrach@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Mark Brown <broonie@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Martin Sperl <martin@sperl.org>
Subject: Re: RfC: Handle SPI controller limitations like maximum message length
Message-ID: <20151120232211.GA64635@google.com>
References: <564CEB61.2000601@gmail.com> <20151120000226.GP64635@google.com>
 <564EC4E0.90602@gmail.com>
 <CAFSsGVsJBi6yPin7X9MCS8LD6nygjynfgDgFicjojkm0rOJSJw@mail.gmail.com>
 <20151120123540.GC1929@sirena.org.uk> <564F6D99.8090203@gmail.com>
 <CAOMqctTt=78C4m2jjMb9mRBOkoZ5uZ4neVm0NS39iNO8otn=dA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMqctTt=78C4m2jjMb9mRBOkoZ5uZ4neVm0NS39iNO8otn=dA@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 20, 2015 at 08:05:48PM +0100, Michal Suchanek wrote:
> On 20 November 2015 at 19:59, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> > Am 20.11.2015 um 13:35 schrieb Mark Brown:
> >> On Fri, Nov 20, 2015 at 11:06:47AM +0100, Heiner Kallweit wrote:
> >>> If the discussed case is valid a clear hint to all users of spi_sync and
> >>> friends should be added that the caller can not rely on status code 0
> >>> only but must check actual_length to verify that the complete message
> >>> was transferred.
> >>
> >> You'll get an error on truncation.  It may be possible to recover.
> >>
> > OK, I interpret this as:
> > Controller drivers shall return 0 only if the complete message was
> > transferred successfully.
> > If  a controller driver returns an error it has the option to set
> > actual_length to what was transferred successfully.
> >
> > This means we can't use patch 4 from Michal because it bails out as soon
> > as the underlying SPI transfer returns an error.

Right (although you meant patch 7).

> > Instead something like the spi-nor patch I sent on Oct 6th would be needed:
> > [PATCH] mtd: spi-nor: handle controller driver limitations in spi_nor_read

I don't think your patch is good either...

> > It loops over nor->read and ignores errors as long as at least something
> > was read.
> >
> 
> I don't think ignoring errors in general is good idea.

...for this reason, at least.

> If it's desirable that a partial transfer is reported as error then a
> particular error value should be defined for this case and drivers
> that can continue the transfer in a driver-specific way (such as
> spi-nor) can check for this error and handle it appropriately and pass
> through any other error.

Based on Mark's further comments (and my own intuition), I'd rather not
try to interpret different error codes to mean "truncated but keep
going" vs. "truncated for other reason, stop now", unless we really have
to.

I think if we do what Heiner was proposing from the beginning -- expose
a reasonable max SPI message length -- then I think we'll cover the bulk
of what we want. SPI NOR drivers can then try "small enough" transfers,
and if we see any errors, those are unexpected, and we abort.

Sound OK?

Brian
