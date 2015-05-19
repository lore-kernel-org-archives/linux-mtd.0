Received: from mail-la0-x229.google.com ([2a00:1450:4010:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YudmC-0007mg-T2
 for linux-mtd@lists.infradead.org; Tue, 19 May 2015 09:25:29 +0000
Received: by laat2 with SMTP id t2so13953222laa.1
 for <linux-mtd@lists.infradead.org>; Tue, 19 May 2015 02:25:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5b9c6106e355c0a676481e1de95ad15c@joe.dyn.spornkuller.de>
References: <5b9c6106e355c0a676481e1de95ad15c@joe.dyn.spornkuller.de>
Date: Tue, 19 May 2015 11:17:21 +0200
Message-ID: <CAD=nrE9re5JYB_nhxiK198VbPGk=ASLuMdOQq-4w=M0WK1maGg@mail.gmail.com>
Subject: Re: Wear-leveling peculiarities
From: "valent.turkovic@gmail.com" <valent.turkovic@gmail.com>
To: Johannes Bauer <weolanwaybqm@spornkuller.de>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 18 May 2015 at 15:53, Johannes Bauer <weolanwaybqm@spornkuller.de> wrote:
> Hello list,
> The units have been deployed for three years now. Recently, we've been
> seeing units fail more often. This warranted some investigation. I pulled dd
> images of the relevant /dev/mtd device (mtd4 in my case) and wrote a small
> Python script that evaluated the UBIFS LEB headers, in particular the erase
> count. I expected to see a uniform distribution of erases all around the
> flash.

Can you please share your python script, it would probably be helpful
to other people as well.
Thanks.
