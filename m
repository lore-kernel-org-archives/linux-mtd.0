Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ax2Z-0002Xv-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Feb 2002 10:53:31 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLOEGGFBAA.joakim.tjernlund@lumentis.se> 
References: <IGEFJKJNHJDCBKALBJLLOEGGFBAA.joakim.tjernlund@lumentis.se> 
To: joakim.tjernlund@lumentis.se
Cc: "Robert Kaiser" <rob@sysgo.de>, linux-mtd@lists.infradead.org,
    "J?rn Engel" <joern@wohnheim.fh-wedel.de>
Subject: Re: MTD concat layer 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 13 Feb 2002 11:04:37 +0000
Message-ID: <31104.1013598277@redhat.com>
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

joakim.tjernlund@lumentis.se said:
>  I thougth this was already supported? Just create a mtd partition
> that will span two or more banks and mount a JFFS2 FS on top of that
> partition. 

Doesn't work if the banks aren't made to appear contiguous by the map 
driver. The probe code can't handle it. 

The case in question has something like:

 --------------
 |  CFI chip  |
 --------------
 |  BIOS chip |
 --------------
 |  CFI chip  |
 --------------

You could hack up a map driver that appears to have the two CFI chips 
contiguously, and then the probe code would find them both and make a 
single MTD device from them -  but there was a reason why he wasn't doing 
this. Perhaps the 'BIOS' bit is in fact the beginning of the second chip, 
not actually a separate chip at all? I don't remember.

--
dwmw2
