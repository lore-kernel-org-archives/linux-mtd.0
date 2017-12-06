Received: from imta22.fe.bosch.de ([139.15.243.26])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMVXs-00068j-6J
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 08:59:20 +0000
Received: from smtp6-v.fe.bosch.de (imta23.fe.bosch.de [139.15.243.227])
 by imta22.fe.bosch.de (Postfix) with ESMTP id A5173840476
 for <linux-mtd@lists.infradead.org>; Wed,  6 Dec 2017 09:50:32 +0100 (CET)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>
CC: <manfred@colorfullife.com>, <dirk.behme@de.bosch.com>
Subject: [PATCH 0/5] Add flight recorder to MTDRAM
Date: Wed, 6 Dec 2017 09:50:34 +0100
Message-ID: <20171206085039.27164-1-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Manfred Spraul <manfred@colorfullife.com>

Hi,

The series adds a flight recorder to MTDRAM.
This allows very efficient power fail testing:
>From the flight recorder output, it is possible to recreate every image
that might have existed between the start of the recording and the end.

Obviously, a user space tool is required, it is attached as the last
mail in the series.

Patches:

0001-mtdram-expose-write-size-and-writebuf-size-as-module:
	An initial cleanup: write_size and writebuf_size are
	hardcoded in the source code.
	Convert that to module parameters.

0002-mtdram-Add-flight-recorder.patch:
	Initial flight recorder

0003-mtdram-Allow-to-enable-disable-flight-recorder-mode-.patch:
	For the preparation step, or for evaluating dumps, the
	flight recorder doesn't make sense. Thus allow
	to disable it at runtime by writing to debugfs/mtdram

0004-mtdram-Convert-the-flight-recorder-to-a-ring-buffer.patch:
	The initial flight recorder is very simple, cleanup 1:
	Convert the kernel buffer to a proper ringbuffer.

0005-mtdram-flight-recorder-Add-checksums.patch:
	When using tool to simulate something, there is always the
	risk that the issue is in the tool and not in the production
	code. Thus add checksums, to detect tool issues.

--
	Manfred
