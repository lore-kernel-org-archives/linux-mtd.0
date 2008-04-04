Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jhhaf-000412-4f
	for linux-mtd@lists.infradead.org; Fri, 04 Apr 2008 08:48:05 +0000
Subject: Re: can't mount ubifs on volume smaller than 265 LEBs/32MiB
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <1207285579.8040.14.camel@sauron>
References: <20080404041251.GA2752@cloud.net.au>
	<1207285579.8040.14.camel@sauron>
Content-Type: text/plain; charset=utf-8
Date: Fri, 04 Apr 2008 11:48:01 +0300
Message-Id: <1207298881.8040.26.camel@sauron>
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

Just wrote a short HOWTO entry:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
