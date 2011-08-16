Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QtNjr-0008GZ-1m
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2011 17:47:43 +0000
Received: by wyh11 with SMTP id 11so114561wyh.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Aug 2011 10:47:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201108160931.02543.brian.foster@maxim-ic.com>
References: <201107251148.51262.brian.foster@maxim-ic.com>
	<CAMjpGUcjhuc6MaH0y2vGdM5ru00BJEmVeBwMUebkbfoxDNY28g@mail.gmail.com>
	<1313381489.2200.19.camel@koala>
	<201108160931.02543.brian.foster@maxim-ic.com>
Date: Tue, 16 Aug 2011 10:47:39 -0700
Message-ID: <CAN8TOE9znFAB0qDmF-NHpqQSDt7nLzLLBn_9attxdh=WYKqN4g@mail.gmail.com>
Subject: Re: [BUG] mtdinfo -a: Tries to open NULL pointer for NOR with
	Eraseblock Regions
From: Brian Norris <computersforpeace@gmail.com>
To: Brian Foster <brian.foster@maxim-ic.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Mike Frysinger <vapier@gentoo.org>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 16, 2011 at 12:31 AM, Brian Foster
<brian.foster@maxim-ic.com> wrote:
> =A0You should decide what =91-a=92 means: =A0=93all information=94
> =A0or =93all devices=94. =A0If =93all information=94, then either a
> =A0bunch of work needs to be done, or else =91-a=92 removed.
>
> =A0But if =93all devices=94 =A0=97 which happens to be both what
> =A0I think it means and how I use it =97 =A0then it is very
> =A0useful, at least in my situation where I'm bringing up
> =A0a new SoC and board. =A0It's a nice summary of what I'm
> =A0usually interested in; if it didn't exist, I'd =93have=94
> =A0to script it. =A0And in either case, if and when I do
> =A0need all the information about _a_ device, then I do
> =A0=91mtdinfo /dev/mtd<N>=92.

I think we're going with "all devices" then, with less emphasis on
100% completeness of information. For one, it reflects the current
code, and the help message has stated this its purpose for a while:

"-a, --all        print information about all MTD devices"

Thanks for the contributions.

Brian
