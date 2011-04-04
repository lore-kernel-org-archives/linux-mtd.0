Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6l86-0003aO-GQ
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 14:51:50 +0000
Received: by wwb39 with SMTP id 39so4804963wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Apr 2011 07:51:44 -0700 (PDT)
Subject: Re: [PATCH 0/5] UBIFS: fix failure in dbg_check_space_info
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
In-Reply-To: <1301928297-2246-1-git-send-email-dedekind1@gmail.com>
References: <1301928297-2246-1-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 04 Apr 2011 17:49:13 +0300
Message-ID: <1301928553.2760.95.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Caizhiyong <caizhiyong@huawei.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-04-04 at 17:44 +0300, Artem Bityutskiy wrote:
> This patch has to fix the failure in 'dbg_check_space_info()' which
> I can reproduce myself with the 'integck' test and which has also been
> reported here:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2011-April/034647.html
> 
> The fix is in the last patch and it is quite trivial. It also describes
> the reason for the failure.
> 
> Patches 1-4 mostly improve the debugging output which helps to diagnose
> the problem quicker. So they are preparational patches.

Actually, I think this is bad arrangement. I'll re-arrange patches so
that the first patch is the fix, and then the debugging output
improvements. So you can pick only the fix, and I'll also send it to
-stable. I'll send you the fix shortly.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
