Received: from ext-ch1gw-2.online-age.net ([216.34.191.36])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B5YWC-0001eP-CZ
	for linux-mtd@lists.infradead.org; Mon, 22 Mar 2004 23:07:40 +0000
Received: from int-ch1gw-2.online-age.net (int-ch1gw-2 [3.159.232.66])
	id i2MN7ZqN001314	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Mar 2004 18:07:36 -0500 (EST)
Received: from uswaumsxb1medge.med.ge.com (localhost [127.0.0.1])
	id i2MN7YSo026992	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Mar 2004 18:07:35 -0500 (EST)
Message-ID: <77FE4A1FA59FF947845A42194AD667627731AC@uswaumsx07medge.med.ge.com>
From: "Eisenhut, Daniel (MED)" <Daniel.Eisenhut@med.ge.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Mon, 22 Mar 2004 17:07:26 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: Issue with DEBUG_LOCK_BITS
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've found a bug with the DEBUG_LOCK_BITS usage in
mtd/chips/cfi_cmdset_0001.c

In cfi_intelext_lock() and cfi_intelext_unlock()... if you have enabled
DEBUG_LOCK_BITS, do_printlockstatus_oneblock is called which sends the
command 0xff before returning.  This places the chip in Read Array mode.
Then do_xxlock_oneblock calls get_chip.  If the chip->state equals
FL_STATUS, it attempts to read the status register.  This naturally fails
since it is in Read Array mode, not Read Status mode.

Is there a need for do_printlockstatus_oneblock to place the chip in Read
Array mode when it is done?  I just deleted that line and everything appears
to work fine now with the DEBUG_LOCK_BITS enabled.  (Not that this is real
important since its debug stuff, but I spent many hours with this trying
figure out why its failing and someone else probably will as well if the
debug option is there)

Dan
