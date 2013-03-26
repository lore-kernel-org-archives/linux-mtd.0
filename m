Received: from co1ehsobe006.messaging.microsoft.com ([216.32.180.189]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UKJRQ-0003pg-4N
 for linux-mtd@lists.infradead.org; Tue, 26 Mar 2013 02:16:49 +0000
Message-ID: <51510541.8020209@freescale.com>
Date: Tue, 26 Mar 2013 10:17:37 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: "Paul B. Henson" <henson@acm.org>
Subject: Re: i.MX28 gpmi-nand underlying geometry
References: <514FC1F1.8040500@acm.org> <514FFA64.6000205@freescale.com>
 <515099D4.1090605@acm.org>
In-Reply-To: <515099D4.1090605@acm.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B403=E6=9C=8826=E6=97=A5 02:39, Paul B. Henson =E5=86=
=99=E9=81=93:
> Thanks much for the quick response and the offer of assistance. Would=20
> it be possible to have the information programmatically available such=20
> that kobs-ng (or some other application) could read/determine it=20
> itself either via a sysfs node like the previous driver or some other=20
> method to export the information to user space? A manually triggered=20
> debug log would remove the need to boot an older kernel to determine=20
> the information, but would still require a user to transcribe the=20
> information from the log to kobs-ng. If the sysfs node or other export=20
> mechanism was only available if a particular command line option was=20
> supplied to the kernel to avoid contaminating the environments of=20
> people not interested in such a feature that would be fine.=20
The latest kobs-ng uses the same method as the kernel to calculate the=20
necessary parameters.
It does not depend on the sysfs node any more. So do not worry about this=
.

You can download the latest kobs-ng for imx6q from freescale's=20
website(sorry, I do not know the weblink.)

thanks
Huang Shijie
