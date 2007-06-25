Received: from wx-out-0506.google.com ([66.249.82.229])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I2gE2-0007Dm-Ot
	for linux-mtd@lists.infradead.org; Mon, 25 Jun 2007 00:30:56 -0400
Received: by wx-out-0506.google.com with SMTP id h26so1397907wxd
	for <linux-mtd@lists.infradead.org>;
	Sun, 24 Jun 2007 21:30:53 -0700 (PDT)
Message-ID: <acd2a5930706242130q13fe6837p696542d274bddec7@mail.gmail.com>
Date: Mon, 25 Jun 2007 08:30:53 +0400
From: "Vitaly Wool" <vitalywool@gmail.com>
To: joakim.tjernlund@transmode.se
Subject: Re: [PATCH] Prevent JFFS2 from OOPS:ing due to missing error checks.
In-Reply-To: <1182706382.7852.7.camel@gentoo-jocke.transmode.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1182706382.7852.7.camel@gentoo-jocke.transmode.se>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/24/07, Joakim Tjernlund <joakim.tjernlund@transmode.se> wrote:
> >From 474425d656766b6c6229312771be5f3e8d0a839f Mon Sep 17 00:00:00 2001
> From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> Date: Sun, 24 Jun 2007 19:22:29 +0200
> Subject: [PATCH] Prevent JFFS2 from OOPS:ing due to missing error checks.
>
>
> Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>

+               return ERR_PTR(PTR_ERR(hold_err)); ?
