Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPd3H-00026k-Vc
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 17:09:20 +0000
Received: by eekb45 with SMTP id b45so290234eek.36
 for <linux-mtd@lists.infradead.org>; Wed, 02 May 2012 10:09:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGiDA6LFxcr=UmT4r9uka5sz7k=S8zhCupp2HjS0t+ijQBe_1w@mail.gmail.com>
References: <1335903148-29539-1-git-send-email-shawn7400@gmail.com>
 <CAOMZO5AJn3QjwRga71+HXPr3on7xG-AQtCM58xqx-1J3fA=zuA@mail.gmail.com>
 <CAGiDA6LFxcr=UmT4r9uka5sz7k=S8zhCupp2HjS0t+ijQBe_1w@mail.gmail.com>
Date: Wed, 2 May 2012 14:09:17 -0300
Message-ID: <CAOMZO5DRFJ2LW0gri5M9QTUFvhLKgBDwS3Wj3x=0MztGp71sZg@mail.gmail.com>
Subject: Re: [PATCH] Change linking order of SPI and MTD.
From: Fabio Estevam <festevam@gmail.com>
To: "Shawn J. Goff" <shawn7400@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 2, 2012 at 11:16 AM, Shawn J. Goff <shawn7400@gmail.com> wrote:

>> Could EPROBE_DEFER help in this case?
>
> I hadn't known about EPROBE_DEFER until now. If it does help,
> that's probably a better solution. I'll look into it, but it'll be
> at least a few days before I'm able to spend time on it.

If you have a chance, please try the patch below:

--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1223,7 +1223,7 @@ static int __init ubi_init(void)

                mtd = open_mtd_device(p->name);
                if (IS_ERR(mtd)) {
-                       err = PTR_ERR(mtd);
+                       err = -EPROBE_DEFER;
                        goto out_detach;
                }
