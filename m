Received: from mail-oi0-x234.google.com ([2607:f8b0:4003:c06::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNg8E-0005Dx-Gm
 for linux-mtd@lists.infradead.org; Fri, 07 Aug 2015 11:48:15 +0000
Received: by oio137 with SMTP id 137so51609580oio.0
 for <linux-mtd@lists.infradead.org>; Fri, 07 Aug 2015 04:47:51 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 7 Aug 2015 14:47:51 +0300
Message-ID: <CAEo2pzuPdN56QQbvoao_oo9oppr1CNmBMhq7d0BSGQXraBZYOA@mail.gmail.com>
Subject: ubifs: nand flash wear profiling for userspace application file i/o
From: =?UTF-8?B?0JjQu9GM0Y/RgSDQk9Cw0YHQsNC90L7Qsg==?= <torso.nafi@gmail.com>
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

Hello.

We are developing a GNU/Linux-based appliance, and our customers are
concerned that the defining application, which runs on it, wears out
its flash storage too quickly under certain circumstances. The h/w
supplier guarantees at least 10 000 rewrite cycles for its nand flash
blocks before wear out.

Is there a suitable method to count (or accurately estimate) the
distribution of rewrite cycles for ubifs flash blocks during a certain
period of application work cycle, e. g. for three days? The power is
not guaranteed to be 100% time on, without a single outage, so it
would be preferred if persistent data is used, like ubifs journal or
ubi wear-leveling peb contents, rather than volatile kernelspace
counters and such.

Best regards,
Ilyas Gasanov
