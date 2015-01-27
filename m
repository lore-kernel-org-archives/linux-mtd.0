Received: from mail-we0-f178.google.com ([74.125.82.178])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGFk4-000735-BG
 for linux-mtd@lists.infradead.org; Tue, 27 Jan 2015 23:40:21 +0000
Received: by mail-we0-f178.google.com with SMTP id k48so17754171wev.9
 for <linux-mtd@lists.infradead.org>; Tue, 27 Jan 2015 15:39:58 -0800 (PST)
Message-ID: <54C8214D.1010404@vanguardiasur.com.ar>
Date: Tue, 27 Jan 2015 20:37:49 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, dedekind1@gmail.com
Subject: Re: [PATCH 2/2 v2] UBI: Block: Add blk-mq support
References: <1420926734-16417-1-git-send-email-richard@nod.at>
 <1420926734-16417-2-git-send-email-richard@nod.at>
In-Reply-To: <1420926734-16417-2-git-send-email-richard@nod.at>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: axboe@fb.com, tom.leiming@gmail.com, linux-kernel@vger.kernel.org,
 hch@infradead.org, linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/10/2015 06:52 PM, Richard Weinberger wrote:
> Convert the driver to blk-mq.
> Beside of moving to the modern block interface this change boosts
> also the performance of the driver.
> 
> nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
> nand: Micron NAND 256MiB 3,3V 8-bit
> nand: 256MiB, SLC, page size: 2048, OOB size: 64
> 
> root@debian-armhf:~# dd if=/dev/ubiblock0_0 of=/dev/zero bs=1M
> 243+1 records in
> 243+1 records out
> 255080448 bytes (255 MB) copied, 4.39295 s, 58.1 MB/s
> 
> vs.
> 
> root@debian-armhf:~# dd if=/dev/ubiblock0_0 of=/dev/zero bs=1M
> 243+1 records in
> 243+1 records out
> 255080448 bytes (255 MB) copied, 2.87676 s, 88.7 MB/s
> 
> Cc: hch@infradead.org
> Cc: axboe@fb.com
> Cc: tom.leiming@gmail.com
> Signed-off-by: Richard Weinberger <richard@nod.at>
> Tested-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Acked-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

And thanks a lot for the good work!

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
