Received: from ug-out-1314.google.com ([66.249.92.169])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FhYjT-0007xa-35
	for linux-mtd@lists.infradead.org; Sat, 20 May 2006 17:11:33 -0400
Received: by ug-out-1314.google.com with SMTP id q2so980096uge
	for <linux-mtd@lists.infradead.org>;
	Sat, 20 May 2006 14:11:26 -0700 (PDT)
Message-ID: <625fc13d0605201411kb7f40e1sd6cfe8ebf50a6e38@mail.gmail.com>
Date: Sat, 20 May 2006 16:11:26 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Linux-MTD Mailing List" <linux-mtd@lists.infradead.org>
In-Reply-To: <E1FhOEg-0003dX-4R@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <E1FhOEg-0003dX-4R@pentafluge.infradead.org>
Cc: Andrew Morton <akpm@osdl.org>
Subject: Re: [MTD] Avoid 64-bit division in mtdconcat
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/20/06, Linux-MTD Mailing List <linux-mtd@lists.infradead.org> wrote:
> Commit:     6c8b44abc86a3e23dd1a22c0ee187f06bd7c7f5d
> Parent:     5fc3dbc418e01345e25e96b3192a1c46051c3fdc
> Author:     Andrew Morton <akpm@osdl.org>
> AuthorDate: Sat May 20 10:17:21 2006 +0100
> Commit:     David Woodhouse <dwmw2@infradead.org>
> CommitDate: Sat May 20 10:17:21 2006 +0100
>
>     [MTD] Avoid 64-bit division in mtdconcat
>
>     WARNING: "__moddi3" [drivers/mtd/mtdconcat.ko] undefined!
>
>     Signed-off-by: Andrew Morton <akpm@osdl.org>
>     Signed-off-by: David Woodhouse <dwmw2@infradead.org>

NAK.  asm-ppc/div64.h doesn't exist.  Whether we like it or not,
arch/ppc is still valid and this breaks mtdconcat support on lots of
embedded stuff.  There might be other architectures too, but only one
is required for this to be broken :).

josh
