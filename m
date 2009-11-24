Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NCwWt-0008U0-CA
	for linux-mtd@lists.infradead.org; Tue, 24 Nov 2009 14:38:12 +0000
Subject: Re: [PATCH] enable erase-suspend-program for CFI cmdset_0002
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
In-Reply-To: <200911191101.nAJB1wwH000784@linpc062.aimsys.nl>
References: <200911191101.nAJB1wwH000784@linpc062.aimsys.nl>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 Nov 2009 16:36:46 +0200
Message-Id: <1259073406.29118.17.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: nico@cam.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-11-19 at 12:01 +0100, Norbert van Bolhuis wrote:
> erase-suspend for writing is required to avoid blocking applications that wish
> to write some data (to a NOR block other than the one being erased).
> Particularly, it solves some huge delays that an application (which writes to a
> UBIFS) will experience if UBI attaches to empty NOR flash. In this case the
> UBI background thread will erase a lot of blocks and the application can be blocked
> for minutes because of the "MTD/CFI chip lock".
> This feature has been disabled for years. Maybe this was because the old code
> turned it on for erase-suspend read-only chips also (cfip->EraseSuspend & 0x1).
> This is wrong and corrected now.
> I tested this patch and it seems to work fine.
> 
> Signed-off-by: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>

I did not follow the patch conversation too closely - but should you be
the patch author or Joakim? If you took it as it is - then it is Joakim.
If you modified it, then at least Joakim's name should be in the commit
log.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
