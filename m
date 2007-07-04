Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I62Il-0003oH-Og
	for linux-mtd@lists.infradead.org; Wed, 04 Jul 2007 06:41:42 -0400
Subject: Re: bug in UBI
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vinit Agnihotri <vinit.agnihotri@gmail.com>
In-Reply-To: <9b52d64c0707040320h26d41c9bta5dab5bfce56dd45@mail.gmail.com>
References: <9b52d64c0707040320h26d41c9bta5dab5bfce56dd45@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 04 Jul 2007 13:41:19 +0300
Message-Id: <1183545679.3531.31.camel@sauron>
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

On Wed, 2007-07-04 at 15:50 +0530, Vinit Agnihotri wrote:
> When attaching a UBI to a mtd device, UBI reports following mesage
> UBI: attached mtd0 to ubi1

Thank you for the catch!

However, if you want your patch to be committed and you to be the author
of the patch, send correctly made patch, with correct Signed-off-by.
Make sure I can use git-am to commit your patch. Google for more
information how to submit kernel patches.

Or I cam fix the print problem this myself and add you at Reported-by:.

I am fine with both.

Thanks, Artem.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
