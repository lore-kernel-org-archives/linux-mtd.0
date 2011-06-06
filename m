Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTapl-0006gh-Hq
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 14:31:14 +0000
Received: by fxm14 with SMTP id 14so3602854fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 07:31:10 -0700 (PDT)
Subject: Re: [PATCH 2/2] mtd: nand: multi-line comment style fixups
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1306360741-12770-2-git-send-email-computersforpeace@gmail.com>
References: <1306360741-12770-1-git-send-email-computersforpeace@gmail.com>
	<1306360741-12770-2-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 17:26:52 +0300
Message-ID: <1307370412.3112.74.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Brian Norris <norris@broadcom.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-05-25 at 14:59 -0700, Brian Norris wrote:
> From: Brian Norris <norris@broadcom.com>
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

I kind of rejected the first patch in this series, but forgot about this
one. I've now pushed it to the l2 tree with additional comments
clean-ups from me - just did them while looking at your patch and to the
code, and accidentally used git commit --amend, so they were merged with
yours. But this should not be a big deal - we ended up with one big
comments cleanup patch.

Thanks - it is in the l2-mtd-2.6.git now.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
