Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ay7ZE-0004CP-W0
 for linux-mtd@lists.infradead.org; Thu, 05 May 2016 00:55:01 +0000
Received: by mail-pa0-x236.google.com with SMTP id iv1so29718454pac.2
 for <linux-mtd@lists.infradead.org>; Wed, 04 May 2016 17:54:40 -0700 (PDT)
Date: Wed, 4 May 2016 17:54:36 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: m25p80: add message if mmap flash read is supported
Message-ID: <20160505005436.GA122798@google.com>
References: <9111b023-d1e5-3084-4320-acf727e828f4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9111b023-d1e5-3084-4320-acf727e828f4@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(moving linux-spi to BCC, since this is MTD-only, and doesn't concern
the SPI core)

On Wed, Apr 27, 2016 at 10:36:48PM +0200, Heiner Kallweit wrote:
> As a follow-up to commit 08922f644878c9 "mtd: devices: m25p80: add support for
> mmap read request" add an info to syslog if mmap flash read is supported for a
> device.

Any particular reason you want this to be printed? There are quite a few
other features we don't print to the log right now.

Brian
