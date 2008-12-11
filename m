Received: from rv-out-0708.google.com ([209.85.198.242])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LAhaj-0003Wt-4g
	for linux-mtd@lists.infradead.org; Thu, 11 Dec 2008 09:12:17 +0000
Received: by rv-out-0708.google.com with SMTP id b17so826004rvf.42
	for <linux-mtd@lists.infradead.org>;
	Thu, 11 Dec 2008 01:12:15 -0800 (PST)
Message-ID: <8bd0f97a0812110112u3e36fbfer7b479992afce2f89@mail.gmail.com>
Date: Thu, 11 Dec 2008 04:12:15 -0500
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: dedekind@infradead.org
Subject: Re: [PATCH] unify all common build system parts
In-Reply-To: <1228976097.13686.373.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1228944506-5792-1-git-send-email-vapier@gentoo.org>
	<1228976097.13686.373.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 11, 2008 at 01:14, Artem Bityutskiy wrote:
> On Wed, 2008-12-10 at 16:28 -0500, Mike Frysinger wrote:
>> Rather than duplicating the same thing over and over in every Makefile, move
>> it all to common.mk.
>>
>> Other things fixed here:
>>  - doing subdirs in parallel
>>  - fix src!=build compiling in subdirs
>
> I'm sorry, but frankly, I am very bad in Makefile stuff, so I cannot
> really review your patch. So let's hope other people do this and wait a
> little. If they do not, I'll try to do what I can later.

if there's any questions/insights i can help with, feel free to ask
... the out-of-tree building has been a big hassle for me ...
-mike
