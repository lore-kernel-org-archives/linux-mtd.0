Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ld5ni-00072K-1Z
	for linux-mtd@lists.infradead.org; Fri, 27 Feb 2009 16:43:05 +0000
Subject: Re: [PATCH v2] make sure compiler supports warning flags
From: Artem Bityutskiy <dedekind@infradead.org>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1235637006-28538-1-git-send-email-vapier@gentoo.org>
References: <8bd0f97a0902260028q1df6c376ta6537f83f2407f02@mail.gmail.com>
	<1235637006-28538-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 27 Feb 2009 18:42:33 +0200
Message-Id: <1235752953.4261.24.camel@localhost.localdomain>
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

On Thu, 2009-02-26 at 03:30 -0500, Mike Frysinger wrote:
> Some compilers (like gcc-3.3) don't support all the newer -W flags that we
> are using.  So import the compiler check found in the kernel and test each
> flag we add.  The := is important so we only do the compiler tests once
> per `make` rather than every time we compile a file.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed, thanks!

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
