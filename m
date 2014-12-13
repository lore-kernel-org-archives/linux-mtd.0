Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XzdNw-0008MB-7l
 for linux-mtd@lists.infradead.org; Sat, 13 Dec 2014 03:28:48 +0000
Received: by mail-pa0-f52.google.com with SMTP id eu11so8320377pac.25
 for <linux-mtd@lists.infradead.org>; Fri, 12 Dec 2014 19:28:27 -0800 (PST)
Date: Fri, 12 Dec 2014 19:28:24 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH] mtd: physmap_of: fix potential NULL dereference
Message-ID: <20141213032824.GR21347@ld-irv-0074>
References: <1417351863-3812-1-git-send-email-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1417351863-3812-1-git-send-email-ard.biesheuvel@linaro.org>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Nov 30, 2014 at 01:51:03PM +0100, Ard Biesheuvel wrote:
> On device remove, when testing the cmtd field of an of_flash
> struct to decide whether it is a concatenated device or not,
> we get a false positive on cmtd == NULL, and dereference it
> subsequently. This may occur if of_flash_remove() is called
> from the cleanup path of of_flash_probe().
> 
> Instead, test for NULL first, and only then perform the test
> for a concatenated device.
> 
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

Applied to l2-mtd.git. Thanks!

Brian
