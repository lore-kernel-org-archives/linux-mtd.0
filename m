Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUGlW-0000xY-Bv
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 11:17:38 +0000
Received: by fxm14 with SMTP id 14so315144fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 04:17:35 -0700 (PDT)
Subject: Re: [PATCH v2] ubi-utils: send help/version info to stdout
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1307458922-1082-1-git-send-email-vapier@gentoo.org>
References: <1307427548-29306-2-git-send-email-vapier@gentoo.org>
	<1307458922-1082-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Jun 2011 14:13:18 +0300
Message-ID: <1307531598.31223.50.camel@localhost>
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

On Tue, 2011-06-07 at 11:02 -0400, Mike Frysinger wrote:
> Usage/version information should go to stdout when it is expected behavior
> (i.e. the user requested it explicitly).  This info should go to stderr
> only when the usage info is being shown as a result of incorrect options.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed to mtd-utils, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
