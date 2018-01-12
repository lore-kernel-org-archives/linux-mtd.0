Received: from mail-yb0-x22a.google.com ([2607:f8b0:4002:c09::22a])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ea1Zk-0007TM-3c
 for linux-mtd@lists.infradead.org; Fri, 12 Jan 2018 15:49:01 +0000
Received: by mail-yb0-x22a.google.com with SMTP id k189so2844168ybc.12
 for <linux-mtd@lists.infradead.org>; Fri, 12 Jan 2018 07:48:49 -0800 (PST)
MIME-Version: 1.0
From: Bogdan Harjoc <harjoc@gmail.com>
Date: Fri, 12 Jan 2018 17:48:46 +0200
Message-ID: <CAF4+tmq0km-HXGkmWtHMA_rtzYYtok6W_suTVwgJnz5qPK6ZGw@mail.gmail.com>
Subject: Handle eraseblocks containing the bad-block table in UBI
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With some Macronix NANDs that present the bad-blocks table at a fixed
eraseblock, UBI tries to use the PEB as data and this results in the
"Bad node, ff ff ff ..." symptoms.

Should UBI receive this special status of the bbt PEBs via the
mtd_isbad() result values (in the Macronix case, mtd_block_isbad()
returns false for the PEB containing the bbt), or are 'bbt PEBs' not
supported in UBI ?

Thanks,
Bogdan Harjoc
