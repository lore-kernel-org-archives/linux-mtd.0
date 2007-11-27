Received: from rn-out-0910.google.com ([64.233.170.189]
	helo=rn-out-0102.google.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Ix9rN-0001uU-OT
	for linux-mtd@lists.infradead.org; Tue, 27 Nov 2007 23:29:03 +0000
Received: by rn-out-0102.google.com with SMTP id e25so822226rng
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Nov 2007 15:28:56 -0800 (PST)
Message-ID: <9c9fda240711271528j5dd89cacg9b1b1c11e700b16b@mail.gmail.com>
Date: Wed, 28 Nov 2007 08:28:56 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: dedekind@infradead.org
Subject: Re: [RFC][PATCH][JFFS2] JFFS2 support for NOP 1
In-Reply-To: <1196164758.20132.6.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20071127073616.GA22556@party>
	<20071127095518.GA29456@lazybastard.org>
	<9c9fda240711270348q7798ddd5jfb7bf763b3497500@mail.gmail.com>
	<1196164758.20132.6.camel@sauron>
Cc: linux-mtd@lists.infradead.org,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
	dwmw2@infradead.org, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/27/07, Artem Bityutskiy <dedekind@infradead.org> wrote:
> On Tue, 2007-11-27 at 20:48 +0900, Kyungmin Park wrote:
> > In summary,
> > NOR: no oob, no problem to write bytes.
> > SLC NAND: has oob, NOP is allowed at least 2 and more.
> > MCL NAND:  has oob, but NOP is 1.
>
> Hi Kyungmin,
>
> in MTD we call this stuff "sub-pages", so I'd suggest you to use this
> term instead of NOP. People are not accustomed to NOP. Use whatever term
> in the driver, but try to use "sub-pages" term when you go up to the
> generic layer.

Hi Artem,

Umm, I'm not sure it's the right term. "sub-page" doesn't cover the
oob area. It's only meanful at data area.
Anyway it should be sub-page is 0 in MLC case.

Thank you,
Kyungmin Park
