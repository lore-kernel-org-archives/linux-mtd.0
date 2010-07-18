Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OaOA3-0006bw-Dy
	for linux-mtd@lists.infradead.org; Sun, 18 Jul 2010 07:19:43 +0000
Received: by fxm3 with SMTP id 3so1931975fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 18 Jul 2010 00:19:42 -0700 (PDT)
Subject: Re: [PATCH 4/6] mtd-utils/mkfs.jffs2: fixed warnings
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <norris@broadcom.com>
In-Reply-To: <1278622209-20149-5-git-send-email-norris@broadcom.com>
References: <1278622209-20149-1-git-send-email-norris@broadcom.com>
	<1278622209-20149-5-git-send-email-norris@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 18 Jul 2010 10:19:40 +0300
Message-Id: <1279437580.16247.16.camel@localhost.localdomain>
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
> Changed "char*" to "const char*" in certain function argument lists
> to prevent compiler warnings for passing a hard-coded string.
> 
> Signed-off-by: Brian Norris <norris@broadcom.com>

Pushed, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
