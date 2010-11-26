Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PM0ok-00036z-Ax
	for linux-mtd@lists.infradead.org; Fri, 26 Nov 2010 16:06:35 +0000
Received: by fxm16 with SMTP id 16so1093506fxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Nov 2010 08:06:32 -0800 (PST)
Subject: Re: [PATCH] fs: jffs2: fix error value sign
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vasiliy Kulikov <segoon@openwall.com>
In-Reply-To: <1289765320-6071-1-git-send-email-segoon@openwall.com>
References: <1289765320-6071-1-git-send-email-segoon@openwall.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 26 Nov 2010 18:05:59 +0200
Message-ID: <1290787559.2552.29.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-11-14 at 23:08 +0300, Vasiliy Kulikov wrote:
> do_verify_xattr_datum(), do_load_xattr_datum(), load_xattr_datum()
> and verify_xattr_ref() should return negative value on error.
> Sometimes they return EIO that is positive.  Change this to -EIO.
> 
> Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
