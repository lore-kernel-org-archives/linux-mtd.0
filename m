Received: from dnvwsmailout1.mcafee.com ([161.69.31.173])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SrjZR-00068H-Ia
 for linux-mtd@lists.infradead.org; Thu, 19 Jul 2012 05:46:45 +0000
Message-ID: <50079EC6.8050906@snapgear.com>
Date: Thu, 19 Jul 2012 15:44:38 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH 1/2] mtd: fix wrong usage of ioremap_nocache() in uclinux.c
 map driver
References: <1336632929-26100-1-git-send-email-gerg@snapgear.com>
 <1342613542.7530.21.camel@brekeke>
In-Reply-To: <1342613542.7530.21.camel@brekeke>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, uclinux-dev@uclinux.org,
 Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On 18/07/12 22:12, Artem Bityutskiy wrote:
> On Thu, 2012-05-10 at 16:55 +1000, gerg@snapgear.com wrote:
>> From: Greg Ungerer <gerg@uclinux.org>
>
> Hi Greg, I had these 2 patches in my l2-mtd.git tree, but dwmw2 decided
> to not pick them, so I dropped them as well. Please, re-send new
> versions, thanks!

Ok, done.

Regards
Greg

------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
