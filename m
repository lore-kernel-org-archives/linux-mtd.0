Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 159itc-0000Mi-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 08:47:28 +0100
Received: from beta.dmz-eu.st.com ([164.129.1.35])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 159VI5-00027i-00
	for linux-mtd@lists.infradead.org; Mon, 11 Jun 2001 18:15:49 +0100
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with SMTP id 6134349FF
	for <linux-mtd@lists.infradead.org>; Mon, 11 Jun 2001 17:11:33 +0000 (GMT)
Received: from thistle.bri.st.com (localhost [127.0.0.1])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B8A69184F
	for <linux-mtd@lists.infradead.org>; Mon, 11 Jun 2001 17:11:32 +0000 (GMT)
Received: from [164.129.14.5] (helo=ocelot)
	by thistle.bristol.st.com with esmtp (Exim 3.03 #5)
	id 159VDv-0002VI-00
	for linux-mtd@lists.infradead.org; Mon, 11 Jun 2001 18:11:31 +0100
From: Stuart Menefy <Stuart.Menefy@st.com>
Message-Id: <1010611181131.ZM26024@bristol.st.com>
Date: Mon, 11 Jun 2001 18:11:31 +0100
To: linux-mtd@lists.infradead.org
Subject: CFI vs JEDEC read commands
MIME-Version: 1.0
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

Folks

In adding support for ST M29W160DT I've come across what looks like
a bug in the chip, but but which has exposed what looks like an
inconsistency in the probing in MTD.

The board I'm working on has two banks of Flash mapped into contiguous
addresses, and I was seeing problems when probing for the second bank
of Flash. The problem is that the first bank is being left in command
mode after the probe, and so the second bank is detected as an alias
for the first.

In cfi_cfi_probe() there is a call to cfi_send_cmd(0xff, ...) which I
assume is supposed to reset the device back to read mode to avoid this
problem. However the ST chip uses 0xf0 as its reset code, and changing
the 0xff to 0xf0 appears to fix the problem. 

All the documentation I've been able to check, for both CFI and JEDEC
devices, including the ST M29W160DT indicates that an unrecognised
command should put the device back into read mode. Unfortunately the ST
chip doesn't appear to be doing this, which I assume is a bug.

Has anybody else come across a problem like this?

However, this got me looking at the code. In virtually every case, a
'read' command is 0xf0, apart from two (one in cfi_cfi_probe and
the other in cfi_cmdset_unknown), when is it 0xff. Is this
deliberate, and would changing the remaining two to 0xf0 cause any
problems?

Many thanks

Stuart
