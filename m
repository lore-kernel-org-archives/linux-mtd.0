Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sjjjm-0002kL-Os
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 04:20:19 +0000
Received: by wgbds1 with SMTP id ds1so422385wgb.18
 for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2012 21:20:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1340456602-46050-1-git-send-email-richard@nod.at>
References: <1340456602-46050-1-git-send-email-richard@nod.at>
Date: Wed, 27 Jun 2012 13:20:15 +0900
Message-ID: <CAKYAXd-3ArdssdotKHjvUU0f+yqcFC6y2rHF-mqnJnUcP=+eOg@mail.gmail.com>
Subject: Re: UBI fastmap updates
From: Namjae Jeon <linkinjeon@gmail.com>
To: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=UTF-8
Cc: nyoushchenko@mvista.com, artem.bityutskiy@linux.intel.com,
 linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 Heinz.Egger@linutronix.de, thomas.wucher@linutronix.de,
 linux-mtd@lists.infradead.org, shmulik.ladkani@gmail.com, tglx@linutronix.de,
 Marius.Mazarel@ugal.ro, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi. Richard.

Would you infom me how much UBI attach time is improved with fastmap ?

Thanks.

2012/6/23, Richard Weinberger <richard@nod.at>:
> This is the next round of UBI fastmap updates.
>
> The highlights are:
> 	- Fastmap produces anchor PEBs if none are available
> 	  (creating a fastmap on an image created by ubinize works now)
> 	- Fastmap is now able to reuse all PEBs if no empty PEBs are available
> 	- Minor fixes
>
> If you want to test fastmap you can use my git repo:
> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubi2.git ubi2/v13
>
> Enjoy!
> //richard
>
> [PATCH 1/7] UBI: Fastmap: Modify the WL sub-system to prodcue a free
> [PATCH 2/7] UBI: Fastmap: Fix WARN_ON()
> [PATCH 3/7] UBI: Fastmap: Ensure that not all anchor PEBs go into a
> [PATCH 4/7] UBI: Fastmap: Fix ubi_assert()
> [PATCH 5/7] UBI: Fastmap: Kill max_pnum logic
> [PATCH 6/7] UBI: Fastmap: Reuse all fastmap PEB if no free PEBs are
> [PATCH 7/7] UBI: Fastmap: Get rid of fm_pool_mutex
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>
