Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLsQH-0003Z3-RH
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 07:41:07 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4G7eTAo011099
	for <linux-mtd@lists.infradead.org>; Mon, 16 May 2011 10:41:00 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 00/20] UBIFS: last changes
Date: Mon, 16 May 2011 10:44:19 +0300
Message-Id: <1305531879-19311-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

here are the last UBIFS changes which I have not sent to the mailing list yet.
The 20-patch series is _not_ a one improvement or fix, it is just a set of last
20 patches in the ubifs-2.6.git tree, dumped to the mailing list for review.
Since no one usually comments on patches, I'm saving time and do not split the
20 patches on several independent series. But if you want this, please, let me
know.

So, in these series:

1. Various fixes and improvements in the debugging code, to make sure that
   UBIFS extra debugging checks work fine in case of power cuts. I've made the
   changes when testing with 'integck' in power cut emulation mode with all the
   extra checks enabled.

2. Just random simplifications and clean-ups spotted while reading the code.

3. A lot of replay code simplifications, also spotted while reading the code
   and trying to figure out how it works.

4. A recovery improvement - now we recover only the last bud LEBs, not all of
   them, because power cuts can cause corruptions only in the last bud.

5. The free space fix-up code from Matthew - it deals with the situation when
   UBIFS is flashed with a dumb flasher and free space is unusable. So one can
   ask mkfs.ubifs to put a special flag to the UBIFS super-block and UBIFS will
   fix-up all the free space on the first mount. I will take time, though, so
   using a smarter flasher is more preferable. However, I'm still waiting for
   mkfs.ubifs changes from Matthew, as well as a piece of documentation for
   this space fix-up thing.

I'm going to send these changes upstream the next merge window.

Artem.
