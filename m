Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OaO7d-0001u4-G7
	for linux-mtd@lists.infradead.org; Sun, 18 Jul 2010 07:17:14 +0000
Received: by fxm3 with SMTP id 3so1931532fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 18 Jul 2010 00:17:11 -0700 (PDT)
Subject: Re: [PATCH 1/6] mtd-utils/nanddump.c: Increase max OOB size
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <norris@broadcom.com>
In-Reply-To: <1278622209-20149-2-git-send-email-norris@broadcom.com>
References: <1278622209-20149-1-git-send-email-norris@broadcom.com>
	<1278622209-20149-2-git-send-email-norris@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 18 Jul 2010 10:17:08 +0300
Message-Id: <1279437428.16247.13.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-07-08 at 13:50 -0700, Brian Norris wrote:
> Supported OOB and page sizes can now be changed more easily by a
> macro constant. NAND_MAX_OOBSIZE needed increased to support 218
> and 224 byte OOB.
> 
> Signed-off-by: Brian Norris <norris@broadcom.com>

Pushed to mtd-utils.git

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
