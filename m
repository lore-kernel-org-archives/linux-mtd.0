Received: from mail-ie0-f174.google.com ([209.85.223.174])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TfqmC-0002YB-Tj
 for linux-mtd@lists.infradead.org; Tue, 04 Dec 2012 11:35:01 +0000
Received: by mail-ie0-f174.google.com with SMTP id c11so5931488ieb.19
 for <linux-mtd@lists.infradead.org>; Tue, 04 Dec 2012 03:34:59 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 4 Dec 2012 08:34:58 -0300
Message-ID: <CALF0-+X+iEpCAJRtSFeJK-VhMtgC9aPbBz5iF6B+9UaGsofwsA@mail.gmail.com>
Subject: Can't make an ubi volume with fastmap on nandsim
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: richard -rw- weinberger <richard.weinberger@gmail.com>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I noticed there isn't much fastmap documentation,
though I managed to find some floating around:

http://www.emlinews.net/2012/10/ubi-fastmap-making-its-way-to-mainline/

What ever happened to this patch:

http://lists.infradead.org/pipermail/linux-mtd/2012-October/044264.html ?

I see the patch has been applied by Artem but I can't see anything about
fastmap in http://www.linux-mtd.infradead.org/doc/ubi.html.

It would be nice to have it in-kernel, so:
Mind if I send a patch with a copy-paste of some of this adding it to
Documentation/ubi/fastmap.txt?

Thanks!

    Ezequiel
