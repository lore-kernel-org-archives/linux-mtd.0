Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MCYLJ-0001Vy-IA
	for linux-mtd@lists.infradead.org; Fri, 05 Jun 2009 12:16:24 +0000
Subject: Re: [PATCH] [MTD-UTILS] Incorrect loop condition
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nahor <nahor.j+gmane@gmail.com>
In-Reply-To: <h077d2$ra9$1@ger.gmane.org>
References: <h077d2$ra9$1@ger.gmane.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 05 Jun 2009 15:15:48 +0300
Message-Id: <1244204148.5847.54.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-06-03 at 18:18 -0700, Nahor wrote:
> --- a/nandwrite.c        2009-06-01 18:03:55.000000000 -0700
> +++ b/nandwrite.c 2009-06-03 15:29:24.000000000 -0700
> @@ -531,7 +531,7 @@
>                 if (writeoob) {
>                         int tinycnt = 0;
> 
> -                       while(tinycnt < readlen) {
> +                       while(tinycnt < meminfo.oobsize) {
>                                 cnt = read(ifd, oobreadbuf + tinycnt,
> meminfo.oobsize - tinycnt);
>                                 if (cnt == 0) { // EOF
>                                         break;
> 

This looks valid for me. Would you please, send a patch which I can
apply, which would include your name and Signed-off-by signature?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
