Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pm5YW-0000CF-Kq
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2011 14:25:37 +0000
Received: by eyd9 with SMTP id 9so1798098eyd.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 06 Feb 2011 06:25:34 -0800 (PST)
Subject: Re: Testing a device using mtd_stresstest
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Peverley <pev@sketchymonkey.com>
In-Reply-To: <AANLkTikxCVO5Qs4amo1cCgnYVD3fYZdKh2in4e+X5EFV@mail.gmail.com>
References: <AANLkTikxCVO5Qs4amo1cCgnYVD3fYZdKh2in4e+X5EFV@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 06 Feb 2011 16:24:41 +0200
Message-ID: <1297002281.4460.6.camel@localhost>
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

Hi,

On Mon, 2011-01-31 at 12:12 +0000, David Peverley wrote:
> Question 1 : The  mtd_subpagetest (which I suspect should fail as the
> device doesn't support sub-pages). I googled around and found a
> reference that maybe I should add NAND_NO_SUBPAGE_WRITE to the
> options. I tried this and it made no difference. Out of curiosity I
> grepped through drivers/mtd and found that *no* drivers actully use
> this bit anyway...! Is it reasonable to ignore this or ought I address
> it? Should I set the flag and expect it to have an effect?

MTD code is currently broken and CONFIG_MTD_NAND_VERIFY_WRITE causes
errors when sub-pages are used. You should either disable this
configuration option or fix MTD. We have this in our FAQ:

http://www.linux-mtd.infradead.org/faq/ubi.html#L_subpage_verify_fail


> Question 2 : The mtd_stresstest test fails after anywhere between 1000
> and 200,000 operations. I'm certain this is a Bad Sign. It fails in
> nand_base.c:nand_write_page() in the verification step enabled by
> MTD_NAND_VERIFY_WRITE. When I tested this on our previous board (that
> ostensibly works fine) it failed the stress test after 2.6M operations
> instead. Should I be expecting to never see a failure of the stress
> test or is an occasional verify failure reasonably expected?

Yes, the test is expected to never fail. You should try to dig and
understand why is it failing and what is the reason.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
