Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PASav-0002Ww-Dx
	for linux-mtd@lists.infradead.org; Mon, 25 Oct 2010 19:20:34 +0000
Received: by fxm15 with SMTP id 15so2670858fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 Oct 2010 12:20:31 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] mtd-utils: nanddump: add 64-bit support,
	utilize libmtd
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1287645577-13538-3-git-send-email-computersforpeace@gmail.com>
References: <1287645577-13538-1-git-send-email-computersforpeace@gmail.com>
	<1287645577-13538-3-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 25 Oct 2010 22:20:27 +0300
Message-ID: <1288034427.1865.9.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-10-21 at 00:19 -0700, Brian Norris wrote:
> Adds support for 64-bit offsets (i.e., devices larger than 4GB).
> Utilizes the "unsigned long long" data type as the standard type
> for 64-bit offsets throughout. Reformats a few printf statements
> to avoid casting and to properly handle "long long."
> 
> Calls to ioctls are mostly replaced by libmtd interfaces (which should
> choose the proper ioctls for us); however, a few remain and probably
> should be handled with more robust interfaces, as some of these
> ioctls are considered "legacy."
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  nanddump.c |   83 +++++++++++++++++++++++++++++-------------------------------
>  1 files changed, 40 insertions(+), 43 deletions(-)

Pushed, thanks.

Mike, thanks for reviewing. You did not provide formal "Reviewed-by"
though, so I did not add this tag, assuming you did this for purposes,
because for other patches you provide ready to copy-paste tags.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
