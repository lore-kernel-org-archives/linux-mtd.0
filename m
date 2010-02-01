Received: from ey-out-1920.google.com ([74.125.78.146])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NbkUb-0006jk-U9
	for linux-mtd@lists.infradead.org; Mon, 01 Feb 2010 00:50:22 +0000
Received: by ey-out-1920.google.com with SMTP id 26so773191eyw.26
	for <linux-mtd@lists.infradead.org>;
	Sun, 31 Jan 2010 16:50:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <dbdb2ea61001311517o730595b3j1c32bc8327908f43@mail.gmail.com>
References: <dbdb2ea61001291118v78722d73gee24345e61e41766@mail.gmail.com>
	<1264796505.21418.3.camel@localhost.localdomain>
	<dbdb2ea61001311517o730595b3j1c32bc8327908f43@mail.gmail.com>
Date: Sun, 31 Jan 2010 19:50:16 -0500
Message-ID: <dbdb2ea61001311650v136a002v3a8e261e91d4a457@mail.gmail.com>
Subject: Re: ubiformat image verification
From: twebb <taliaferro62@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
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

>>> Can the image that is written to NAND using ubiformat be read back
>>> (using nanddump) and compared identically to the original image file?
>>> I want to somehow verify that the image was written error-free to NAND
>>> flash.
>>
>> It can. But it is simpler to add a --check option to ubiformat and teach
>> it to read stuff back and verify.
>>
>
> Yes, a --check or --verify option would be nice. =A0Does it matter
> whether the underlying NAND flash is erased or not prior to the
> ubiformat?
>

I'm finding that it does matter whether the NAND is erased or not
first.  If erased, the comparison after read back is successful.  If
not erased in advance, the comparison fails.  Can you confirm that
this is accurate?

Thanks,
twebb
