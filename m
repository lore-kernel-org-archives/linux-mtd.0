Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I1g6H-0001Ci-Ui
	for linux-mtd@lists.infradead.org; Fri, 22 Jun 2007 06:10:47 -0400
Subject: Re: UBI - Nand bad block management details required
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sudeep K N <sudeepholla.maillist@gmail.com>
In-Reply-To: <366f00c80706220306l1e0ebcek3c7cdc988c82de81@mail.gmail.com>
References: <366f00c80706220306l1e0ebcek3c7cdc988c82de81@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 22 Jun 2007 13:10:30 +0300
Message-Id: <1182507030.4403.80.camel@sauron>
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

On Fri, 2007-06-22 at 15:36 +0530, Sudeep K N wrote:
> Does the UBI depend on the bad block table(BBT) built by MTD?

Yes, it asks MTD if blocks are bad or not.

> In otherwords, can the complete chip scan during chip probe be avoided
> by enabling/setting NAND_SKIP_BBTSCAN in chip->options?

No, UBI relies on MTD in this. MTD supports on-flash BBT tables, so if
you do not want MTD level to do full chip scan you should use on-flash
BBT.

> Does UBI built BBT independent of the MTD built BBT?

No, it relies on MTD.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
