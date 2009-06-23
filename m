Received: from mail-bw0-f208.google.com ([209.85.218.208])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MJ4A2-0008Pd-KY
	for linux-mtd@lists.infradead.org; Tue, 23 Jun 2009 11:27:41 +0000
Received: by bwz4 with SMTP id 4so4079295bwz.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Jun 2009 04:27:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1245754975-12063-1-git-send-email-ext-mika.2.korhonen@nokia.com>
References: <1245754975-12063-1-git-send-email-ext-mika.2.korhonen@nokia.com>
Date: Tue, 23 Jun 2009 14:27:32 +0300
Message-ID: <7948530906230427l5a7be4a4j80572fe4df774371@mail.gmail.com>
Subject: Re: [PATCH] MTD: OneNAND: multiblock erase support
From: Mika Korhonen <mika.j.korhonen@gmail.com>
To: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: amul.saha@samsung.com, kyungmin.park@samsung.com,
	linux-mtd@lists.infradead.org, adrian.hunter@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As you probably noticed, this is the revised version of the initial patch in
http://lists.infradead.org/pipermail/linux-mtd/2009-June/026050.html

I made some changes based on the comments from Adrian Hunter and Kyungmin Park:
* removed the configuration option from Kconfig as it is supported by
all OneNAND chips and Flex-case is handled easily in code, bringing
the option back can be done easily if needed
* spin on multiblock erase and erase verify commands instead using
interrupt line: mb erase usually delays just 1 us, verify usually 30
us (is this still acceptable?)
* handle regions bigger than 64 eraseblocks instead of falling back to
block-by-block erase
* check bad blocks prior to sending mb erase commands
* Flex does not support mb erase, so single block version is always used

I extracted the single block erase to separate function, as well as
the multiblock one.

The erase speed in optimal full 64-eraseblock case seems to be about 1400 MB/s.

br
Mika
