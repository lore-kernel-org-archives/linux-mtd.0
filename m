Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P07Op-0002Od-Pc
	for linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 06:41:20 +0000
Received: by bwz19 with SMTP id 19so4314771bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Sep 2010 23:41:18 -0700 (PDT)
Subject: Re: [PATCH 3/4 v2] mtd-utils: new strtoX helpers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1285394808-29795-1-git-send-email-vapier@gentoo.org>
References: <1285293221-25028-3-git-send-email-vapier@gentoo.org>
	<1285394808-29795-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 27 Sep 2010 09:39:30 +0300
Message-ID: <1285569570.16181.5.camel@localhost>
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

On Sat, 2010-09-25 at 02:06 -0400, Mike Frysinger wrote:
> Simply usage of converting strings to numbers by adding some wrappers
> around the standard strtoX functions.  These helpers support both hex
> and dec numbers transparently, and the caller need only provide a ptr
> to an error integer if they want to be notified of problems.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
> v2
> 	- drop redundant parsing logic
> 

Mike, so will you move this to common.h or you insist this should be a
separate header file?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
