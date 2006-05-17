Received: from py-out-1112.google.com ([64.233.166.182])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FgTuW-0001jl-DL
	for linux-mtd@lists.infradead.org; Wed, 17 May 2006 17:50:30 -0400
Received: by py-out-1112.google.com with SMTP id c59so725878pyc
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 May 2006 14:50:25 -0700 (PDT)
Message-ID: <c0c067900605171450u3bbd5292sf61341527d5040e3@mail.gmail.com>
Date: Wed, 17 May 2006 17:50:24 -0400
From: "Dan Merillat" <harik.attar@gmail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
In-Reply-To: <1147822363.30771.10.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <E76D631A87C2874E895D1639A1CEDB962AF95B@aae-exchange.aaesys.com>
	<1147822363.30771.10.camel@shinybook.infradead.org>
Cc: linux-mtd@lists.infradead.org, Jayasri Sangu <JayasriS@aaesys.com>
Subject: Re: Intel P30 flash support MTD 2.4.16 kernel
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/16/06, David Woodhouse <dwmw2@infradead.org> wrote:
> On Tue, 2006-05-16 at 15:56 -0700, Jayasri Sangu wrote:
> >     We are using 2.4.16 kernel on our powerpc 8260 board. Currently we
> > are using 28F320C3 flash and it works fine with the MTD(JFFS2).
> >
> > We are planning to change to P30 flash. Does 2.4.16 kernel supports
> > this flash?
> >
> > If not what are my choices?
>
> 2.6.16.

If it fails, turn on DEBUG_CFI_FEATURES in
drivers/mtd/chips/cfi_cmdset_0001.c and check
for Simultaneous Operations.  Some P30 versions erroniously set that
bit and fail horribly as a result.   I spent a week trying to figure
that out.
