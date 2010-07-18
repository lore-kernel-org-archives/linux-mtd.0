Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OaOE0-0005bB-Uu
	for linux-mtd@lists.infradead.org; Sun, 18 Jul 2010 07:23:49 +0000
Received: by fxm3 with SMTP id 3so1932817fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 18 Jul 2010 00:23:42 -0700 (PDT)
Subject: Re: [PATCH 6/6] mtd-utils/nanddump.c: Add "forcebinary" flag
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <norris@broadcom.com>
In-Reply-To: <1278622209-20149-7-git-send-email-norris@broadcom.com>
References: <1278622209-20149-1-git-send-email-norris@broadcom.com>
	<1278622209-20149-7-git-send-email-norris@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 18 Jul 2010 10:23:39 +0300
Message-Id: <1279437819.16247.19.camel@localhost.localdomain>
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
> Restrict binary dumping so that by default, binary garbage is not
> printed directly to a terminal. Output redicted to files or piped to
> other commands should not be affected (as judged by "isatty(ofd)").
> A new flag "-a" or "--forcebinary" is included so that users can
> override this behavior if necessary.
> 
> Signed-off-by: Brian Norris <norris@broadcom.com>

Could you pleas make hexdump independent (make the ascii switch to be
the function argument, not a global knob), and re-send the nanddump
patches? I did not push patches 2, 3, 6, but pushed the rest of the
patches.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
