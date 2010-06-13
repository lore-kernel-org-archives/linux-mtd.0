Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ONikc-0003jH-N7
	for linux-mtd@lists.infradead.org; Sun, 13 Jun 2010 08:41:07 +0000
Subject: Re: [PATCH] fix typo in FAQ
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?ISO-8859-1?Q?N=E9meth_M=E1rton?= <nm127@freemail.hu>
In-Reply-To: <4C149152.9090501@freemail.hu>
References: <4C149152.9090501@freemail.hu>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 13 Jun 2010 11:38:26 +0300
Message-ID: <1276418306.19028.171.camel@localhost>
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

On Sun, 2010-06-13 at 10:05 +0200, Németh Márton wrote:
> Signed-off-by: Márton Németh <nm127@freemail.hu>
> ---
> diff --git a/faq/general.xml b/faq/general.xml
> index 1c0551f..be1a0d4 100644
> --- a/faq/general.xml
> +++ b/faq/general.xml
> @@ -225,7 +225,7 @@ release the chip again.
>  Some NOR chips power on with all of the eraseblocks in a locked state.
>  The MTD layer doesn't unlock these devices by default. If you are accessing
>  these devices from user-space, you can use the <CODE>flash_unlock</CODE> tool to
> -unlock the MTD device(s). If you are using the MTD device as aw rite-able root
> +unlock the MTD device(s). If you are using the MTD device as a write-able root
>  file-system you will either need to have the boot loader unlock the eraseblocks
>  before booting the kernel, or add code to the MTD map driver for your board to
>  unlock them.

Pushed, thank you!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
