Received: from mail-yk0-f171.google.com ([209.85.160.171])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUgMI-00027P-VN
 for linux-mtd@lists.infradead.org; Mon, 31 Mar 2014 17:50:55 +0000
Received: by mail-yk0-f171.google.com with SMTP id q9so6452822ykb.30
 for <linux-mtd@lists.infradead.org>; Mon, 31 Mar 2014 10:50:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1396100184-7110-4-git-send-email-gsi@denx.de>
References: <1396100184-7110-1-git-send-email-gsi@denx.de>
 <1396100184-7110-4-git-send-email-gsi@denx.de>
Date: Mon, 31 Mar 2014 11:50:30 -0600
Message-ID: <CACwUX0P+BMgL7ms8oeCKW=DFyvjLK3eGR8zWfRhw-0LpTGwjDA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] mtd: nand: introduce a READMODE command
From: David Mosberger-Tang <dmosberger@gmail.com>
To: Gerhard Sittig <gsi@denx.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>, Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Gerhard,

Thanks for putting these patches together!

Would it be cleaner to define READMODE like this:

#define NAND_CMD_READMODE      (0x100 | NAND_CMD_READ0)

?

I'm updating my patch to take advantage of READMODE.

  --david
