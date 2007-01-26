Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HAOhy-0003fm-CV
	for linux-mtd@lists.infradead.org; Fri, 26 Jan 2007 05:53:29 -0500
Subject: Re: [MTD] UBI: Per volume update marker
From: Artem Bityutskiy <dedekind@infradead.org>
To: haver@vnet.ibm.com
In-Reply-To: <1169801265.4389.14.camel@localhost.localdomain>
References: <200701241019.27470.alexs@linux.vnet.ibm.com>
	<1169748994.9477.15.camel@sauron>
	<1169801265.4389.14.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Fri, 26 Jan 2007 12:43:29 +0200
Message-Id: <1169808209.9477.25.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Alexander Schmidt <alexs@linux.vnet.ibm.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-01-26 at 09:47 +0100, Frank Haverkamp wrote:
> The simplest form of our boot-loader does not know anything about the
> volume table and update maker block at all, but just deals with static
> volumes. If all blocks of a static volumes are available and have good
> CRC the boot-code will use it.

OK, fine with me.

> Alexander will update the patch according to the comments you gave in
> your last mail and resend the patch.

Sure, thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
