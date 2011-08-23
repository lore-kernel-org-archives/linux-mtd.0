Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QvkUb-0002jQ-TZ
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2011 06:29:47 +0000
Received: by gwb1 with SMTP id 1so4490869gwb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2011 23:29:43 -0700 (PDT)
Subject: Re: [PATCH 10/10] nanddump: kill usages of MEMSETOOBSEL ioctl
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 23 Aug 2011 09:31:32 +0300
In-Reply-To: <1313773676-12879-11-git-send-email-computersforpeace@gmail.com>
References: <1313773676-12879-1-git-send-email-computersforpeace@gmail.com>
	<1313773676-12879-11-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1314081097.2645.65.camel@sauron>
Mime-Version: 1.0
Cc: Kevin Cernekee <cernekee@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-08-19 at 10:07 -0700, Brian Norris wrote:
> The ioctl MEMSETOOBSEL hasn't existed for a long time. Using it as a
> backup to MTDFILEMODE is pointless, so just remove every time it is
> used.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Should we kill the macro definition from the kernel as well?

-- 
Best Regards,
Artem Bityutskiy
