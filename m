Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jy1A2-0003WR-0T
	for linux-mtd@lists.infradead.org; Mon, 19 May 2008 08:56:06 +0000
Subject: Re: ubiupdatevol from pipe/compressed file
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20080519084746.GA19325@cloud.net.au>
References: <20080519084746.GA19325@cloud.net.au>
Content-Type: text/plain; charset=utf-8
Date: Mon, 19 May 2008 11:54:01 +0300
Message-Id: <1211187241.27243.40.camel@sauron>
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

On Mon, 2008-05-19 at 18:47 +1000, Hamish Moffatt wrote:
> Alternatively allow the uncompressed file size to be specified as a
> ubiupdatevol parameter. In my application I can store the uncompressed
> file size and provide it to ubiupdatevol ok.

Yeah, I think it is reasonable to add one more option and pass the size
there. Then it could be easy to teach ubiupdatevol to read the specified
amount of bytes from stdin.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
