Received: from zproxy.gmail.com ([64.233.162.192])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FBLPo-00048T-CQ
	for linux-mtd@lists.infradead.org; Mon, 20 Feb 2006 19:30:08 -0500
Received: by zproxy.gmail.com with SMTP id r28so1103021nza
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Feb 2006 16:29:56 -0800 (PST)
Message-ID: <35fb2e590602201629i1c4eefd8v3dc4e43bfa194f2c@mail.gmail.com>
Date: Tue, 21 Feb 2006 00:29:55 +0000
From: "Jon Masters" <jonmasters@gmail.com>
To: tglx@linutronix.de
In-Reply-To: <1140477524.2480.827.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <43EB96DC.3030900@eptar.com>
	<200602210942.38302.manningc2@actrix.gen.nz>
	<1140471467.2480.793.camel@localhost.localdomain>
	<200602211140.30069.manningc2@actrix.gen.nz>
	<1140477524.2480.827.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org, Charles Manning <manningc2@actrix.gen.nz>,
	Vitaly Wool <vwool@ru.mvista.com>, yaffs@stoneboat.aleph1.co.uk
Subject: Re: [Yaffs] bit error rates --> a vendor speaks
Reply-To: jonathan@jonmasters.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2/20/06, Thomas Gleixner <tglx@linutronix.de> wrote:

> On Tue, 2006-02-21 at 11:40 +1300, Charles Manning wrote:
> > Just going for the lowest common denominator all the time is like sayin=
g "run
> > all serial links at 9600 and never use 115200 because 115200 might not =
be
> > supported on all possible serial links", or "you can't run an ftdi USB =
serial
> > port at 230k because most PC serial ports only go up to 115200".
>
> Again, the comparison is still flawed.
>
> The worst serial device still guarantees a baudrate > 0 and the
> effective baudrate has no impact on data storage size.

Just let me make sure I'm getting this right:

1). You don't have OOB available to you with your NAND part.
2). You want YAFFS changed to suit your special case.

It's all very well arguing that relying on OOB in all cases is a bad
idea - and indeed, it sounds like a good idea to support packing extra
data into pages on flash - but you seem very keen on pushing the idea
that it's always bad to use OOB. So long as logic is added such that
you can have different behaviour, I fail to see the problem here.

Cheers,

Jon.
