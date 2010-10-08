Received: from devils.ext.ti.com ([198.47.26.153])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P46mf-0005sD-IB
	for linux-mtd@lists.infradead.org; Fri, 08 Oct 2010 06:50:26 +0000
From: "Nori, Sekhar" <nsekhar@ti.com>
To: Vitaly Wool <vitalywool@gmail.com>
Date: Fri, 8 Oct 2010 12:20:15 +0530
Subject: RE: [PATCH 2/2] davinci: Platform support for OMAP-L137/AM17x NOR
	flash driver
Message-ID: <B85A65D85D7EB246BE421B3FB0FBB59302342ADFC2@dbde02.ent.ti.com>
References: <1286451272-12988-1-git-send-email-savinay.dharmappa@ti.com>
	<4CADE1B8.50800@mvista.com>
	<B85A65D85D7EB246BE421B3FB0FBB59302342ADE9D@dbde02.ent.ti.com>
	<AANLkTi=P8DcjCn_mozmvaNue2d_jn6meBzvXDbk3gpd3@mail.gmail.com>
In-Reply-To: <AANLkTi=P8DcjCn_mozmvaNue2d_jn6meBzvXDbk3gpd3@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	Sergei Shtylyov <sshtylyov@mvista.com>,
	Aleksey Makarov <amakarov@ru.mvista.com>,
	David Griego <dgriego@mvista.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Dharmappa, Savinay" <savinay.dharmappa@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 08, 2010 at 12:14:33, Vitaly Wool wrote:
> On Fri, Oct 8, 2010 at 5:54 AM, Nori, Sekhar <nsekhar@ti.com> wrote:
> > Hi Sergei,
> >
> > On Thu, Oct 07, 2010 at 20:35:28, Sergei Shtylyov wrote:
> >
> >> > +static void da830_evm_nor_done(void *data)
> >> > +{
> >> > +   clk_disable(da830_evm_nor.clk);
> >> > +   clk_put(da830_evm_nor.clk);
> >> > +   iounmap(da830_evm_nor.latch.addr);
> >> > +   release_mem_region(DA8XX_AEMIF_CS3_BASE, PAGE_SIZE);
> >> > +   iounmap(da830_evm_nor.aemif.addr);
> >> > +   release_mem_region(DA8XX_AEMIF_CTL_BASE, SZ_32K);
> >> > +}
> >>
> >>     Why you've changed this function which was useful also for the err=
or cleanup
> >> before?
> >
> > The issues down below aside, I think goto based error handling
> > is clearer to follow. Any objections to using goto based
> > error handing per-se?
>
> What you're saying just doesn't make sense in this context. Whatever
> way of error handling is chosen, it first needs to be correct which is
> absolutely not the case here.

Yes, agreed. It needs to be correct first.

Thanks,
Sekhar
