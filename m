Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KBTE6-00055V-G9
	for linux-mtd@lists.infradead.org; Wed, 25 Jun 2008 11:31:50 +0000
Subject: Re: [MTD][NAND] nandsim: modify report wear information function
From: Artem Bityutskiy <dedekind@infradead.org>
To: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
In-Reply-To: <1214312466.3201.6.camel@localhost.localdomain>
References: <1214312466.3201.6.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Wed, 25 Jun 2008 14:30:52 +0300
Message-Id: <1214393452.6573.22.camel@sauron>
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

On Tue, 2008-06-24 at 21:01 +0800, xiaochuan-xu wrote:
> a smart wear information report function, which can print wear leveling
> information more obviously and vividly.

Can you just change constant 9 to something larger? What is the more
appropriate value for you?

Or if you really really want it to be configurable, I think you may
re-use rptwear argument instead. It is integer, so you may assign the
desirable number to it, instead of introducing one more argument.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
