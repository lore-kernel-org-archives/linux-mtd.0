Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oz41S-0002tJ-Jj
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 08:52:51 +0000
Received: by bwz19 with SMTP id 19so2490934bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Sep 2010 01:52:49 -0700 (PDT)
Subject: Re: [PATCH] mkfs.ubifs: Fix --squash-rino-perm / --nosquash-rino-perm
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <1a602213cef25044c025cc1aaf873cf5@localhost>
References: <1a602213cef25044c025cc1aaf873cf5@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 24 Sep 2010 11:51:07 +0300
Message-ID: <1285318267.29268.164.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-09-23 at 15:58 -0700, Kevin Cernekee wrote:
> This addresses a couple of issues:
> 
> 1) Code was only allowing these options if --root was NOT specified (the
> opposite of the documented usage)
> 
> 2) -q / -Q short options did not work
> 
> 3) Spacing fixes in the error/warning strings
> 
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
> ---
>  mkfs.ubifs/mkfs.ubifs.c |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)

Oh, yeah, thanks, pushed!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
