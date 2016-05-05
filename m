Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayLCp-0004fZ-F1
 for linux-mtd@lists.infradead.org; Thu, 05 May 2016 15:28:47 +0000
Received: by mail-wm0-x243.google.com with SMTP id e201so4034097wme.2
 for <linux-mtd@lists.infradead.org>; Thu, 05 May 2016 08:28:26 -0700 (PDT)
Subject: Re: [PATCH] mtd: m25p80: add message if mmap flash read is supported
To: Brian Norris <computersforpeace@gmail.com>
References: <9111b023-d1e5-3084-4320-acf727e828f4@gmail.com>
 <20160505005436.GA122798@google.com>
Cc: MTD Mailing List <linux-mtd@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <94364420-6e96-36b6-ab17-76b68db45262@gmail.com>
Date: Thu, 5 May 2016 17:28:13 +0200
MIME-Version: 1.0
In-Reply-To: <20160505005436.GA122798@google.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 05.05.2016 um 02:54 schrieb Brian Norris:
> (moving linux-spi to BCC, since this is MTD-only, and doesn't concern
> the SPI core)
> 
> On Wed, Apr 27, 2016 at 10:36:48PM +0200, Heiner Kallweit wrote:
>> As a follow-up to commit 08922f644878c9 "mtd: devices: m25p80: add support for
>> mmap read request" add an info to syslog if mmap flash read is supported for a
>> device.
> 
> Any particular reason you want this to be printed? There are quite a few
> other features we don't print to the log right now.
> 
I see few scenarios where this information may be useful:
- Confirmation that the mmap feature was properly configured for a device
  (e.g. if mmap feature is enabled by platform data / DT for a flash chip)
- There are devices with >1 flash chip and just one can be accessed mmapped.
  Then this information can give a hint e.g. why accessing one chip is faster than
  accessing other(s).
- Debugging purposes (e.g. mmap is configured but not supported and flash read fails)

Rgds, Heiner

> Brian
> 
