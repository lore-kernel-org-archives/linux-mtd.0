Received: from plane.gmane.org ([80.91.229.3])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZ37a-00052c-6y
 for linux-mtd@lists.infradead.org; Wed, 23 Oct 2013 18:25:31 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1VZ379-0002Jc-S6
 for linux-mtd@lists.infradead.org; Wed, 23 Oct 2013 20:25:04 +0200
Received: from AMontsouris-651-1-138-229.w90-46.abo.wanadoo.fr
 ([90.46.109.229]) by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2013 20:25:03 +0200
Received: from yann.collet.73 by
 AMontsouris-651-1-138-229.w90-46.abo.wanadoo.fr with local (Gmexim 0.1
 (Debian)) id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2013 20:25:03 +0200
To: linux-mtd@lists.infradead.org
From: Yann Collet <yann.collet.73@gmail.com>
Subject: Re: lz4hc compression in UBIFS?
Date: Wed, 23 Oct 2013 18:19:48 +0000 (UTC)
Message-ID: <loom.20131023T201657-894@post.gmane.org>
References: <55541379679397@web20h.yandex.ru>
 <CAP+RiCAVuUEfyjg02+ZjeFXgUuaRW+fuMB490Ce2Hq_4qHBL=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

UBIFS error (pid 4288): ubifs_decompress: cannot decompress 12 bytes,
(...)
        data size      12
        data:
        00000000: 1f 00 01 00 ff e8 50 00 00 00 00 00


The compressed format is correct.
It describes a flow of 00, of size ~500.

So the problem seems more likely on the decompression side.

Are you sure you are providing "12" as the "input size" parameter ? and that 
the "maximum output size" parameter is correctly provided ? (i.e. >= to 
original data size)


Regards 
