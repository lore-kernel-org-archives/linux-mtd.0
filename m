Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17L9y2-0008Ub-00
	for <linux-mtd@lists.infradead.org>; Thu, 20 Jun 2002 22:59:50 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <AIEOIMKIOAAJKHJOGAEFMEEOCEAA.david@forcedpotato.com> 
References: <AIEOIMKIOAAJKHJOGAEFMEEOCEAA.david@forcedpotato.com> 
To: "David Cooper" <david@forcedpotato.com>
Cc: "Ilguiz Latypov" <ilatypov@superbt.com>,
    "Linux MTD" <linux-mtd@lists.infradead.org>
Subject: Re: X Windows Performance with DOC 2000 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 20 Jun 2002 22:59:28 +0100
Message-ID: <7324.1024610368@redhat.com>
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

david@forcedpotato.com said:
> (3) X Modules
> I then was able to look at the X log file (/var/log/XFree86.0.log) and
> it seemed that the point at which X fell over was when it was trying
> to load the ddc module (libddc.a).  So I then mounted the entire /usr/
> X11R6/lib/modules directory from the IDE drive and ran the rest from
> the root filesystem on the DOC.  This allows X to get a little further
> (seems to try to load a screen from the VESA BIOS).  But it still
> hangs, this time after putting rubbish graphics on the screen (as in a
> normal initialisation).

> Question:  Why does X have trouble loading the libddc.a module from
> the DOC?

Interesting. The DDC module is likely to be using the VESA BIOS too -- you 
may find that your box is dying when XFree86 tries to do _anything_ 
BIOS-related. 

You said X works when you run it from the IDE drive. Do you have the
DiskOnChip drivers loaded? If not, does it still work when you run it from
IDE after loading them?

--
dwmw2
