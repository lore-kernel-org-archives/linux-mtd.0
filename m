Received: from mail-io0-x234.google.com ([2607:f8b0:4001:c06::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNYDj-0005n3-LP
 for linux-mtd@lists.infradead.org; Fri, 07 Aug 2015 03:21:24 +0000
Received: by ioeg141 with SMTP id g141so100366099ioe.3
 for <linux-mtd@lists.infradead.org>; Thu, 06 Aug 2015 20:21:01 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 7 Aug 2015 11:20:58 +0800
Message-ID: <CAOx4H9CHrhBhW6DZrJi8h+Lz=5QFbmUn=n9o1WwBpzY1FGDR_A@mail.gmail.com>
Subject: UBI confusing scrubbing information
From: t kevin <kevint324@gmail.com>
To: linux-mtd@lists.infradead.org
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

[ 2982.880000] UBI: scrubbed PEB 426 (LEB 0:1255), data moved to PEB 1301
[ 2983.420000] UBI: scrubbed PEB 426 (LEB 0:451), data moved to PEB 1301
[ 3043.920000] UBI: scrubbed PEB 426 (LEB 0:491), data moved to PEB 1301
[ 3044.740000] UBI: scrubbed PEB 426 (LEB 0:1255), data moved to PEB 1301
[ 3045.240000] UBI: scrubbed PEB 426 (LEB 0:1098), data moved to PEB 1301
[ 3045.820000] UBI: scrubbed PEB 426 (LEB 0:65), data moved to PEB 1301
[ 3046.160000] UBI: scrubbed PEB 1319 (LEB 0:1098), data moved to PEB 1301

I'm using kernel 2.6.36.
I got above message on my console which got me confused.
First few lines indicates PEB 426 is on different LEBs?
And all those PEB/LEB are moved to PEB1301 multiple times?

Please help me understand what is happening.

Thanks a lot
Kevin
