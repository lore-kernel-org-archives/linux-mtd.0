Received: from yx-out-1718.google.com ([74.125.44.152])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M1tYZ-0001hv-Hg
	for linux-mtd@lists.infradead.org; Thu, 07 May 2009 02:42:02 +0000
Received: by yx-out-1718.google.com with SMTP id 6so322097yxn.72
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 May 2009 19:41:53 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 6 May 2009 22:41:53 -0400
Message-ID: <8bd0f97a0905061941s6055c6dfrf467a6b2b837c8f8@mail.gmail.com>
Subject: physmap and pointless shutdown() function ?
From: Mike Frysinger <vapier.adi@gmail.com>
To: Lennert Buytenhek <buytenh@wantstofly.org>,
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

waaaay back when power management support was added to the physmap.c
driver, it added the standard suspend/resume functions.  no problem
there.  but it also added a shutdown function which causes the flash
to suspend/resume when rebooting:
static void physmap_flash_shutdown(struct platform_device *dev)
{
    struct physmap_flash_info *info = platform_get_drvdata(dev);
    int i;
    for (i = 0; i < MAX_RESOURCES && info->mtd[i]; i++)
        if (info->mtd[i]->suspend && info->mtd[i]->resume)
            if (info->mtd[i]->suspend(info->mtd[i]) == 0)
                info->mtd[i]->resume(info->mtd[i]);
}

i cant see any point in doing this.  it isnt like the flash has
buffers that need flushing, and if they did, using suspend/resume as a
hack for flushing sounds pretty broken to me.

seems to me the function should just be dropped completely.
-mike
