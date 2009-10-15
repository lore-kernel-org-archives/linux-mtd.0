Received: from cluster-a.mailcontrol.com ([85.115.52.190])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MySnt-0003Jn-SQ
	for linux-mtd@lists.infradead.org; Thu, 15 Oct 2009 16:03:56 +0000
Received: from mail.mta.it (mail.mta.it [89.96.171.250])
	by rly08a.srv.mailcontrol.com (MailControl) with ESMTP id
	n9FG3UlH023780
	for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2009 17:03:32 +0100
From: Fortini Matteo <Matteo.Fortini@mta.it>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Thu, 15 Oct 2009 18:02:26 +0200
Subject: Acceleration for map_copy_from on powerpc 512x
Message-ID: <BD9F3F3F5A6CCF4BA032B9FED4DD312E5EA2BA99AB@mta-digimail.MTA.INT>
Content-Language: it-IT
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I'm working on a powerpc (PPC512x) embedded Linux product, and while I was =
trying to improve boot time, I found I could exploit the hw in order to spe=
ed up reading from NOR flashes.
The Linux/mtd version we're using is 2.6.24.6+Freescale patches.
Basically, I needed to hack the map_copy_from, which for my arch and uncach=
ed areas translates to a memcpy, in order to use the SCLPC FIFO, with a per=
formance benefit of >2x on aligned multiple of 32Bytes transfers.

I didn't find a cleaner way than just #ifdef'ing the map_copy_from call and=
 substitute with my call on relevant cases. I wonder if there is a cleaner =
way.

And yes, as soon as I've cleaned up the code a little bit, I will definitel=
y post a patch about it.

Moreover: a huge benefit would come from exploiting DMA on these transfers,=
 but I found I'm in_atomic while doing map_copy_from... is there an alterna=
tive way of locking than just disabling preemption?
I know maybe a newer kernel has already fixed it, but we're kind of stuck w=
ith the old one since we don't have time to port all of our device drivers =
to 2.6.3x

Thanks,
Matteo=
