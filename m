Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6kTf-0002uM-Q5
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 14:10:00 +0000
Received: by wyb28 with SMTP id 28so5676563wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Apr 2011 07:09:58 -0700 (PDT)
Subject: Re: [PATCH V5 06/10] MIPS: lantiq: add NOR flash support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: John Crispin <blogic@openwrt.org>
In-Reply-To: <4D99C974.5060800@openwrt.org>
References: <1301470076-17279-1-git-send-email-blogic@openwrt.org>
	<1301470076-17279-7-git-send-email-blogic@openwrt.org>
	<1301661832.2789.56.camel@localhost>  <4D99C974.5060800@openwrt.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 04 Apr 2011 17:07:25 +0300
Message-ID: <1301926045.2760.86.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>,
	Ralph Hempel <ralph.hempel@lantiq.com>, linux-mtd@lists.infradead.org,
	Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-04-04 at 15:36 +0200, John Crispin wrote:
> >> +ltq_copy_from(struct map_info *map, void *to,
> >> +	unsigned long from, ssize_t len)
> >> +{
> >> +	unsigned char *f = (unsigned char *) (map->virt + from);
> >> +	unsigned char *t = (unsigned char *) to;
> >> +	unsigned long flags;
> >> +
> >> +	spin_lock_irqsave(&ebu_lock, flags);
> >> +	while (len--)
> >> +		*t++ = *f++;
> >> +	spin_unlock_irqrestore(&ebu_lock, flags);
> >>     
> > Can you use memcpy here instead?
> >
> >   
> as we are copying to/from iomem, we cannot use memcpy as the
> pre-fetching breaks the copy process. the normal alternative is to use
> memcpy_to/fromio, however on MIPS this breaks down to a normal memcpy.

Would be nice to have this comment in the code to make life of those who
reads it a bit easier.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
