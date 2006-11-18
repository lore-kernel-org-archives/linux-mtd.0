Received: from mgw-ext11.nokia.com ([131.228.20.170])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GlPi0-0005S3-VV
	for linux-mtd@lists.infradead.org; Sat, 18 Nov 2006 07:54:22 -0500
Subject: Re: starter!
From: Artem Bityutskiy <dedekind@infradead.org>
To: darshak@elitecore.com
In-Reply-To: <2785.192.168.15.61.1163841555.squirrel@newwebmail.elitecore.com>
References: <2785.192.168.15.61.1163841555.squirrel@newwebmail.elitecore.com>
Content-Type: text/plain; charset=utf-8
Date: Sat, 18 Nov 2006 14:51:50 +0200
Message-Id: <1163854310.5597.62.camel@sauron>
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

Hi,

On Sat, 2006-11-18 at 14:49 +0530, darshak@elitecore.com wrote:
> Hi All
> I want to involve in JFFs3 development.
> Please tell me what is required docs/knowledge for that.
> How can I proceed for that ?

I guess you may start from the JFFS3 docs available at
http://www.linux-mtd.infradead.org/tech/JFFS3design.pdf

It is quite old and we changed our minds about several things.

You may also read Szeged guys docs at
http://www.inf.u-szeged.hu/jffs2/jffs3.php

But the last plan is to base JFFS3 on top of UBI which is a new
promising piece of software. Look at

http://www.linux-mtd.infradead.org/doc/ubi.html
http://www.linux-mtd.infradead.org/faq/ubi.html

So, to put it differently, there is no cool and clean documentation.
There is some code and prototypes but they are far from something usable
yet. But if you are eager enough you withstand this :-)

Alternatively, there is a LogFS project, see
http://www.linux-mtd.infradead.org/doc/logfs.html

I do not follow it but there is some code exist. You may be interested.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
