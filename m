Received: from mgw-ext12.nokia.com ([131.228.20.171])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GfGd0-0007MR-Lu
	for linux-mtd@lists.infradead.org; Wed, 01 Nov 2006 08:59:45 -0500
Subject: Re: [PATCH/RFC] remove len/ooblen confusion in MTD/NAND code
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.0610311249420.25906@lnxricardw.se.axis.com>
References: <20061030145105.84f953e7.vwool@ru.mvista.com>
	<Pine.LNX.4.64.0610311249420.25906@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 01 Nov 2006 15:59:27 +0200
Message-Id: <1162389567.7527.6.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Linux mtd <linux-mtd@lists.infradead.org>,
	Vitaly Wool <vwool@ru.mvista.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-10-31 at 12:58 +0100, Ricard Wanderlof wrote:
> My only comment at this stage is a trivial one: many of the debug texts d=
o=20
> not match the function they are placed in. Doesn't really have anything t=
o=20
> do with the reason for the patch though, but makes for confusing debug=20
> output.

True. Feel free to send a patch :-)
--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
