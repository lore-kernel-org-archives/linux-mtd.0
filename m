Received: from wproxy.gmail.com ([64.233.184.226])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FO2kV-0006pj-5e
	for linux-mtd@lists.infradead.org; Mon, 27 Mar 2006 20:11:58 -0500
Received: by wproxy.gmail.com with SMTP id i31so510024wra
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Mar 2006 17:11:54 -0800 (PST)
Message-ID: <625fc13d0603271705h6763cec8n5d07f492079851d9@mail.gmail.com>
Date: Mon, 27 Mar 2006 19:05:20 -0600
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Andrew Morton" <akpm@osdl.org>
In-Reply-To: <20060327162053.5d84ae59.akpm@osdl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <20060327161402.06eaa84b.rdunlap@xenotime.net>
	<20060327162053.5d84ae59.akpm@osdl.org>
Cc: dwmw2@infradead.org, "Randy.Dunlap" <rdunlap@xenotime.net>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MTD: m25p80: fix printk format warning
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3/27/06, Andrew Morton <akpm@osdl.org> wrote:
> "Randy.Dunlap" <rdunlap@xenotime.net> wrote:
> >
> > Fix printk format warning:
> > drivers/mtd/devices/m25p80.c:189: warning: format '%zd' expects type 's=
igned size_t', but argument 6 has type 'u_int32_t'
>
> Thanks, this is already fixed in one of the oft-sent, oft-ignored MTD
> patches in -mm.

They aren't ignored by everyone.  And I believe the maintainers are
planning on syncing in 2.6.17.

I try to at least Ack patches that look sane to me, but my opinion
doesn't count all that much.

josh
