Received: from py-out-1112.google.com ([64.233.166.182])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IvZTH-0002Bq-Q1
	for linux-mtd@lists.infradead.org; Fri, 23 Nov 2007 09:25:39 -0500
Received: by py-out-1112.google.com with SMTP id a25so5696609pyi
	for <linux-mtd@lists.infradead.org>;
	Fri, 23 Nov 2007 06:25:29 -0800 (PST)
Message-ID: <386072610711230625k23b68e49q6090b7eb27c2c039@mail.gmail.com>
Date: Fri, 23 Nov 2007 22:25:29 +0800
From: "Bryan Wu" <cooloney.lkml@gmail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH 1/1] [MTD/NAND]: Add Blackfin BF52x on-chip NAND Flash
	controller driver support in bf5xx_nand driver
In-Reply-To: <1195813178.25590.35.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1195812893-26312-1-git-send-email-bryan.wu@analog.com>
	<1195813178.25590.35.camel@pmac.infradead.org>
Cc: Bryan Wu <bryan.wu@analog.com>, uclinux-dist-devel@blackfin.uclinux.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Nov 23, 2007 6:19 PM, David Woodhouse <dwmw2@infradead.org> wrote:
>
> On Fri, 2007-11-23 at 18:14 +0800, Bryan Wu wrote:
> >
> > +#ifdef CONFIG_BF54x
> >         /* Setup DMAC1 channel mux for NFC which shared with SDH */
> >         val = bfin_read_DMAC1_PERIMUX();
> >         val &= 0xFFFE;
> >         bfin_write_DMAC1_PERIMUX(val);
> >         SSYNC();
> > -
> > +#endif
>
> You can't build a multiplatform kernel which runs on BF52x and BF54x?

There are some hardware difference between BF52x and BF54x. We have to do this.

> And want to make it harder to do so in future?
>
Any idea to make it easier? providing a specific hardware init hook
function from each platform board files?

Regards,
-Bryan

> --
> dwmw2
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>
