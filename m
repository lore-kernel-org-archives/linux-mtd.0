Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UbmLm-0005Eg-EH
 for linux-mtd@lists.infradead.org; Mon, 13 May 2013 06:35:11 +0000
Message-ID: <1368427043.3208.21.camel@sauron.fi.intel.com>
Subject: Re: MTD and EEPROM
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ben Hutchings <bhutchings@solarflare.com>
Date: Mon, 13 May 2013 09:37:23 +0300
In-Reply-To: <1366037284.2701.3.camel@bwh-desktop.uk.solarflarecom.com>
References: <1366037284.2701.3.camel@bwh-desktop.uk.solarflarecom.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-04-15 at 15:48 +0100, Ben Hutchings wrote:
> There is currently no MTD type defined for EEPROM - only RAM, ROM and
> various types of flash.

I do not really know why, may be no one needed it?

> Is there any particular reason for this?  Is it simply that EEPROMs tend
> to be rather small and not worth putting filesystems on?

One may want to have access to raw EEPROM without having any
file-system. So bare /dev/mtdX could be useful.

-- 
Best Regards,
Artem Bityutskiy
