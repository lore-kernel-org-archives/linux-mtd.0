Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NaxLm-0006E7-6N
	for linux-mtd@lists.infradead.org; Fri, 29 Jan 2010 20:21:58 +0000
Received: by fxm22 with SMTP id 22so791529fxm.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Jan 2010 12:21:47 -0800 (PST)
Subject: Re: ubiformat image verification
From: Artem Bityutskiy <dedekind1@gmail.com>
To: twebb <taliaferro62@gmail.com>
In-Reply-To: <dbdb2ea61001291118v78722d73gee24345e61e41766@mail.gmail.com>
References: <dbdb2ea61001291118v78722d73gee24345e61e41766@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 29 Jan 2010 22:21:45 +0200
Message-Id: <1264796505.21418.3.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-01-29 at 14:18 -0500, twebb wrote:
> Can the image that is written to NAND using ubiformat be read back
> (using nanddump) and compared identically to the original image file?
> I want to somehow verify that the image was written error-free to NAND
> flash.

It can. But it is simpler to add a --check option to ubiformat and teach
it to read stuff back and verify.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
