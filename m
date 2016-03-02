Received: from mail-ob0-x22e.google.com ([2607:f8b0:4003:c01::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ab3x6-0000hb-PT
 for linux-mtd@lists.infradead.org; Wed, 02 Mar 2016 10:24:22 +0000
Received: by mail-ob0-x22e.google.com with SMTP id fz5so62169746obc.0
 for <linux-mtd@lists.infradead.org>; Wed, 02 Mar 2016 02:24:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1456911954-12929-1-git-send-email-alexander.stein@systec-electronic.com>
References: <1456911954-12929-1-git-send-email-alexander.stein@systec-electronic.com>
Date: Wed, 2 Mar 2016 11:23:59 +0100
Message-ID: <CAFLxGvzbrqmeepS_kK3KOun+x7XTTN=PL0WO_BH-VOVYXxJddw@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd: mtdram: Add parameter for setting writebuf size
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 2, 2016 at 10:45 AM, Alexander Stein
<alexander.stein@systec-electronic.com> wrote:
> ubifs uses the write buffer size in recovery algorithm. When inspecting
> an unclean ubifs recovery fails with writebuf size 64 in mtdram while
> recovery on actual mtd device with writebuf size of 1024 succeeds.
> So add a parameter for setting this property.

Can it be that you've tested an NAND image on mtdram?

-- 
Thanks,
//richard
