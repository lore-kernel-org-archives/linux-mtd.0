Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZH46z-0004Fm-N8
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2015 05:59:38 +0000
Message-ID: <55AC8CDE.9020905@cn.fujitsu.com>
Date: Mon, 20 Jul 2015 13:53:34 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy
 <dedekind1@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: UBIFS: Question about calc_dd_growth()
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Atem and Richard and all:

	I am doing some work about adding support of quota
in ubifs. But I found there is a question in  calc_dd_growth
I am confused about.

  417         if (req->dirtied_ino)
  418                 dd_growth += c->bi.inode_budget << 
(req->dirtied_ino - 1);

Why it's a '<<'?? I mean, to myself, it's clear to be that:

   dd_growth += c->bi.inode_budget * req->dirtied_ino;


Could you help to explain it to me?

Thanx
Yang
