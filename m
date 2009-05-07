Received: from yx-out-1718.google.com ([74.125.44.157])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M23Ax-0000B6-PQ
	for linux-mtd@lists.infradead.org; Thu, 07 May 2009 12:58:18 +0000
Received: by yx-out-1718.google.com with SMTP id 6so467552yxn.72
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 May 2009 05:58:10 -0700 (PDT)
Date: Thu, 7 May 2009 08:57:23 -0400
From: Josh Boyer <jwboyer@gmail.com>
To: Corentin Chary <corentincj@iksaif.net>
Subject: Re: [PATCH 0/2] mkfs.ubifs and libubiio
Message-ID: <20090507125723.GA1932@yoda.jdub.homelinux.org>
References: <1241691709-17624-1-git-send-email-corentincj@iksaif.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1241691709-17624-1-git-send-email-corentincj@iksaif.net>
Cc: linux-mtd@lists.infradead.org, vapier.adi@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 07, 2009 at 12:21:47PM +0200, Corentin Chary wrote:
>These patchs will allow mkfs.ubifs to write the image directly
>on an UBI volume.
>libubiio adds a lot of code, but as it provide the same API the kernel
>does we may export it latter as a shared library.

Aside from mkfs.ubifs, are there other applications you envision using
libubiio as a library?

I ask because the code, as posted, is licensed under the GPL.  That
isn't really bad per se, but it does have implications for applications
that wish to link to it.

josh
