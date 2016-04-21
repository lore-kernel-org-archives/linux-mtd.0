Received: from mail-yw0-x235.google.com ([2607:f8b0:4002:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1at47l-0004R7-5t
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2016 02:13:45 +0000
Received: by mail-yw0-x235.google.com with SMTP id g133so65885771ywb.2
 for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2016 19:13:24 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 20 Apr 2016 22:13:23 -0400
Message-ID: <CACfi_Z1cX47-BVAfQkkoKXsdrjSHU0V95pCBAaSWHm0=T7TZJA@mail.gmail.com>
Subject: how to view mapping between a given ubifs volume, its set of LEBs,
 and its corresponding set of PEBS
From: Davis Roman <davis.roman84@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

I'm trying to understand the mapping between a ubifs volume and the
set of LEBs that get mapped to it.

More so, I'd like to also understand the mapping between a given LEB
and its designated PEB.

Although the mapping between LEBs and PEBs can change during runtime,
I figure that there should be a way to see this mapping via the
command line.

Does such a method exist ?

I've looked high and low though the mtd tools and I haven't been able
to find a way to do this.

Thank you,

Davis
