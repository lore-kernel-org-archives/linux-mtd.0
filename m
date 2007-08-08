Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IIoOC-00064U-EX
	for linux-mtd@lists.infradead.org; Wed, 08 Aug 2007 12:31:45 -0400
Subject: Re: LogFS take five
From: Artem Bityutskiy <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20070808161234.GB15319@lazybastard.org>
References: <20070808161234.GB15319@lazybastard.org>
Content-Type: text/plain; charset=utf-8
Date: Wed, 08 Aug 2007 19:27:17 +0300
Message-Id: <1186590437.19606.38.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: akpm@osdl.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi J=C3=B6rn,

On Wed, 2007-08-08 at 18:12 +0200, J=C3=B6rn Engel wrote:
> It has been a while, mainly because I found a bunch of races and didn't
> want to publish anything before those were fixed.  Patch is still
> against 2.6.21 and just for review.

I'm very interested how do you account free/dirty space in LogFS:

* When you need to write new data, how do you select the place where to
write?
* When you run out of space, how do select find the segment to
garbage-collect?

For any given segment (or eraseblock), how do you find amount of free
and dirty space in it?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
