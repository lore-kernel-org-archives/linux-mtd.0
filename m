Received: from gv-out-0910.google.com ([216.239.58.185])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWF4A-0004TL-3G
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 18:39:26 +0000
Received: by gv-out-0910.google.com with SMTP id n40so55051gve.5
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Aug 2008 11:39:25 -0700 (PDT)
Message-ID: <ac9c93b10808211139t69d3ce6euaac35368f1514931@mail.gmail.com>
Date: Thu, 21 Aug 2008 20:39:25 +0200
From: "Frans Meulenbroeks" <fransmeulenbroeks@gmail.com>
To: "Singh, Vimal" <vimalsingh@ti.com>
Subject: Re: [PATCH] [MTD] [NAND] nand_ecc.c: adding support for 512 byte ecc
In-Reply-To: <19F8576C6E063C45BE387C64729E739403CD517C1A@dbde02.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <19F8576C6E063C45BE387C64729E739403CD517C16@dbde02.ent.ti.com>
	<19F8576C6E063C45BE387C64729E739403CD517C1A@dbde02.ent.ti.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Vimal,

Thanks for your patch.
I tried to apply your patch, but only hunk 1 succeeded with fuzz 2.
Guess this is because shortly after submitting my patch another patch
has been applied to it.
Could you verify against the latest version in git and resubmit the patch.

Also there are a few small optimisation possibilities.
E.g. the code:
+       if (j == 2)
+               rp16 = 0;
Here the if statement does not really add. for 256 byte ecc
initialising rp16 does not harm so the if statement creates additional
overhead.

There are a fw more of these (like the /256 reported by Artem.
I'll happily fix these once I have a patch that I can apply.

Best regards, Frans
