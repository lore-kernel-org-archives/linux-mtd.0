Received: from thor.lineo.com ([204.246.147.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15CS3g-00048X-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Jun 2001 21:25:08 +0100
Message-ID: <3B2FB3AA.AEE36C93@Rikers.org>
Date: Tue, 19 Jun 2001 14:18:50 -0600
From: Tim Riker <Tim@Rikers.org>
MIME-Version: 1.0
To: Russ Dill <Russ.Dill@asu.edu>
CC: bootldr@handhelds.org, linux-mtd@lists.infradead.org
Subject: Re: [Bootldr] cramfs/jffs2 bootloader code
References: <3B2FB3D2.44047FCF@asu.edu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
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

Does this include the changes on:

http://www.wearablegroup.org/software/bootldr/

which add jffs, jffs2, ymodem, etc to the crl bootldr?

I'm about to release tftpboot from CF ether patches for blob to Erik.

Russ Dill wrote:
> 
> OK, the cramfs/jffs2 bootloader code is finally more or less complete.
> 
> These modules allow a bootloader to load a kernel from multiple sources
> (ie cramfs, jffs, straight from flash etc). It always load the file
> "/linux" right now. Currently included are modules for cramfs, jffs2 and
> zImage straight from flash. Currently, the interface is:

-- 
Tim Riker - http://rikers.org/ - short SIGs! <g>
All I need to know I could have learned in Kindergarten
... if I'd just been paying attention.
