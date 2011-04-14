Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QALWb-0004gu-Vo
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2011 12:19:55 +0000
Received: by ewy3 with SMTP id 3so504929ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Apr 2011 05:19:51 -0700 (PDT)
Subject: Re: [PATCH 1/2] nand: Fix S3C NAND clock stop
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jiri Pinkava <jiri.pinkava@vscht.cz>
In-Reply-To: <1302688771-17252-1-git-send-email-jiri.pinkava@vscht.cz>
References: <1302665784.14691.5.camel@koala>
	<1302688771-17252-1-git-send-email-jiri.pinkava@vscht.cz>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 14 Apr 2011 15:16:56 +0300
Message-ID: <1302783416.2796.23.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	ben-linux@fluff.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-04-13 at 11:59 +0200, Jiri Pinkava wrote:
> Current implementation of s3c2410_nand_select_chip call
> clk_disable every time when chip = -1 (de-select). This happend
> multiple times even if chip was already de-selected. This causes
> disabling clock even if they are already disabled and due to
> nature of clock subsytem implementation this causes nand clock
> to be disabled and newer enabled again.
> 
> Signed-off-by: Jiri Pinkava <jiri.pinkava@vscht.cz>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
