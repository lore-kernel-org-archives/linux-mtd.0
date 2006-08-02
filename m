Received: from ug-out-1314.google.com ([66.249.92.173])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G8ETF-0005EQ-R4
	for linux-mtd@lists.infradead.org; Wed, 02 Aug 2006 07:01:10 -0400
Received: by ug-out-1314.google.com with SMTP id u40so1806101ugc
	for <linux-mtd@lists.infradead.org>;
	Wed, 02 Aug 2006 04:00:57 -0700 (PDT)
Message-ID: <625fc13d0608020400w307e5e77s40f4aa604c0e4395@mail.gmail.com>
Date: Wed, 2 Aug 2006 06:00:57 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: dbyron@hheld.com
Subject: Re: autoconf for mtd-utils
In-Reply-To: <000001c6b5a0$3a0a5bb0$c834800a@RudiDell>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <000001c6b5a0$3a0a5bb0$c834800a@RudiDell>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 8/1/06, David Byron <dbyron@hheld.com> wrote:
> On Mon, 2006-07-31 at 5:50p, Josh Boyer wrote:
>
> > Better.  But it only defines BUILDDIR during a cross compile.  Is that
> > what you wanted?  Or did you want a general purpose way to separate
> > the object and binary files from the source during build time?
>
> I do define BUILDDIR for native builds too, but to the current directory.
> The important thing for me is that native objects live in a different place
> than cross-compiled objects.  Where they are relative to the source isn't
> important to me at the moment.

This looks OK to me.  dwmw2, do you have any issues with this?

josh
