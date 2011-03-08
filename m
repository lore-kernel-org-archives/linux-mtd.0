Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pwvh3-0001qS-HG
	for linux-mtd@lists.infradead.org; Tue, 08 Mar 2011 12:07:14 +0000
Received: by wwi17 with SMTP id 17so803867wwi.0
	for <linux-mtd@lists.infradead.org>;
	Tue, 08 Mar 2011 04:07:11 -0800 (PST)
Subject: Re: [PATCH] nandwrite: add only write oob option
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Lei Wen <leiwen@marvell.com>
In-Reply-To: <1299491086-27109-1-git-send-email-leiwen@marvell.com>
References: <1299491086-27109-1-git-send-email-leiwen@marvell.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 08 Mar 2011 14:05:45 +0200
Message-ID: <1299585945.2754.19.camel@localhost>
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

On Mon, 2011-03-07 at 01:44 -0800, Lei Wen wrote:
> Write only oob part goes different path in nand_base.c, it is better
> to have userland program so that we could easy debug this path when
> the write only oob fail like the mtd_oobtest in mtd_test suit.
> 
> Signed-off-by: Lei Wen <leiwen@marvell.com>

Pushed, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
