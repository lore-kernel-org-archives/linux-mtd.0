Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fPPB-0003as-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Feb 2002 17:59:17 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLOEMNFBAA.joakim.tjernlund@lumentis.se> 
References: <IGEFJKJNHJDCBKALBJLLOEMNFBAA.joakim.tjernlund@lumentis.se> 
To: joakim.tjernlund@lumentis.se
Cc: "Robert Kaiser" <rob@sysgo.de>, "Adam Wozniak" <awozniak@comdev.cc>,
    linux-mtd@lists.infradead.org,
    "Jonas Holmberg" <jonas.holmberg@axis.com>
Subject: Re: Re-entrancy of flash erase/write 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 25 Feb 2002 18:10:33 +0000
Message-ID: <390.1014660633@redhat.com>
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
>  But there is one problem, I did this against 1.91 so I don't know if
> it applies  against latest CVS. Has anybody tried? 

passion /home/dwmw2/working/mtd $ patch -p0 --dry-run < ~/Mail/lists/mtd/368
missing header for unified diff at line 89 of patch
patching file `drivers/mtd/chips/cfi_cmdset_0001.c'
Hunk #1 FAILED at 4.
Hunk #2 FAILED at 61.
Hunk #3 succeeded at 156 (offset 3 lines).
Hunk #5 succeeded at 233 with fuzz 2 (offset 3 lines).
Hunk #6 succeeded at 284 (offset 4 lines).
Hunk #7 succeeded at 302 (offset 3 lines).
Hunk #8 succeeded at 337 (offset 4 lines).
Hunk #9 FAILED at 565.
Hunk #10 succeeded at 579 (offset 3 lines).
Hunk #11 succeeded at 606 (offset 4 lines).
Hunk #12 succeeded at 715 (offset 3 lines).
Hunk #13 FAILED at 865.
Hunk #14 succeeded at 889 (offset 10 lines).
Hunk #15 succeeded at 905 (offset 3 lines).
Hunk #16 succeeded at 1077 (offset 12 lines).
Hunk #17 succeeded at 1248 (offset 3 lines).
Hunk #18 FAILED at 1275.
5 out of 18 hunks FAILED -- saving rejects to drivers/mtd/chips/cfi_cmdset_0001.c.rej


--
dwmw2
