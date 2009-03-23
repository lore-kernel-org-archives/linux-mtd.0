Received: from mail-ew0-f177.google.com ([209.85.219.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Llj0I-0003jD-0Y
	for linux-mtd@lists.infradead.org; Mon, 23 Mar 2009 12:11:48 +0000
Received: by ewy25 with SMTP id 25so1662936ewy.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 Mar 2009 05:11:40 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 23 Mar 2009 14:11:39 +0200
Message-ID: <5cd8ec960903230511m11d0bd2clb440d0f634f278b2@mail.gmail.com>
Subject: Create remove resize MTD partitions at runtime...is it possible?
From: Ico Hristo <ico.yankov@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm trying to find out whether I can create and MTD partition after
the system is loaded. I'm running custom embedded linux on arm9 custom
board, the four MTD partitions are defined in cmdlinepart and the
first one is marked as read-only. The concrete question is whether
it's possilbe and what should I do to create mtd4 that overlaps mtd0
and mtd1 dynamically while the system is up and running (in ramdisk) ?

I've researched the topic and mtd source tree and the best I could do
is create new MTD within the boudries of existing one (this also could
solve my problem, but does not overrides the read-only attribute on
mtd0). Any help would be greatly appreciated.

Best regards,
Hristo Yankov
