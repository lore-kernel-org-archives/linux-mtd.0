Received: from ug-out-1314.google.com ([66.249.92.174])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FhtCz-0006Rx-0P
	for linux-mtd@lists.infradead.org; Sun, 21 May 2006 15:04:11 -0400
Received: by ug-out-1314.google.com with SMTP id q2so1099375uge
	for <linux-mtd@lists.infradead.org>;
	Sun, 21 May 2006 12:03:08 -0700 (PDT)
Message-ID: <625fc13d0605211203o406ba610p2354840941380b77@mail.gmail.com>
Date: Sun, 21 May 2006 14:03:08 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
In-Reply-To: <1148231047.12285.2.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <E1FhOEg-0003dX-4R@pentafluge.infradead.org>
	<625fc13d0605201411kb7f40e1sd6cfe8ebf50a6e38@mail.gmail.com>
	<20060520141924.2f2e5289.akpm@osdl.org>
	<625fc13d0605210732x189256c6o21f3b49a17e5622e@mail.gmail.com>
	<1148231047.12285.2.camel@pmac.infradead.org>
Cc: Andrew Morton <akpm@osdl.org>, linux-mtd@lists.infradead.org
Subject: Re: [MTD] Avoid 64-bit division in mtdconcat
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/21/06, David Woodhouse <dwmw2@infradead.org> wrote:
> On Sun, 2006-05-21 at 09:32 -0500, Josh Boyer wrote:
> > Sorry for the noise.  At least it motivated me to finally setup a
> > cross compile environment on my new machine ;)
>
> And to switch your board to arch/powerpc too, I hope?

Eventually, yes.  4xx is currently lagging quite a bit in that area
and there's no clear direction for  a dtb yet.  More sighs.

josh
