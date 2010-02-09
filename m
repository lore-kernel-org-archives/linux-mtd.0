Received: from mail-ew0-f223.google.com ([209.85.219.223])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Neea7-0007FB-7n
	for linux-mtd@lists.infradead.org; Tue, 09 Feb 2010 01:08:04 +0000
Received: by ewy23 with SMTP id 23so47735ewy.4
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Feb 2010 17:07:56 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 8 Feb 2010 20:07:55 -0500
Message-ID: <dbdb2ea61002081707w416a84b1mccb3bec2da408e99@mail.gmail.com>
Subject: ubi, ubifs, and preempt
From: twebb <taliaferro62@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Maybe this is a dump question, but can UBI and UBIFS be used in a
kernel which has CONFIG_PREEMPT=y ?

Thanks,
twebb
