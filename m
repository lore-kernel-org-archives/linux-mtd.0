Received: from web20729.mail.yahoo.com ([216.136.226.119])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B1teH-00015x-O6
	for linux-mtd@lists.infradead.org; Fri, 12 Mar 2004 20:52:53 +0000
Message-ID: <20040312205250.8650.qmail@web20729.mail.yahoo.com>
Date: Fri, 12 Mar 2004 12:52:50 -0800 (PST)
From: Shawn Jin <shawnxtech@yahoo.com>
To: linuxmtd <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: DQ7 vs DQ6 in flash erase/write
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

For AMD flash chips, in order to check if programing (erase or write) is
complete, you can either poll data (DQ7) or the toggle bits (DQ6/DQ2).
These two algorithms should be equivalent. However the toggle bit algorithm
seems not working on some chips for erase, write, or both. If the current
CVS code is used, which only supports the toggle bit algorithm, the symptom
is that chip is not writable or erasable. I'm "lucky" enough to have two
types of AMD flash chips (Am29PL320D and Am29LV256M) experiencing this kind
of problem.

The problems I experienced on Am29PL320D with a MPC8245 board are
1. No data can be written into the flash
2. If you try to erase several sectors continuously, only the first sector
can be erased. No error messages are shown.

On Am29LV256M with the same board, the chip is writable but not erasable.
The error message shows flash internal timeout. However the first sector is
actually erased if you do multiple sector erasure.

After long time investigation on the problem I found the following comment
on ver 1.3 of cfi_cmdset_0002.c.

   /* The dq6 toggling method of determining whether the erase is finished
    * doesn't seem to work for the Fujistu flash chips populated on the
    * TQM8260 board. We poll dq7 instead.
    */
Someone had the similar problem long time ago! But I'm "luckier" because he
didn't have write problem.

So I used the old cfi_cmdset_002.c to solve the erase problem. I tried to
implement DQ7 algorithm for write on ver 1.3 of cfi_cmdset_002.c but
haven't succeeded. Files can be copied to flash by "cp files /dev/mtd?" but
JFFS2 is broken.

Since the toggle bit algorithm does not work on some chips with some
boards, I am wondering:
1. Why does it not work? On my custom MPC8245 board, I tried different
settings of memory control registers to adjust flash timing but had no
success. Maybe the problem is really in flash itself? Has anyone else had
the similar problem when using Am29PL320D and Am29LV256M on other boards?

2. Why was the data polling algorithm (DQ7) removed? Although it's not
prevailing, it does happen sometimes. If there is no plan to support it, at
least it's worth to be mentioned that sometimes you have to poll DQ7 to
check if erase/write is complete.

3. Will polling DQ7 be supported later? I tried to simply change
chip_status() to poll DQ7 but failed.

Any comments, suggestions? Thank you very much.

-Shawn.

__________________________________
Do you Yahoo!?
Yahoo! Search - Find what you’re looking for faster
http://search.yahoo.com
