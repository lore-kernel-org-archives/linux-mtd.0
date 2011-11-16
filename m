Received: from mail-wy0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RQke6-0000cs-DT
 for linux-mtd@lists.infradead.org; Wed, 16 Nov 2011 18:55:43 +0000
Received: by wyh21 with SMTP id 21so1079702wyh.36
 for <linux-mtd@lists.infradead.org>; Wed, 16 Nov 2011 10:55:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1319044961-26745-1-git-send-email-computersforpeace@gmail.com>
References: <20110922111511.15615t65c0et2ban@mail.sapo.pt>
 <1319044961-26745-1-git-send-email-computersforpeace@gmail.com>
Date: Wed, 16 Nov 2011 10:55:39 -0800
Message-ID: <CAN8TOE9Fr_Gh=fK3+Je1Dv87chX2-cxqDPfvLgez-j7Z41uGyw@mail.gmail.com>
Subject: Re: flash_erase ERROR!
From: Brian Norris <computersforpeace@gmail.com>
To: dhlm83@sapo.pt
Content-Type: text/plain; charset=ISO-8859-1
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Domingos,

On Wed, Oct 19, 2011 at 10:22 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> P.S. It looks like your problem is pretty simple to fix. Try this patch
> out, and perhaps it can be integrated into mtd-utils to provide a small
> breath of support for 2.4.x in the "legacy" section of libmtd :)

Did you get to try out my patch? If it was useful, then we might add
it to the legacy support in mtd-utils; otherwise, I'll be dropping it
from my own consideration soon.

Brian
