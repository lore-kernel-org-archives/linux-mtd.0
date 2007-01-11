Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H4yCR-0005AF-91
	for linux-mtd@lists.infradead.org; Thu, 11 Jan 2007 06:34:30 -0500
Subject: Re: max_ec value is shown as 1
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sandeep Kumar <sandeepksinha@gmail.com>
In-Reply-To: <37d33d830701110322x5f60ec88r17b0cdd562ec8d4b@mail.gmail.com>
References: <37d33d830701110244m58afec33hcf77323e4dc550f3@mail.gmail.com>
	<1168512581.26936.33.camel@sauron>
	<37d33d830701110322x5f60ec88r17b0cdd562ec8d4b@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 11 Jan 2007 13:34:08 +0200
Message-Id: <1168515248.26936.36.camel@sauron>
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

On Thu, 2007-01-11 at 16:52 +0530, Sandeep Kumar wrote:
> I got it, I think. I mistook this value as the maximum erase count for
> a leb on that device. And thats why I was surprised.

Maximum LEB EC is 0x7FFFFFFF (31 bit) in current implementation.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
