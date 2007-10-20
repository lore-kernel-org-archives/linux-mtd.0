Received: from py-out-1112.google.com ([64.233.166.183])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IjHWJ-0006cp-H9
	for linux-mtd@lists.infradead.org; Sat, 20 Oct 2007 17:49:53 +0100
Received: by py-out-1112.google.com with SMTP id a25so1586799pyi
	for <linux-mtd@lists.infradead.org>;
	Sat, 20 Oct 2007 09:49:31 -0700 (PDT)
Message-ID: <f383264b0710200949w7598535fjb27f83c915b50805@mail.gmail.com>
Date: Sat, 20 Oct 2007 09:49:30 -0700
From: "Matt Reimer" <mattjreimer@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD: make s3c2410's correct_data indicate an error for
	multi-bit read errors
In-Reply-To: <1192898687-12818-1-git-send-email-mattjreimer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1192898687-12818-1-git-send-email-mattjreimer@gmail.com>
Cc: Matt Reimer <mreimer@vpop.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/20/07, Matt Reimer <mattjreimer@gmail.com> wrote:
> From: Matt Reimer <mreimer@vpop.net>
>
> If there were multiple bit errors in the data s3c2410_nand_correct_data()
> was returning 0 (no error) instead of -1, so the upper layers (like JFFS2)
> would not know the data is corrupt.

Grr, ignore this patch, as I forget to amend the commit message. The
next one should get it right.

Matt
