Received: from fg-out-1718.google.com ([72.14.220.158])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JWDK7-0008CQ-VB
	for linux-mtd@lists.infradead.org; Mon, 03 Mar 2008 16:15:34 +0000
Received: by fg-out-1718.google.com with SMTP id 22so114483fge.26
	for <linux-mtd@lists.infradead.org>;
	Mon, 03 Mar 2008 08:15:29 -0800 (PST)
Message-ID: <fe810cf0803030809n2117219ey9fcd8f57cdf68142@mail.gmail.com>
Date: Mon, 3 Mar 2008 19:09:18 +0300
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: "Pavel Machek" <pavel@ucw.cz>
Subject: Re: jffs2: -ENOSPC when truncating file?!
In-Reply-To: <20080303121510.GD28369@elf.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20080223235742.GE2202@elf.ucw.cz>
	<fe810cf0802242348w625a7e7bj1a5476d6c79662@mail.gmail.com>
	<20080303121510.GD28369@elf.ucw.cz>
Cc: David Woodhouse <dwmw2@infradead.org>,
	=?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>,
	linux-mtd@lists.infradead.org, kernel list <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 3, 2008 at 3:15 PM, Pavel Machek <pavel@ucw.cz> wrote:
>
>  Patch is here (I whitespace-damaged it, sorry], and I've seen no
>  discussion.. should it just be applied?
>                                                                 Pavel

Being very simple workaround, this patch helps to avoid -ENOSPC bug
until better (proper) solution is found. IMO it is worth to try this
patch (at least to make sure that you are indeed dealing with the same
bug).

-a
