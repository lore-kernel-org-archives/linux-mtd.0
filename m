Received: from smtp03.smtpout.orange.fr ([80.12.242.125]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ea2R3-0001IH-PG
 for linux-mtd@lists.infradead.org; Fri, 12 Jan 2018 16:44:08 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Miquel RAYNAL <miquel.raynal@free-electrons.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 0/7] Marvell NAND controller rework with ->exec_op()
References: <20180109103637.23798-1-miquel.raynal@free-electrons.com>
 <20180111122751.4bd74366@bbrezillon> <87efmwb8bj.fsf@belgarion.home>
 <20180111232417.4aa86075@xps13> <87a7xjbis2.fsf@belgarion.home>
 <20180112094501.27706bfc@bbrezillon> <876087beui.fsf@belgarion.home>
 <20180112112108.2e20dc14@bbrezillon>
Date: Fri, 12 Jan 2018 17:43:52 +0100
In-Reply-To: <20180112112108.2e20dc14@bbrezillon> (Boris Brezillon's message
 of "Fri, 12 Jan 2018 11:21:08 +0100")
Message-ID: <871sivauyf.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris Brezillon <boris.brezillon@free-electrons.com> writes:

> I think I'm still missing something. If I look at the branch you just
> pushed, I see that ->flash_bbt was not set to 1 before this commit [1],
> which means the pxa3xx driver was no setting the NAND_BBT_USE_FLASH
> flag, which in turn means you were not using the on-flash-bbt.
> When you test the old (pxa3xx) driver, are you sure you're testing
> things with a mainline kernel? If you have extra commits on top of
> mainline, can you push them somewhere?

Here is the branch I'm using with my pxa3xx driver :
git fetch https://github.com/rjarzmik/linux pxa3xx-test

Cheers.

-- 
Robert
