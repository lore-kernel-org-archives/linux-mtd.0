Received: from nf-out-0910.google.com ([64.233.182.188])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LDOKN-0001H8-NA
	for linux-mtd@lists.infradead.org; Thu, 18 Dec 2008 19:14:32 +0000
Received: by nf-out-0910.google.com with SMTP id d21so81319nfb.22
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Dec 2008 11:12:59 -0800 (PST)
Date: Thu, 18 Dec 2008 14:12:35 -0500
From: Josh Boyer <jwboyer@gmail.com>
To: Sidney Amani <amani_s@epitech.net>
Subject: Re: [PATCH 1/2] Makefile export shared libraries
Message-ID: <20081218191235.GD18201@yoda.jdub.homelinux.org>
References: <52e42efe0812180616q28c10c72nae087e214c014676@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52e42efe0812180616q28c10c72nae087e214c014676@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 18, 2008 at 03:16:12PM +0100, Sidney Amani wrote:
>>From b557d3f22d16fc61788a85f5ec6cc02e0195c810 Mon Sep 17 00:00:00 2001
>From: Sidney Amani <amani_s@epitech.net>
>Date: Wed, 17 Dec 2008 12:46:42 +0100
>Subject: [PATCH] Makefile export shared libraries
>
>Export shared libraries. Other userspace tools might
>use them.
>
>Signed-off-by: Sidney Amani <amani_s@epitech.net>
>Signed-off-by: Corentin Chary <chary_c@epitech.net>

I don't see where you actually create a shared library here.  There
is no soname set, for example.  I'm not opposed to creating shared
libraries, but it should be done properly so that if the API/ABI
changes then we can bump the soname, etc.

josh
