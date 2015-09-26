Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zfl2Z-0003tw-Bl
 for linux-mtd@lists.infradead.org; Sat, 26 Sep 2015 08:41:08 +0000
Date: Sat, 26 Sep 2015 10:40:17 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Artem
 Bityutskiy <dedekind1@gmail.com>, Andrea Scian <rnd4@dave-tech.it>, "Bean
 Huo =?UTF-8?B?6ZyN5paM5paM?= (beanhuo)" <beanhuo@micron.com>, "Karl Zhang
 =?UTF-8?B?5byg5Y+M6ZSj?= (karlzhang)" <karlzhang@micron.com>, Iwo Mergler
 <Iwo.Mergler@netcommwireless.com>, "Jeff Lauruhn (jlauruhn)"
 <jlauruhn@micron.com>, Stefan Roese <sr@denx.de>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] UBI: switch the UBI device in read-only mode when
 mtd returns -EROFS
Message-ID: <20150926104017.7aa4b13a@bbrezillon>
In-Reply-To: <560585B2.3020904@nod.at>
References: <1443193758-22071-1-git-send-email-boris.brezillon@free-electrons.com>
 <1443193758-22071-4-git-send-email-boris.brezillon@free-electrons.com>
 <560585B2.3020904@nod.at>
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

Hi Richard,

On Fri, 25 Sep 2015 19:34:42 +0200
Richard Weinberger <richard@nod.at> wrote:

> Am 25.09.2015 um 17:09 schrieb Boris Brezillon:
> > The NAND layer is now able to forward power-cut emulation errors from
> > a NAND driver to the MTD user.
> > Check for this kind of errors in UBI and switch the UBI device in read-only
> > mode if such an error occurs.
> > The error will also be forwarded to the UBI user requesting the operation
> > if any, thus allowing UBIFS to act accordingly.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > ---
> >  drivers/mtd/ubi/io.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
> > index 5bbd1f0..c5ebef7 100644
> > --- a/drivers/mtd/ubi/io.c
> > +++ b/drivers/mtd/ubi/io.c
> > @@ -303,6 +303,8 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
> >  		len = ubi->peb_size - offset;
> >  		if (len)
> >  			err = ubi_self_check_all_ff(ubi, pnum, offset, len);
> > +	} else if (err == -EROFS) {
> > +		ubi_ro_mode(ubi);
> >  	}
> >  
> >  	return err;
> > @@ -355,7 +357,7 @@ retry:
> >  
> >  	err = mtd_erase(ubi->mtd, &ei);
> >  	if (err) {
> > -		if (retries++ < UBI_IO_RETRIES) {
> > +		if (err != -EROFS && retries++ < UBI_IO_RETRIES) {
> 
> Looks good! :)
> One small nit, can you please add a comment above both lines that the EROFS checks are
> here because of emulators.

Sure, I'll add a comment.

Thanks,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
