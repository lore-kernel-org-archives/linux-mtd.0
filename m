Received: from wproxy.gmail.com ([64.233.184.206])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLKba-0004xD-2x
	for linux-mtd@lists.infradead.org; Mon, 20 Mar 2006 08:39:40 -0500
Received: by wproxy.gmail.com with SMTP id 69so966889wra
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Mar 2006 05:39:28 -0800 (PST)
Message-ID: <625fc13d0603200539q79b80d17t4cf54abcc4507359@mail.gmail.com>
Date: Mon, 20 Mar 2006 07:39:28 -0600
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Dave Laurin" <dave@veriwave.com>
In-Reply-To: <009c01c64bb3$e6234c60$c502640a@veriwavems2>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <009c01c64bb3$e6234c60$c502640a@veriwavems2>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Anyone using Intel 28F256P30B
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3/19/06, Dave Laurin <dave@veriwave.com> wrote:
>  Is Intel 28F256P30B flash supported in the current release of mtd?

Not sure if we're using B or A of that part, but the support in MTD
should be the same either way.  Using the latest CVS works just fine.=20
Not sure about which vanilla kernel contains that support.  I think
2.6.15 and on should have it.

josh
