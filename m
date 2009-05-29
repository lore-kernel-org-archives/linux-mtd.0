Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M9ywl-0000ZN-2V
	for linux-mtd@lists.infradead.org; Fri, 29 May 2009 10:04:25 +0000
Subject: Re: UBIFS: "sync" mount option does not work
From: Artem Bityutskiy <dedekind@infradead.org>
To: =?ISO-8859-1?Q?Aur=E9lien_G=C9R=D4ME?= <ag@debian.org>
In-Reply-To: <1243591249.11172.106.camel@localhost.localdomain>
References: <20090528170621.GJ18372@roxor.cx>
	<1243591249.11172.106.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 29 May 2009 13:03:47 +0300
Message-Id: <1243591427.11172.108.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-mtd@lists.infradead.org, Adrian.Hunter@nokia.com
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-05-29 at 13:00 +0300, Artem Bityutskiy wrote:
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Subject: [PATCH] UBIFS: allow sync option in rootflags
> MIME-Version: 1.0
> Content-Type: text/plain; charset=utf-8
> Content-Transfer-Encoding: 8bit
> 
> When passing UBIFS parameters via kernel command line, the
> sync option will be passed to UBIFS as a string, not as an
> MS_SYNCHRONOUS flag. Teach UBIFS interpreting this flag.
> 
> Reported-by: Aurélien GÉRÔME <ag@debian.org>
> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> ---
>  fs/ubifs/super.c |   40 +++++++++++++++++++++++++++++++++++-----
>  1 files changed, 35 insertions(+), 5 deletions(-)

Please, use this patch as a band-aid so far. Not sure it'll
land upstream in this form.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
