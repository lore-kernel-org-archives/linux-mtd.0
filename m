Received: from yx-out-1718.google.com ([74.125.44.158])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LDPN0-0007pD-2E
	for linux-mtd@lists.infradead.org; Thu, 18 Dec 2008 20:21:18 +0000
Received: by yx-out-1718.google.com with SMTP id 3so254611yxi.72
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Dec 2008 12:21:17 -0800 (PST)
Message-ID: <8bd0f97a0812181221u2d17c2ectee16202b42c5a4fe@mail.gmail.com>
Date: Thu, 18 Dec 2008 15:21:16 -0500
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: dedekind@infradead.org
Subject: Re: [PATCH] unify all common build system parts
In-Reply-To: <1229066345.13686.413.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1228944506-5792-1-git-send-email-vapier@gentoo.org>
	<1229066345.13686.413.camel@sauron>
Cc: linux-mtd@lists.infradead.org, Mike Frysinger <vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 12, 2008 at 02:19, Artem Bityutskiy wrote:
> On Wed, 2008-12-10 at 16:28 -0500, Mike Frysinger wrote:
>> Rather than duplicating the same thing over and over in every Makefile, move
>> it all to common.mk.
>>
>> Other things fixed here:
>>  - doing subdirs in parallel
>>  - fix src!=build compiling in subdirs
>>
>> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
>
> I've tried do test your patch and found an issue.
>
> $ make
> ... build is ok ...
> $ make install DESTDIR=/home/dedekind/tmp/
> ... error ...
>
> Could you please take a look at this?

looks like i forgot to delete the two make's in the toplevel install
... the recursive dir part is taken care of common.mk now
-mike
