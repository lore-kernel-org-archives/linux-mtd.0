Received: from qw-out-1920.google.com ([74.125.92.148])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NHmJh-00014y-H3
	for linux-mtd@lists.infradead.org; Mon, 07 Dec 2009 22:44:34 +0000
Received: by qw-out-1920.google.com with SMTP id 5so751612qwc.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 07 Dec 2009 14:44:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4B1D600A.10507@nokia.com>
References: <dbdb2ea60912030931j380a7702hc92d4fbe72341730@mail.gmail.com>
	<4B18F300.7080006@nokia.com>
	<dbdb2ea60912070741l7a0dde1dt49ba0f5413accf61@mail.gmail.com>
	<4B1D600A.10507@nokia.com>
Date: Mon, 7 Dec 2009 17:44:27 -0500
Message-ID: <dbdb2ea60912071444y149c536bt3106a5ad1da9b221@mail.gmail.com>
Subject: Re: ubifs wear leveling across entire device
From: twebb <taliaferro62@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> Wear-levelling occurs within a single UBI device which is generally
> a single MTD partition.
>
> You need 1 MTD partition and 1 UBI device with 3 volumes. =A0Make the
> 3 volumes total less than the whole UBI device and you can add a 4th
> volume later.
>

If I make 1 MTD partition and 1 corresponding UBI device, should (can)
it include areas that will never be accessed via UBI-aware tools?  For
example, is it safe to have on a 4GB physical device a single 4GB MTD
partition with a single corresponding UBI device, but only 3GB of the
4GB device contain N UBI volumes only accessed via appropriate UBI
user-space (or u-boot) tools while the remaining 1GB of the 4GB is
accessed with mtd-utils?

There are two reasons for this approach:
1 - to (hopefully) get the benefits of wear leveling across the entire
physical device (though I think this may not work in the scenario I've
described)
2 - to allow access to a portion of the flash by non-UBI aware code

I assume the alternative (w/o the benefit of wear leveling across the
entire device) is to define 2 MTD partitions: 1 for "non-UBI" access
and 1 for a single UBI device with multiple UBI volumes?

Thanks,
twebb
