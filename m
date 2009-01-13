Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LMfFA-0004Yz-FH
	for linux-mtd@lists.infradead.org; Tue, 13 Jan 2009 09:07:31 +0000
Subject: Re: [PATCH] ubi-utils: fix warning in fprintf() code
From: Artem Bityutskiy <dedekind@infradead.org>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1231776487-21240-1-git-send-email-vapier@gentoo.org>
References: <1231776487-21240-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 13 Jan 2009 11:07:29 +0200
Message-Id: <1231837649.5973.12.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-01-12 at 11:08 -0500, Mike Frysinger wrote:
> When building with gcc security warnings enabled, the ubimirror.c code
> triggers this warning:
> ./src/ubimirror.c: In function 'main':
> ./src/ubimirror.c:206: error: format not a string literal and no format arguments
> 
> Since the buffer in question should be a straight string anyways, avoid
> ugly printf exploits by outputting the string indirectly:
> 	printf("%s", buffer)
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Both patches are applied, thank you!

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
