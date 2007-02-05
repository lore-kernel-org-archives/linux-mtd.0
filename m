Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HDzwP-0008R4-9V
	for linux-mtd@lists.infradead.org; Mon, 05 Feb 2007 04:15:16 -0500
Subject: Re: Do not understand use of oobfree
From: Artem Bityutskiy <dedekind@infradead.org>
To: Philip Rakity <prakity@yahoo.com>
In-Reply-To: <1170663762.3628.56.camel@sauron>
References: <872380.68552.qm@web58702.mail.re1.yahoo.com>
	<1170663762.3628.56.camel@sauron>
Content-Type: text/plain; charset=utf-8
Date: Mon, 05 Feb 2007 11:14:53 +0200
Message-Id: <1170666893.3628.84.camel@sauron>
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

On Mon, 2007-02-05 at 10:22 +0200, Artem Bityutskiy wrote:
> I've just submitted a patch which teaches UBI to use MTD_OOB_AUTO
> option. Please, make sure your driver supports it and try the patch.

BTW, Adrian Hunter wrote an useful test program to test OOB_AUTO support
in your driver. It is accessible via

git://git.infradead.org/~ahunter/oobtest.git

or web http://git.infradead.org/?p=3Dusers/ahunter/oobtest.git;a=3Dsummary

Try to run it to make sure your driver is allright.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
