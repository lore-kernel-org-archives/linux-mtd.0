Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Ao9MG-0005MS-0J
	for linux-mtd@lists.infradead.org; Tue, 03 Feb 2004 22:49:28 +0000
Sender: ahennessy@mvista.com
Message-ID: <402023A4.C2AF8E2E@mvista.com>
Date: Tue, 03 Feb 2004 14:41:41 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <4018514D.6E4DB38A@mvista.com>
	<401FEA03.7DCCA6F5@mvista.com>
	<1075847401.786.3961.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
cc: andrzej_mialkowski@o2.pl
cc: linux-mtd@lists.infradead.org
Subject: Re: gen probe.c issue
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:

> On Tue, 2004-02-03 at 10:35 -0800, Alice Hennessy wrote:
> > I believe it's ok to set up partitions for a flash and not have all the flash visible.  Perhaps
> > a better way to do this would be to just make another partition and make the protected part
> > read only.   But I believe not making the whole flash visible is also acceptable.
> > BTW, I don't use redboot partitioning with this flash.
> >
> > David,  if you think it's bad practice,  I will change my mapping file instead.
>
> I'd very much prefer to show the chip driver the whole chip and
> partition it appropriately, yes please.
>
> --
> dwmw2

Will do.

Alice
