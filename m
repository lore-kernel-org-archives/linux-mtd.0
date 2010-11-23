Received: from tango.tkos.co.il ([62.219.50.35])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PKpKD-0004t5-Vr
	for linux-mtd@lists.infradead.org; Tue, 23 Nov 2010 09:38:10 +0000
Date: Tue, 23 Nov 2010 11:36:43 +0200
From: Baruch Siach <baruch@tkos.co.il>
To: Alexis RODET <alexis.rodet@bvs-tech.com>
Subject: Re: [PATCH] Renaming 'struct flash_platform_data' into 'struct
	spi_flash_platform_data' in include/linux/spi/flash.h
Message-ID: <20101123093643.GC6156@jasper.tkos.co.il>
References: <327178.68946.qm@web180303.mail.gq1.yahoo.com>
	<4CEB89C6.3080603@bvs-tech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4CEB89C6.3080603@bvs-tech.com>
Cc: David Brownell <david-b@pacbell.net>,
	spi-devel-general@lists.sourceforge.net, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alexis,

On Tue, Nov 23, 2010 at 10:30:46AM +0100, Alexis RODET wrote:
> Le 22/11/2010 22:52, David Brownell a écrit :
> >
> > --- On Mon, 11/22/10, Alexis RODET <alexis.rodet@bvs-tech.com> wrote:
> >
> >>> And this patch doesn't touch machine or driver code,
> >> so it's incomplete.
> >> Look at the patch in previous mail attachment and you'll
> >> see it does.
> >
> > Couldn't do that.  Submit another patch, or
> > combine it with this one.  Either way,  once it
> > merges, "git bisect" needs to work"...
> >
> >
> >>> How about a patch that does the full rename??
> >> What do you mean ?
> > Apply the patch and everthing builds and works;
> > and if it's a series, "git bisect" also works".
> >
> So Here is the patch:

[snip]

>  -static struct flash_platform_data __initdata my_flash0_platform = {
> +static struct spi_flash_platform_data __initdata my_flash0_platform = {

Your patch seems to have been mangled by your mailer. A whitespace were added 
at the beginning of the line before '-static'.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
