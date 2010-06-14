Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OO0zQ-0002Hu-7a
	for linux-mtd@lists.infradead.org; Mon, 14 Jun 2010 04:09:37 +0000
Subject: RE: [PATCH 1/2] mtd: OneNAND: Add runtime badblock check feature
From: Artem Bityutskiy <dedekind1@gmail.com>
To: kyungmin.park@samsung.com
In-Reply-To: <012f01cb0b4e$db1a7550$914f5ff0$%park@samsung.com>
References: <1275380256-15315-1-git-send-email-jy0922.shim@samsung.com>
	<1276421200.19028.192.camel@localhost>
	<012f01cb0b4e$db1a7550$914f5ff0$%park@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Jun 2010 07:07:00 +0300
Message-ID: <1276488420.19028.229.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: 'Thomas Gleixner' <tglx@linutronix.de>, linux-mtd@lists.infradead.org,
	'Joonyoung Shim' <jy0922.shim@samsung.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-06-14 at 08:19 +0900, Kyungmin Park wrote:
> > Also, if you really want this, it should be rather lazy checking, where
> > you read OOB on demand, and then save this information to the in-ram
> > BBT, and when you get another ->block_isbad() for a block which was
> > previously checked, you do not read OOB for the second time.
> 
> It's based on BBT already. Now I set the BBT values as 0x2 and then
> check it at runtime and then mark it 0 for good, 3 for bad block.

I meant why you are optimizing the in-ram BBT instead of just keeping
and maintaining the BBT on the flash media?

> Right, it's same word lazy checking and runtime check.

I think you should rename it. "Runtime" is not descriptive, because even
without your patch the BBT is built "runtime". But "lazy" BBT creation
is quite descriptive.

> The original ideas are from UBI scan it read all blocks again at probe.
> I just scan almost block read once at ubi scan.

Right. So I asked why not to just have the BBT on flash?

Also, I doubt we need yet another config option and chip option - why
not to make lazy BBT just to be the default?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
