Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P463I-0004QI-4c
	for linux-mtd@lists.infradead.org; Fri, 08 Oct 2010 06:03:32 +0000
Received: by fxm15 with SMTP id 15so451532fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Oct 2010 23:03:30 -0700 (PDT)
Subject: Re: [PATCH] JFFS2: Dynamically choose inocache hash size
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Daniel Drake <dsd@laptop.org>
In-Reply-To: <20101007181402.982199D401B@zog.reactivated.net>
References: <20101007181402.982199D401B@zog.reactivated.net>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 08 Oct 2010 09:00:42 +0300
Message-ID: <1286517642.2095.29.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-10-07 at 19:14 +0100, Daniel Drake wrote:
> When JFFS2 is used for large volumes, the mount times are quite long.
> Increasing the hash size provides a significant speed boost on the OLPC
> XO-1 laptop.
> 
> Add logic that dynamically selects a hash size based on the size of
> the medium. A 64mb medium will result in a hash size of 128, and a 512mb
> medium will result in a hash size of 1024.
> 
> Signed-off-by: Daniel Drake <dsd@laptop.org>

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
