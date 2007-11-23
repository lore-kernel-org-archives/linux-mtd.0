Date: Fri, 23 Nov 2007 13:52:12 -0800
From: Arjan van de Ven <arjan@infradead.org>
To: "Bryan Wu" <cooloney.lkml@gmail.com>
Subject: Re: [PATCH 1/1] [MTD/NAND]: Add Blackfin BF52x on-chip NAND Flash
	controller driver support in bf5xx_nand driver
Message-ID: <20071123135212.7c483aae@laptopd505.fenrus.org>
In-Reply-To: <386072610711230625k23b68e49q6090b7eb27c2c039@mail.gmail.com>
References: <1195812893-26312-1-git-send-email-bryan.wu@analog.com>
	<1195813178.25590.35.camel@pmac.infradead.org>
	<386072610711230625k23b68e49q6090b7eb27c2c039@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Bryan Wu <bryan.wu@analog.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	uclinux-dist-devel@blackfin.uclinux.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 23 Nov 2007 22:25:29 +0800
"Bryan Wu" <cooloney.lkml@gmail.com> wrote:

> On Nov 23, 2007 6:19 PM, David Woodhouse <dwmw2@infradead.org> wrote:
> >
> > On Fri, 2007-11-23 at 18:14 +0800, Bryan Wu wrote:
> > >
> > > +#ifdef CONFIG_BF54x
> > >         /* Setup DMAC1 channel mux for NFC which shared with SDH
> > > */ val = bfin_read_DMAC1_PERIMUX();
> > >         val &= 0xFFFE;
> > >         bfin_write_DMAC1_PERIMUX(val);
> > >         SSYNC();
> > > -
> > > +#endif
> >
> > You can't build a multiplatform kernel which runs on BF52x and
> > BF54x?
> 
> There are some hardware difference between BF52x and BF54x. We have
> to do this.
> 

well does it need to be an #ifdef, or can it be a runtime if() ?

-- 
If you want to reach me at my work email, use arjan@linux.intel.com
For development, discussion and tips for power savings, 
visit http://www.lesswatts.org
