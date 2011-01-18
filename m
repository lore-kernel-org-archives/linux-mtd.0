Received: from www.tglx.de ([62.245.132.106])
	by casper.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PfAiz-0000u2-8b
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2011 12:31:49 +0000
To: dedekind1@gmail.com
Subject: [PATCH v2 3/3] UBIFS: do not start the commit if there is nothing to
	commit
From: John Ogness <john.ogness@linutronix.de>
References: <20101013163005.GB1889@silverbox.local>
	<1295200104.2470.5.camel@koala> <4D33FB78.5010208@nokia.com>
	<1295335817.2470.31.camel@koala> <1295336185.2470.33.camel@koala>
Date: Tue, 18 Jan 2011 13:29:25 +0100
In-Reply-To: <1295336185.2470.33.camel@koala> (Artem Bityutskiy's message of
	"Tue\, 18 Jan 2011 09\:36\:25 +0200")
Message-ID: <87ei8apf8a.fsf@vostro.fn.ogness.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

With these patches, there is no longer an erase for _every_
sync. However, there is still one erase that occurs when ubifs is
mounted. The following script will cause an erase with each sync.

while true; do
    mount -t ubifs ubi0_2 /tmp/mnt
    sync
    umount /tmp/mnt
done

John Ogness
