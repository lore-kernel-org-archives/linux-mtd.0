Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lcatg-0000hd-Jt
	for linux-mtd@lists.infradead.org; Thu, 26 Feb 2009 07:43:11 +0000
Subject: Re: [PATCH] add generated binaries to gitignore
From: Artem Bityutskiy <dedekind@infradead.org>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1235605133-2059-1-git-send-email-vapier@gentoo.org>
References: <1235605133-2059-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 26 Feb 2009 09:42:47 +0200
Message-Id: <1235634167.25808.26.camel@localhost.localdomain>
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
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  .gitignore                     |   30 ++++++++++++++++++++++++++++++
>  mkfs.ubifs/.gitignore          |    1 +
>  ubi-utils/.gitignore           |    9 +++++++++
>  ubi-utils/new-utils/.gitignore |   10 ++++++++++
>  4 files changed, 50 insertions(+), 0 deletions(-)
>  create mode 100644 mkfs.ubifs/.gitignore
>  create mode 100644 ubi-utils/.gitignore
>  create mode 100644 ubi-utils/new-utils/.gitignore

Pushed, thank you!

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
