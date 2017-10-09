Received: from mail-qt0-x236.google.com ([2607:f8b0:400d:c0d::236])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e1VyA-0000fK-Kp
 for linux-mtd@lists.infradead.org; Mon, 09 Oct 2017 11:11:36 +0000
Received: by mail-qt0-x236.google.com with SMTP id a43so36373135qta.0
 for <linux-mtd@lists.infradead.org>; Mon, 09 Oct 2017 04:11:13 -0700 (PDT)
MIME-Version: 1.0
From: Rock Lee <rockdotlee@gmail.com>
Date: Mon, 9 Oct 2017 19:11:12 +0800
Message-ID: <CAL-1w2vUkw05Lrhbd99RV+R0+Uxtphn_qjLAfWLMrQ6z4srqgg@mail.gmail.com>
Subject: Detach the ubi device of rootfs
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

Hi,
I am studying the process of reboot in linux, but did find any script
in /etc to detach ubi device for rootfs. If I reboot the system when
ubi device of rootfs is scrubing, is it a risk for flash ?

-- 
Cheers,
Rock
