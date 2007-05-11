Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HmPm3-0004Bh-I0
	for linux-mtd@lists.infradead.org; Fri, 11 May 2007 03:42:52 -0400
Subject: Re: NAND flash write goes wrong
From: Artem Bityutskiy <dedekind@infradead.org>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <46441839.2020004@parrot.com>
References: <200705102150.31171.borasah@gmail.com>
	<Pine.LNX.4.64.0705110825530.3951@lnxricardw.se.axis.com>
	<1178866648.3643.7.camel@sauron>  <46441839.2020004@parrot.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 11 May 2007 10:42:29 +0300
Message-Id: <1178869349.3643.11.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Linux mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-05-11 at 09:16 +0200, Matthieu CASTET wrote:
> Could you give a link to your fix ?

http://git.infradead.org/?p=3Dmtd-2.6.git;a=3Dcommit;h=3D74641d75275936796d=
239f828b80cb030e9f9b0a

Although even with this fix JFFS2 does not survive I/O errors in many
cases, there were more error-path fixes. 2.6.20's JFFS2 is much better
in errors handling then older versions.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
