Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L7RYH-0008Ct-Ip
	for linux-mtd@lists.infradead.org; Tue, 02 Dec 2008 09:28:21 +0000
Subject: Re: MTD/flash perfomance statistics
From: Artem Bityutskiy <dedekind@infradead.org>
To: Bruce_Leonard@selinc.com
In-Reply-To: <OFD5C7E2A2.7ED96530-ON88257508.0065AD14-88257508.0066ADDB@selinc.com>
References: <OFD5C7E2A2.7ED96530-ON88257508.0065AD14-88257508.0066ADDB@selinc.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 02 Dec 2008 11:26:19 +0200
Message-Id: <1228209979.5029.45.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-11-21 at 10:41 -0800, Bruce_Leonard@selinc.com wrote:
> Okay, a bit more info has trickled in from the application guys.  We don'=
t=20
> know exactly what we want, but something is better than nothing :).  What=
=20
> we're looking for is information regarding how often we're=20
> reading/writting the flash, how many factory bad blocks there are, how=20
> many bad blocks have developed over time.

Well, this should be MTD feature, not UBI/UBIFS feature. And if you want
to preserve I/O statistics over reboots, you have to save it on flash,
which is not light-weight anymore.

>   We want to be able to make a=20
> rough estimate of how long a part is going to last, based on the part=20
> itself (i.e., number of bad blocks)

There is maximum erase counter available in /sys/class/ubi/ubi0/max_ec,
which you may use to judge how close the flash to EOL.

/sys/class/ubi/ubi0/bad_peb_count - count of bad PEB on the MTD device
this UBI device sits on. It includes both factory-marked and dynamically
appeared. There is way to distinguish between factory and non-factory
bad blocks in MTD.

/sys/class/ubi/ubi0/reserved_for_bad tells you number of eraseblocks
reserved for bad block handling. If it becomes zero, you may have
troubles when the next bad block appears, so you may watch this value as
well.

>  and any given customer's usage of the=20
> product (i.e., how often is the part being accessed, how many new bad=20
> blocks have developed, how well is the UBI wear leveling working)

Well, it is easy to add more statistics, but preserving it between
reboots is not easy.


>  wich=20
> will vary from customer to customer depending on how they're using the=20
> product.  It doesn't have to be anything sophisticated and I think=20
> primarily what the app guys are after are things that UBI probably alread=
y=20
> tracks for the wear leveling (i.e., number of writes and bad blocks).

Well, loot at the above sysfs-provided info, may be it is enough?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
