Received: from mailout07.sul.t-online.com ([194.25.134.83])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17qqqR-0007il-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Sep 2002 09:02:59 +0100
Date: Mon, 16 Sep 2002 10:01:18 +0200
From: Erich Schubert <erich@debian.org>
To: Mark Meade <mark@lakeshoremicro.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: another question: what can break?
Message-ID: <20020916080118.GA16280@bombadil.xmldesign.de>
References: <20020916002848.GB23510@bombadil.xmldesign.de> <20020916031806.QNX26805.rwcrmhc52.attbi.com@there>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20020916031806.QNX26805.rwcrmhc52.attbi.com@there>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> In other words, the biosnetboot option -- if your BIOS supports it -- is the 
> most flexible, least risky way to boot from the DoC with GRUB.

Thanks for your hints, they helped a lot...
as far as i now understood the way the old firmware probably chose was
to hook the disc handler 13h which would mean that it has to emulate a
real block device, is that correct?
Where do i find the old firmware, in case i want to restore the original
contents of the flash?
is that in DOC52.EXB in the ttfs_5.1.2 package from m-systems?

Thanks for your help!

Gruss,
Erich Schubert
-- 
        erich@(mucl.de|debian.org)        --        GPG Key ID: 4B3A135C
             The best things in life are free: Friendship and Love.
            Ein Freund ist ein Geschenk, das man sich selbst macht.
            "Wissen ist Macht" - wenn man das richtige daraus macht.
