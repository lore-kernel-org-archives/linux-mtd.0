Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LcauM-0000iV-Kn
	for linux-mtd@lists.infradead.org; Thu, 26 Feb 2009 07:43:53 +0000
Subject: Re: [PATCH] make sure compiler supports warning flags
From: Artem Bityutskiy <dedekind@infradead.org>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1235605127-2024-1-git-send-email-vapier@gentoo.org>
References: <1235605127-2024-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 26 Feb 2009 09:43:36 +0200
Message-Id: <1235634216.25808.27.camel@localhost.localdomain>
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

On Wed, 2009-02-25 at 18:38 -0500, Mike Frysinger wrote:
> Some compilers (like gcc-3.3) don't support all the newer -W flags that we
> are using.  So import the compiler check found in the kernel and test each
> flag we add.  The := is important so we only do the compiler tests once
> per `make` rather than every time we compile a file.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Looks fine for me, but I cannot really review this, so lets wait a
little, and if there are no complaints I'll push it. Thanks!

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
