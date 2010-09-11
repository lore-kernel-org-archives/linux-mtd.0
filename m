Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OuJdQ-0000lH-Cy
	for linux-mtd@lists.infradead.org; Sat, 11 Sep 2010 06:32:25 +0000
Received: by bwz13 with SMTP id 13so3809159bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 10 Sep 2010 23:32:21 -0700 (PDT)
Subject: Re: linux equivalent of u-boot's "nand scrub" (erasing blocks even
	when OOB says "bad")
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <AANLkTikrEq1hJEttX=DkMWYaLsJnW+QWGRaL2eygZ8uZ@mail.gmail.com>
References: <AANLkTikrEq1hJEttX=DkMWYaLsJnW+QWGRaL2eygZ8uZ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 11 Sep 2010 09:32:17 +0300
Message-ID: <1284186737.1783.4.camel@brekeke>
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

On Fri, 2010-09-10 at 19:53 -0400, Mike Frysinger wrote:
> the logical thing in my mind would be to extend the userspace mtd abi
> to allow a "do the erase even if people think it's bad" option.
> perhaps MEMSCRUB ?

If you do this, please do not use this name. In UBI we already use term
'scrubbing' for the process when we move contents of eraseblock because
we have bit-flips.

It will be confusing if the same word is used in MTD for "unmarking"
eraseblocks. How about: 'force erase' or 'bad erase' ?

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
