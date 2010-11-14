Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PHjCk-00034a-Fb
	for linux-mtd@lists.infradead.org; Sun, 14 Nov 2010 20:29:42 +0000
Received: by wyf22 with SMTP id 22so5173393wyf.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 14 Nov 2010 12:29:35 -0800 (PST)
Date: Sun, 14 Nov 2010 23:29:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: Vasiliy Kulikov <segoon@openwall.com>
Subject: Re: [PATCH] fs: jffs2: fix error value sign
Message-ID: <20101114202905.GA21614@bicker>
References: <1289765320-6071-1-git-send-email-segoon@openwall.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1289765320-6071-1-git-send-email-segoon@openwall.com>
Cc: David Woodhouse <dwmw2@infradead.org>, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Nov 14, 2010 at 11:08:39PM +0300, Vasiliy Kulikov wrote:
> do_verify_xattr_datum(), do_load_xattr_datum(), load_xattr_datum()
> and verify_xattr_ref() should return negative value on error.
> Sometimes they return EIO that is positive.  Change this to -EIO.
> 
> Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
> ---
>  This driver is not compilable, so the patch is not tested.
> 

It compiles.

regards,
dan carpenter
