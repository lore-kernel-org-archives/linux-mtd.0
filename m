Received: from nz-out-0102.google.com ([64.233.162.203])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1Fc7EW-00056b-M3
	for linux-mtd@lists.infradead.org; Fri, 05 May 2006 16:49:06 -0400
Received: by nz-out-0102.google.com with SMTP id z6so775910nzd
	for <linux-mtd@lists.infradead.org>;
	Fri, 05 May 2006 13:48:58 -0700 (PDT)
Message-ID: <c0c067900605051348u5f7edf0esd23ff0ced74f904e@mail.gmail.com>
Date: Fri, 5 May 2006 16:48:58 -0400
From: "Dan Merillat" <harik.attar@gmail.com>
To: "David Vrabel" <dvrabel@arcom.com>
In-Reply-To: <445B0CF1.8020400@arcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <c0c067900605031926w730bc9a3sed5c7eee03585b2b@mail.gmail.com>
	<445B0CF1.8020400@arcom.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: CFI Extended (Intel P30) problems on an ARM PXA255
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/5/06, David Vrabel <dvrabel@arcom.com> wrote:
>
> Perhaps the cache invalidating operation in the MTD map driver you're
> using is wrong?

Ouch, it doesn't appear to have a map->inval_cache member.  I'm going
to copy the one from pxa25x-flash.c and see if that fixes it, however,
how could this work with an intel J3 part, but not an intel P30 part?
Same kernel exactly, booting back and forth.  It should either work
for both, or fail for both.

> If you suspect memory timings may be an issue I would advise slowing the
> timings under Linux to the lowest possible.  The experiment you describe
> here changes two variables (the software and the timings) which is not
> good practice.

I changed one variable.   I changed u-boot to use linux's memory
timings, and the problem did not manifest.  I would then conclude that
memory timing in and of itself is not the problem.
