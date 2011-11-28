Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RV5Rm-0007Ll-Hh
 for linux-mtd@lists.infradead.org; Mon, 28 Nov 2011 17:56:55 +0000
Received: by wwf25 with SMTP id 25so1583022wwf.18
 for <linux-mtd@lists.infradead.org>; Mon, 28 Nov 2011 09:56:50 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1322132254-5830-1-git-send-email-j.weitzel@phytec.de>
References: <1322132254-5830-1-git-send-email-j.weitzel@phytec.de>
Date: Mon, 28 Nov 2011 09:56:50 -0800
Message-ID: <CAN8TOE-rh_yh_0hi+unXe3Q5zV9tdBW6rhomRG-h3za5A4ROrg@mail.gmail.com>
Subject: Re: [PATCH] nandtest: use seed argument
From: Brian Norris <computersforpeace@gmail.com>
To: Jan Weitzel <j.weitzel@phytec.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 24, 2011 at 2:57 AM, Jan Weitzel <j.weitzel@phytec.de> wrote:
> if a seed is provided it is actually not used. First call is
> "seed = rand()" killing the given seed.
>
> Signed-off-by: Jan Weitzel <j.weitzel@phytec.de>

Tested-by: Brian Norris <computersforpeace@gmail.com>

You might also note that when a seed isn't provided, nandtest does not
produce random results because it just uses the default seed. At least
for my system, I see the same results every execution; I believe this
is the general C rand() behavior. I'll send a follow-up patch that
actually utilizes <time.h> to use time as a random seed.

Brian
