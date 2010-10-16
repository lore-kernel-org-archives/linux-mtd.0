Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P7C9s-0001jX-7H
	for linux-mtd@lists.infradead.org; Sat, 16 Oct 2010 19:11:08 +0000
Received: by bwz7 with SMTP id 7so2559691bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 16 Oct 2010 12:11:07 -0700 (PDT)
Subject: Re: [PATCH 2/2] nanddump: always check the first erase block
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
In-Reply-To: <c0bf28b432c6f1e6e5ed634ff64afcf46762503a.1286871735.git.baruch@tkos.co.il>
References: <50168b5d486e28a9d7f7685537710e05242c4f12.1286871735.git.baruch@tkos.co.il>
	<c0bf28b432c6f1e6e5ed634ff64afcf46762503a.1286871735.git.baruch@tkos.co.il>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 16 Oct 2010 22:11:02 +0300
Message-ID: <1287256262.1781.33.camel@brekeke>
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

On Tue, 2010-10-12 at 10:23 +0200, Baruch Siach wrote:
> Check the first block even when start_addr is not eraseblock aligned.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  nanddump.c |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)

Pushed to mtd-utils, thanks!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
