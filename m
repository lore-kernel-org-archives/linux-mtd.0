Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SFxIR-0002k1-5b
 for linux-mtd@lists.infradead.org; Fri, 06 Apr 2012 00:44:59 +0000
From: Kushwaha Prabhakar-B32579 <B32579@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: Query mtd-utils v1.4.9 : flash_erase.c
Date: Fri, 6 Apr 2012 00:44:48 +0000
Message-ID: <071A08F2C6A57E4E94D980ECA553F8745EEA99@039-SN1MPN1-005.039d.mgd.msft.net>
References: <071A08F2C6A57E4E94D980ECA553F8745E82D5@039-SN1MPN1-005.039d.mgd.msft.net>
 <CAN8TOE-0GPgbfgrps-ieQb9NYnOFv79TZdxhTyd_ydPboP_8Pg@mail.gmail.com>
In-Reply-To: <CAN8TOE-0GPgbfgrps-ieQb9NYnOFv79TZdxhTyd_ydPboP_8Pg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Wood Scott-B07421 <B07421@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks Brian for the clarification.

Please find few more queries in-lined.


> -----Original Message-----
> From: Brian Norris [mailto:computersforpeace@gmail.com]
> Sent: Friday, April 06, 2012 2:28 AM
> To: Kushwaha Prabhakar-B32579
> Cc: Wood Scott-B07421; linux-mtd@lists.infradead.org
> Subject: Re: Query mtd-utils v1.4.9 : flash_erase.c
>=20
> On Thu, Apr 5, 2012 at 2:21 AM, Kushwaha Prabhakar-B32579
> <B32579@freescale.com> wrote:
> > =A0I checked latest mtd-utils ver 1.4.9 for file flash_erase.c.
> >
> > It usage MEMGETOOBSEL ioctl to get OOB information from the driver. But
> this ioctl may returns error for big NAND chips.
> > The reason of failure would be the following condition at
> > linux/driver/mtd/mtdchar.c
> > =A0if (mtd->ecclayout->eccbytes > ARRAY_SIZE(oi.eccpos))
> >
> > MEMGETOOBSEL has been obsolete. then Why mtd-utils still using it.
>=20
> A few reasons:
> (1) There is no replacement interface and there is no plan for a
> replacement AFAIK (unless you count MTD_OOB_AUTO within the kernel, as
> you mention).
> (2) It's only used for the legacy option JFFS2 format option (-j or --
> jffs2). JFFS2 isn't supported much anymore, and it probably is not worth
> using on "big NAND chips." On some systems, ECC does not even leave
> enough room in OOB for JFFS2.

Looks like mtd-utils is no more interested in supporting jffs2 for big NAND=
 chips.

Going forward,  ubifs is the File system for NAND chips supported by mtd-ut=
ils??


>=20
> > Also, I don't think flash_erase.c supports MTD_OOB_AUTO. Although its
> support is already part of Linux kernel.
>=20
> What do you mean by "support MTD_OOB_AUTO" (this is actually renamed
> MTD_OPS_AUTO_OOB, btw)? If you're speaking of the -j option still, then
> it's probably because nobody has bothered supporting old features on new
> userspace tools with new (large-OOB) chips. This would require a
> developer who cares about JFFS2 to compare the various versions of
> "autoplace." It wouldn't be too hard to make this use MTD_OPS_AUTO_OOB; I
> just haven't studied auto/jffs2 much...
>=20

Means, If I want to use, I have to make local changes in mtd-utils :(
Is there any plan to support MTD_OPS_AUTO_OOB in future in-case somebody se=
nd patch?

--Prabhakar
