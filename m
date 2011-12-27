Received: from mail-ey0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RfTEm-0002bT-VM
 for linux-mtd@lists.infradead.org; Tue, 27 Dec 2011 09:22:25 +0000
Received: by eaai13 with SMTP id i13so6147579eaa.36
 for <linux-mtd@lists.infradead.org>; Tue, 27 Dec 2011 01:22:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1324663880-22477-4-git-send-email-dedekind1@gmail.com>
References: <1324663880-22477-1-git-send-email-dedekind1@gmail.com>
 <1324663880-22477-4-git-send-email-dedekind1@gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 27 Dec 2011 04:22:01 -0500
Message-ID: <CAMjpGUeh+V0Oe8RgDjKM+WyukWJcRn4X0kh3=CPVohGAycb+qA@mail.gmail.com>
Subject: Re: [PATCH 03/28] mtd: introduce mtd_erase interface
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Mike Dunn <mikedunn@newsguy.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 23, 2011 at 13:10, Artem Bityutskiy wrote:
> =C2=A0static inline struct mtd_info *dev_to_mtd(struct device *dev)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return dev ? dev_get_drvdata(dev) : NULL;

on an unrelated note, this NULL check is unnecessary.  the core func
already takes care of checking the pointer.

drivers/base/dd.c:
408 void *dev_get_drvdata(const struct device *dev)
409 {
410         if (dev && dev->p)
411                 return dev->p->driver_data;
412         return NULL;
413 }
-mike
