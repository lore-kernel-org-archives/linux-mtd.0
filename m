Received: from rwcrmhc52.attbi.com ([216.148.227.88])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mfds-0002Ge-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 20:16:44 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: karim@opersys.com
Subject: Re: No more DoC hotplug on Grub fail [tested & working]
Date: Wed, 4 Sep 2002 15:15:32 -0400
Cc: linux-mtd@lists.infradead.org,
 Ilguiz Latypov <ilatypov@superbt.com>
References: <20020904145950.DRRI12451.rwcrmhc51.attbi.com@there> <20020904180749.DAXN1399.rwcrmhc51.attbi.com@there> <3D7651E7.B3633688@opersys.com>
In-Reply-To: <3D7651E7.B3633688@opersys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020904191612.SJPP19514.rwcrmhc52.attbi.com@there>
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

Karim Yaghmour wrote:
> Isn't there a way to get the manufacturer and chip ID codes display outside
> the first 512 bytes? Couldn't the code for this go in stage2 instead? We
> could then have the best of both worlds.

The manufacturer and chip ID codes are already displayed in stage2.  In fact, 
most of the functionality of the assembly code in doc_stage1 is also present 
in stage2/bdev_diskonchip.c.  

The display of these codes in stage1 are there to help diagnose any failures 
caused by incorrectly identifying any 256-byte/page devices.   If we get 
this wrong, we'll never get to stage 2.

Besides the ID's, enabling SHOW_INFO displays the DoC type and window, and 
also the "Jumping to Grub" message which signifies the end of stage1.

Mark
