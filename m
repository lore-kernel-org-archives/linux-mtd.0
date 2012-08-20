Received: from mail-qa0-f49.google.com ([209.85.216.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3WPa-0001yQ-1y
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2012 18:09:14 +0000
Received: by qafk1 with SMTP id k1so2955828qaf.15
 for <linux-mtd@lists.infradead.org>; Mon, 20 Aug 2012 11:09:12 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 20 Aug 2012 13:09:11 -0500
Message-ID: <CAHyXW63+bY-Dq_miAWMQc=RYqaBwGrZHn95wgJXuK3NHWsnzbg@mail.gmail.com>
Subject: new 3.5.2 ubifs debug assert
From: Michael Hench <michaelhench@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Reply-To: MichaelHench@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

apparently UBIFS debugging is always on in 3.5.2
can anyone tell me what this means ?

UBIFS assert failed in dbg_snprintf_key at 136 (pid 28692)


everything seems to work, just lots of debug messages.
this partition hasn't changed in quite some time over several kernel versions.

Thanks.
Mike Hench
