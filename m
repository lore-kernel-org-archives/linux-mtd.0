Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1InLv4-0007RE-5T
	for linux-mtd@lists.infradead.org; Wed, 31 Oct 2007 18:20:20 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: UBI Used In Commercial Products ??
Date: Wed, 31 Oct 2007 15:20:06 -0700
Message-ID: <B1EDF20A6EAAD74EA65E46F774F1784502C6D843@orsmsx413.amr.corp.intel.com>
In-Reply-To: <loom.20071031T215155-403@post.gmane.org>
References: <B1EDF20A6EAAD74EA65E46F774F1784502C6D577@orsmsx413.amr.corp.intel.com>
	<loom.20071031T215155-403@post.gmane.org>
From: "Johnson, Charles F" <charles.f.johnson@intel.com>
To: "Sergei Sharonov" <sergei.sharonov@halliburton.com>,
	<linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

JFFS2 has been modified to sit on top of UBI. =20

One thought here is that I would think that mounting is a fairly rare
occurance. =20
You're much more likely to coming back from suspend.  Notice the
difference in time it takes from my HP iPAQ to power-on normally vs a
cold boot.  It is very different. =20


Charles Johnson
Ultra-Mobility Group
Platform Software Engineering
Intel Corporation
charles.f.johnson@intel.com


-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Sergei
Sharonov
Sent: Wednesday, October 31, 2007 3:10 PM
To: linux-mtd@lists.infradead.org
Subject: Re: UBI Used In Commercial Products ??

Hello,

> Does anyone on this list know if UBI is currently being used in any
> commercially released products ??
> If so, does anyone know which ones ??

I am probably missing something here, but how can UBI be useful by
itself?
I would think until UBIFS is ready there is not much one can do with it.
Please tell me I am wrong ;-)

I am not aware of any non-commercial solution that can be used on a
system
that:
1. Has lots (gigabytes) of flash
2. Must be power-fail safe.
3. Must boot in seconds even after power cycle
4. Does not have internal battery or super-capacitor to allow for sync
on
power failure.

I hope UBI+UBIFS will be able to do that but it is not ready yet.
Another
possibility is logfs but it is not ready either.

Sorry if that is a bit off-topic.

Regards,

Sergei Sharonov





______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
