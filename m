Received: from mail-yw0-x22a.google.com ([2607:f8b0:4002:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0p5u-0002HO-F1
 for linux-mtd@lists.infradead.org; Wed, 19 Apr 2017 12:52:28 +0000
Received: by mail-yw0-x22a.google.com with SMTP id j9so9883214ywj.3
 for <linux-mtd@lists.infradead.org>; Wed, 19 Apr 2017 05:52:05 -0700 (PDT)
MIME-Version: 1.0
From: Rock Lee <rockdotlee@gmail.com>
Date: Wed, 19 Apr 2017 20:52:04 +0800
Message-ID: <CAL-1w2t6kw0AW5d3LX2QAcXO7ow9zJ9DBPCAYJieByo0Y9yzqw@mail.gmail.com>
Subject: UBIFS doesn't supper NFS
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
There is no s_export_op in the super block of UBIFS, that means UBIFS
doesn't support NFS. But I noticed there are some patches try to sovle
this problem, for example:

http://lists.infradead.org/pipermail/linux-mtd/2013-May/047092.html

But why UBIFS is still not able to support NFS?

-- 
Cheers,
Rock
