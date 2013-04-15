Received: from webmail.solarflare.com ([12.187.104.25])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1URkhX-0004kx-Fv
 for linux-mtd@lists.infradead.org; Mon, 15 Apr 2013 14:48:11 +0000
Message-ID: <1366037284.2701.3.camel@bwh-desktop.uk.solarflarecom.com>
Subject: MTD and EEPROM
From: Ben Hutchings <bhutchings@solarflare.com>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 15 Apr 2013 15:48:04 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is currently no MTD type defined for EEPROM - only RAM, ROM and
various types of flash.

Is there any particular reason for this?  Is it simply that EEPROMs tend
to be rather small and not worth putting filesystems on?

Ben.

-- 
Ben Hutchings, Staff Engineer, Solarflare
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
