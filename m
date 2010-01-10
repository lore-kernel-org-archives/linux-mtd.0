Received: from fg-out-1718.google.com ([72.14.220.159])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTunC-0003W7-Bh
	for linux-mtd@lists.infradead.org; Sun, 10 Jan 2010 10:13:10 +0000
Received: by fg-out-1718.google.com with SMTP id e12so1597937fga.0
	for <linux-mtd@lists.infradead.org>;
	Sun, 10 Jan 2010 02:13:04 -0800 (PST)
Subject: Re: [PATCH] UBI fails to initialise in kernel update marker
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Peter Horton <zero@colonel-panic.org>
In-Reply-To: <4B49A486.5060402@colonel-panic.org>
References: <20100105111436.GA2046@turtle.localnet>
	<1263116531.7315.143.camel@localhost.localdomain>
	<4B49A486.5060402@colonel-panic.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 10 Jan 2010 12:13:02 +0200
Message-Id: <1263118382.7315.148.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-01-10 at 09:57 +0000, Peter Horton wrote:
> On 10/01/2010 09:42, Artem Bityutskiy wrote:
> > On Tue, 2010-01-05 at 11:14 +0000, Peter Horton wrote:
> >> The in kernel copy of a volume's update marker is not initialised from the
> >> volume table.
> >>
> >> Signed-off-by: Peter Horton<zero@colonel-panic.org>
> >>
> >> --- linux-2.6.32.orig/drivers/mtd/ubi/vtbl.c	2010-01-05 10:56:13.000000000 +0000
> >> +++ linux-2.6.32/drivers/mtd/ubi/vtbl.c	2010-01-05 10:57:03.000000000 +0000
> >> @@ -566,6 +566,7 @@
> >>   		vol->reserved_pebs = be32_to_cpu(vtbl[i].reserved_pebs);
> >>   		vol->alignment = be32_to_cpu(vtbl[i].alignment);
> >>   		vol->data_pad = be32_to_cpu(vtbl[i].data_pad);
> >> +		vol->upd_marker = vtbl[i].upd_marker;
> >>   		vol->vol_type = vtbl[i].vol_type == UBI_VID_DYNAMIC ?
> >>   					UBI_DYNAMIC_VOLUME : UBI_STATIC_VOLUME;
> >>   		vol->name_len = be16_to_cpu(vtbl[i].name_len);
> >
> > Am I right that this means that whole "forbid using volume with
> > unfinished update" functionality has not worked properly? Or I miss
> > something? Looks like I should send this patch to -stable as well.
> >
> 
> The in kernel update marker was always clear on reboot, regardless of 
> the flag in the volume table. Consequently reading from the volume 
> worked after a reboot even after a failed update.

Oh my. This is the second patch which fixes a bad bug in the volume
update code. It seems it was not used much. I personally do not use that
functionality. The previous fix was this:
http://git.infradead.org/ubi-2.6.git/commit/6afaf8a484cbbfd2ccf58a4e5396d1f280469789

Anyway, pushed your patch to ubi-2.6.git/master tree. I'll send it to
Linus later, and to -stable. Thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
