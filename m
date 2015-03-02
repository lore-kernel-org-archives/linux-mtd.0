Received: from mail-ie0-x234.google.com ([2607:f8b0:4001:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSTRT-0005U6-1o
 for linux-mtd@lists.infradead.org; Mon, 02 Mar 2015 16:43:39 +0000
Received: by iecvy18 with SMTP id vy18so49291053iec.6
 for <linux-mtd@lists.infradead.org>; Mon, 02 Mar 2015 08:43:17 -0800 (PST)
MIME-Version: 1.0
Message-ID: <CALupW3DX6G9eKSc9Q9mhfSgD2D=ZOXBMxJgXVz4+CVLn5resSg@mail.gmail.com>
Subject: set bitflip_threshold on boot?
From: Steve deRosier <derosier@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Mon, 02 Mar 2015 16:43:39 -0000

Hi All,

I know I can change bitflip_threshold via the sysfs interface.  Is
there any way to do this earlier?  I want to set it either by the
devicetree, or via kernel commandline.  I haven't found an obvious way
to do it, but I'm sure I'm missing something trivial.

Thanks,
- Steve
