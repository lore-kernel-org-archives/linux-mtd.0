Received: from mail-yx0-f202.google.com ([209.85.210.202])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N2WVH-0006Ps-Ur
	for linux-mtd@lists.infradead.org; Mon, 26 Oct 2009 20:49:28 +0000
Received: by yxe40 with SMTP id 40so3116287yxe.28
	for <linux-mtd@lists.infradead.org>;
	Mon, 26 Oct 2009 13:49:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1256561500-8036-1-git-send-email-anemo@mba.ocn.ne.jp>
References: <1256561500-8036-1-git-send-email-anemo@mba.ocn.ne.jp>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 26 Oct 2009 16:49:01 -0400
Message-ID: <8bd0f97a0910261349i36b89b52k968faef04d5ab428@mail.gmail.com>
Subject: Re: [PATCH] mtd/maps: Fix accidental removal in Makefile
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Content-Type: text/plain; charset=UTF-8
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 26, 2009 at 08:51, Atsushi Nemoto wrote:
> The commit d79c326 ("gpio-addr-flash: new driver for GPIO assisted
> flash addressing") removed two lines from the Makefile by accident.
> Though I'm not sure how this accident happened, this patch reverts the
> removal.

i know i got a conflict every time i cherry picked this forward, but i
guess i must have screwed up the merge in the version that was
actually merged.  sorry about that.
-mike
