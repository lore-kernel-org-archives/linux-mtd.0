Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Gitv-0003Hj-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2002 16:49:32 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H6700EVP1GJAW@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Tue, 26 Nov 2002 18:19:32 +0100 (MET)
Date: Tue, 26 Nov 2002 18:17:30 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: SmartMedia Card need to create fs before mounting it ?
In-reply-to: 
 <Pine.LNX.4.44.0211261219490.21417-100000@structure.biochem.nchu.edu.tw>
To: shadow <saturn@structure.biochem.nchu.edu.tw>
Cc: linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200211261817.30312.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: 
 <Pine.LNX.4.44.0211261219490.21417-100000@structure.biochem.nchu.edu.tw>
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

On Tuesday 26 November 2002 05:22, shadow wrote:
> On Tue, 26 Nov 2002, Thomas Gleixner wrote:
> mount -t jffs2 /dev/mtdblock/6 /mnt
> getting follow error messages.
> JFFS2: Erase block at 0x007fe000 is not formatted. It will be erased
> Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
The FLASH is not erased at all
What says dmesg after eraseall ?
If there is no hint, turn on debugging in nand driver
-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
