Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HgyHL-0002iw-Pd
	for linux-mtd@lists.infradead.org; Thu, 26 Apr 2007 03:20:41 -0400
Subject: Re: [PATCH] OneNAND 2x program support
From: Artem Bityutskiy <dedekind@infradead.org>
To: kmpark@infradead.org
In-Reply-To: <000701c787a8$f968a9f0$e1ac580a@swcenter.sec.samsung.co.kr>
References: <000701c787a8$f968a9f0$e1ac580a@swcenter.sec.samsung.co.kr>
Content-Type: text/plain; charset=utf-8
Date: Thu, 26 Apr 2007 10:19:58 +0300
Message-Id: <1177571998.18889.14.camel@sauron>
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

Hi Kyungmin,

On Thu, 2007-04-26 at 11:16 +0900, Kyungmin Park wrote:
> Here's new feature of OneNAND, 2X program.

Nice.

Am I right that in this mode we end up with a 4KiB page size?

> Note: this features is supported with the recent OneNAND chips. please do=
n't try
> to use previous chips.

It would be nice to note this in 'config MTD_ONENAND_2X_PROGRAM' and to
specify OneNAND revision starting from which it is safe to use this
mode.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
