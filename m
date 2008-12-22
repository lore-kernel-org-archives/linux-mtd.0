Received: from wf-out-1314.google.com ([209.85.200.169])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LEeba-0004n1-3I
	for linux-mtd@lists.infradead.org; Mon, 22 Dec 2008 06:49:30 +0000
Received: by wf-out-1314.google.com with SMTP id 28so1967400wfc.24
	for <linux-mtd@lists.infradead.org>;
	Sun, 21 Dec 2008 22:49:28 -0800 (PST)
Message-ID: <8bd0f97a0812212249k47eb5949x1931022de14030b8@mail.gmail.com>
Date: Mon, 22 Dec 2008 01:49:28 -0500
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: dedekind@infradead.org
Subject: Re: [PATCH v2] unify all common build system parts
In-Reply-To: <1229928143.2756.26.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1229634318-12997-1-git-send-email-vapier@gentoo.org>
	<1229928143.2756.26.camel@sauron>
Cc: linux-mtd@lists.infradead.org, Mike Frysinger <vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 22, 2008 at 01:42, Artem Bityutskiy wrote:
> On Thu, 2008-12-18 at 16:05 -0500, Mike Frysinger wrote:
>> Rather than duplicating the same thing over and over in every Makefile,
>> move it all to common.mk.
>>
>> Other things fixed here:
>>  - doing subdirs in parallel
>>  - fix src!=build compiling in subdirs
>
> Thanks, tested, pushed.

thanks a lot.  feel free to send complaints my way wrt the build
system in case i broke something or you want assistance :).
-mike
