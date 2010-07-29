Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OecWl-0006E5-O8
	for linux-mtd@lists.infradead.org; Thu, 29 Jul 2010 23:28:40 +0000
Message-ID: <4C520E99.3050006@broadcom.com>
Date: Thu, 29 Jul 2010 16:28:25 -0700
From: "Brian Norris" <norris@broadcom.com>
MIME-Version: 1.0
To: "Matthieu CASTET" <matthieu.castet@parrot.com>
Subject: Re: [PATCH v2] mtd/nand: Support Micron chips, pagesize >= 4KB
References: <4C4DEA3D.5070208@broadcom.com>
	<4C4F3691.9020505@broadcom.com> <4C4FEC02.9050300@parrot.com>
In-Reply-To: <4C4FEC02.9050300@parrot.com>
Content-Type: text/plain;
 charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Maxim Levitsky <maximlevitsky@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>, Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/28/2010 01:36 AM, Matthieu CASTET wrote:
> Hi,
>=20
> Brian Norris a =E9crit :
>> I found some newer Micron parts that introduce an 8K page size, and so
>> need a modification on the algorithm. Here's the updated list and a
>> revision to my patch.
>>
> Doesn't these micron nands support onfi ?
> The micron nands we have support it.

Yes, they do support ONFI...but you missed my statements in the previous
e-mail :)

On 07/26/2010 01:04 PM, Brian Norris wrote:
> And before the question is asked: I realize that these chips support ONFI=
,
> so that should be the primary means by which to identify them, but I woul=
d
> still like to be able to detect these properly without ONFI if necessary,
> especially considering some of the older NAND controllers we still use do=
 not
> support reading ONFI data.

But thanks for the interest. I guess the real question I have is: is it
possible to do a contrived detection by ID for these, even though the inten=
t
is for detection by ONFI? If so, is my [PATCH v2] an acceptable solution?
