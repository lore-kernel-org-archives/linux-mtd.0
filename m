Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qehr8-00058l-TJ
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2011 06:14:35 +0000
Received: by pzk28 with SMTP id 28so678365pzk.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Jul 2011 23:14:31 -0700 (PDT)
Subject: Re: [PATCH] UBIFS: fix master node recovery
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
Date: Thu, 07 Jul 2011 09:15:33 +0300
In-Reply-To: <1309944626-30195-1-git-send-email-agust@denx.de>
References: <1309944626-30195-1-git-send-email-agust@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1310019338.3149.97.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Detlev Zundel <dzu@denx.de>,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Anatolij,

On Wed, 2011-07-06 at 11:30 +0200, Anatolij Gustschin wrote:
> When the 1st LEB was unmapped and written but 2nd LEB not,
> the master node recovery doesn't succeed after power cut.
> We see following error when mounting UBIFS partition on NOR
> flash:
> 
> UBIFS error (pid 1137): ubifs_recover_master_node: failed to recover master node

Could you please provide some numbers - when this error happens, what is
offs2, sz, and c->leb_size when this error happens?

Frankly, I do not understand this change so far...

-- 
Best Regards,
Artem Bityutskiy
