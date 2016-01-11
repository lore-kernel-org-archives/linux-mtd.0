Received: from mail-io0-x22f.google.com ([2607:f8b0:4001:c06::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aIe4O-0000AP-DO
 for linux-mtd@lists.infradead.org; Mon, 11 Jan 2016 15:07:45 +0000
Received: by mail-io0-x22f.google.com with SMTP id 1so304133382ion.1
 for <linux-mtd@lists.infradead.org>; Mon, 11 Jan 2016 07:07:23 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 11 Jan 2016 20:37:22 +0530
Message-ID: <CAMf7+LghhyuLVgbg1A3+CMG_tUri1-rFe3-D9L7zRduXdJRcpg@mail.gmail.com>
Subject: ubifs query
From: pavi1729 <pavitra1729@gmail.com>
To: linux-mtd@lists.infradead.org,
 Richard Weinberger <richard.weinberger@gmail.com>
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
  I was looking at 'ubifs_lookup_level0' which is calling 'tnc_prev' function.

LINK: http://lxr.free-electrons.com/source/fs/ubifs/tnc.c?v=3.10#L1267


FUNCTION: tnc_prev
'tnc_prev' could return a negative 'n' if znode->iip is 0.

LINK: http://lxr.free-electrons.com/source/fs/ubifs/tnc.c?v=3.10#L670

nn = znode->iip - 1;


If n is negative then below code will do a negative indexing since
this is the next line

if (keys_cmp(c, key, &znode->zbranch[*n].key)) {

LINK: http://lxr.free-electrons.com/source/fs/ubifs/tnc.c?v=3.10#L1275


Is this a possibility ?

Cheers,
Pavi
