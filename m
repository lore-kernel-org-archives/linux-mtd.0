Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OG4Uj-0006gZ-KK
	for linux-mtd@lists.infradead.org; Sun, 23 May 2010 06:17:06 +0000
Received: by fxm15 with SMTP id 15so1868055fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 22 May 2010 23:17:03 -0700 (PDT)
Subject: Re: [PATCH] UBI: fix delete compatible internal volume scan
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brijesh Singh <brijesh.s.singh@gmail.com>
In-Reply-To: <AANLkTimuYmRDCZCkoB9YHifngCwjp9_B2ucFQ1seaiM9@mail.gmail.com>
References: <AANLkTimuYmRDCZCkoB9YHifngCwjp9_B2ucFQ1seaiM9@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 23 May 2010 09:16:57 +0300
Message-Id: <1274595417.8881.36.camel@localhost.localdomain>
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

On Tue, 2010-05-18 at 23:10 +0530, Brijesh Singh wrote:
> This patch resolves a possible bug. Scan is adding delete compatible
> blocks to both corr list and used list.
> It should return after adding the block to corr list.
> 
> Signed-off-by: Brijesh Singh <brijesh.s.singh@gmail.com>

I'm not sure this patch is enough. I think we should add a 'compat' flag
to the 'struct ubi_mkvol_req' structure, to make it possible to create
volumes with different compatibility flags. Then we need to write a test
and add it to the UBI test-suite at 'mtd-utils/tests/ubi-tests/'.

Then once we have tested and fixed this, we should merge this and also
send to the '-stable' trees.

I remember I did give the compat option a test, but probably not that
good.

I'll try to do what I've described as soon as I have time, but you guys
could do this as well, if you have bandwidth.
 
-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
