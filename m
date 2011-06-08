Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUHIP-0002JQ-65
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 11:51:37 +0000
Received: by bwz1 with SMTP id 1so449224bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 04:51:33 -0700 (PDT)
Subject: Re: [PATCH v3] libmtd: add helper funcs for getting regioninfo and
	locked info
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1307461925-6420-1-git-send-email-vapier@gentoo.org>
References: <1307460482-3745-1-git-send-email-vapier@gentoo.org>
	<1307461925-6420-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Jun 2011 14:47:15 +0300
Message-ID: <1307533635.31223.63.camel@localhost>
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

On Tue, 2011-06-07 at 11:52 -0400, Mike Frysinger wrote:
> This extends the libmtd with the helper functions:
> 	mtd_regioninfo: interface to MEMGETREGIONINFO
> 	mtd_islocked: interface to MEMISLOCKED
> 
> Users of these functions will follow shortly ...
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
> v3
> 	- add a "islocked_supported" field to handle older kernels nicely

Umm, I meant a user-visible flag, so that the user could check it and
not even try to print the map. There does not seem to be much point
having this flag otherewise - we can just call the ioctl, and return
error if it fails, without printing any error message.

I'll stick with v2 of this patch, I think we better live without this
flag.


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
