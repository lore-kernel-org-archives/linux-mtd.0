Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JhfjO-0006RY-9g
	for linux-mtd@lists.infradead.org; Fri, 04 Apr 2008 06:48:58 +0000
Subject: Re: can't mount ubifs on volume smaller than 265 LEBs/32MiB
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <1207285579.8040.14.camel@sauron>
References: <20080404041251.GA2752@cloud.net.au>
	<1207285579.8040.14.camel@sauron>
Content-Type: text/plain; charset=utf-8
Date: Fri, 04 Apr 2008 09:48:57 +0300
Message-Id: <1207291737.8040.24.camel@sauron>
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

On Fri, 2008-04-04 at 08:06 +0300, Artem Bityutskiy wrote:
> I'll look at this shortly, thanks for the report. As a suggestion, if
> you have problems with UBIFS and going to send a bug-report, try to
> enable debugging, reproduce the problem and send dmesg. With debugging
> enabled it prints more useful information and makes it easier to
> identify and fix the issue.

Adrian said he fixed a validation bug recently, so you should update and
the problem will probably go away.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
