Received: from mail-wi0-x22b.google.com ([2a00:1450:400c:c05::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VeUZc-0007m4-O8
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2013 18:44:57 +0000
Received: by mail-wi0-f171.google.com with SMTP id f4so1086598wiw.16
 for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2013 10:44:34 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 7 Nov 2013 11:44:34 -0700
Message-ID: <CACwUX0PEYGsNMDvy85EsrApWzNU3iTyY-1KHMaj1ay0xxKX6RQ@mail.gmail.com>
Subject: UBIFS recovery taking too long
From: David Mosberger-Tang <dmosberger@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We recently encountered a strange issue where UBIFS recovery is
suddenly taking a lot longer than usual (v3.7-based kernel).  In our
case, recovery took about 30 seconds.  This caused a serious problem
because our watchdog timer was set to 15 seconds, effectively
rendering the devices unbootable.

Does anybody know what triggers this slow recovery mode?  Also, how
can we calculate a worst-case recovery time for a given flash
chip-size.

Thanks,

  --david
