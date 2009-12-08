Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NHthC-00082W-Px
	for linux-mtd@lists.infradead.org; Tue, 08 Dec 2009 06:37:19 +0000
Subject: Re: ubifs wear leveling across entire device
From: Artem Bityutskiy <dedekind1@gmail.com>
To: twebb <taliaferro62@gmail.com>
In-Reply-To: <dbdb2ea60912071444y149c536bt3106a5ad1da9b221@mail.gmail.com>
References: <dbdb2ea60912030931j380a7702hc92d4fbe72341730@mail.gmail.com>
	<4B18F300.7080006@nokia.com>
	<dbdb2ea60912070741l7a0dde1dt49ba0f5413accf61@mail.gmail.com>
	<4B1D600A.10507@nokia.com>
	<dbdb2ea60912071444y149c536bt3106a5ad1da9b221@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 08 Dec 2009 08:36:47 +0200
Message-Id: <1260254207.19669.8.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-12-07 at 17:44 -0500, twebb wrote:
> >
> > Wear-levelling occurs within a single UBI device which is generally
> > a single MTD partition.
> >
> > You need 1 MTD partition and 1 UBI device with 3 volumes.  Make the
> > 3 volumes total less than the whole UBI device and you can add a 4th
> > volume later.
> >
> 
> If I make 1 MTD partition and 1 corresponding UBI device, should (can)
> it include areas that will never be accessed via UBI-aware tools?  For
> example, is it safe to have on a 4GB physical device a single 4GB MTD
> partition with a single corresponding UBI device, but only 3GB of the
> 4GB device contain N UBI volumes only accessed via appropriate UBI
> user-space (or u-boot) tools while the remaining 1GB of the 4GB is
> accessed with mtd-utils?

This contradicts to what you originally asked for. "Give me
wear-levelling across whole device, but do not touch this 1GiB".

> There are two reasons for this approach:
> 1 - to (hopefully) get the benefits of wear leveling across the entire
> physical device (though I think this may not work in the scenario I've
> described)

If you want untouched 1 GiB, make 3GiB + 1GiB partitions, give 3GiB to
UBI.

> 2 - to allow access to a portion of the flash by non-UBI aware code
> 
> I assume the alternative (w/o the benefit of wear leveling across the
> entire device) is to define 2 MTD partitions: 1 for "non-UBI" access
> and 1 for a single UBI device with multiple UBI volumes?

Yes.

Also, you can emulate MTD devices on top of UBI volumes, so you can use
many of the MTD tools in linux.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
