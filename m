Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R3hr4-0004Li-Dd
	for linux-mtd@lists.infradead.org; Wed, 14 Sep 2011 05:17:50 +0000
Received: by bkat2 with SMTP id t2so1306411bka.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Sep 2011 22:17:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1314820839-7107-1-git-send-email-computersforpeace@gmail.com>
References: <1314820839-7107-1-git-send-email-computersforpeace@gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Wed, 14 Sep 2011 01:17:29 -0400
Message-ID: <CAMjpGUf0MOvDV3ZWk7b8e74LuALra6FGFeMNYYGwtLMdjLUoCA@mail.gmail.com>
Subject: Re: [PATCH 00/10] nandwrite: cleanup, support ioctl(MEMWRITE)
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: b35362@freescale.com, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 31, 2011 at 16:00, Brian Norris wrote:
> This patch series cleans up old features in nandwrite and supports new
> features with ioctl(MEMWRITE).

in general things look OK to me

(sorry for the delay, but i'm working on MTD stuff only in my random
spare time now unlike before)
-mike
