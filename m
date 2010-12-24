Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PW83L-0004x9-10
	for linux-mtd@lists.infradead.org; Fri, 24 Dec 2010 13:51:27 +0000
Received: by wwb17 with SMTP id 17so7899945wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Dec 2010 05:51:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <201012241602.36582.manningc2@actrix.gen.nz>
References: <2A3DCF3DA181AD40BDE86A3150B27B6B03560990E3@dbde02.ent.ti.com>
	<AANLkTimJFsjLT15FA+TqDKzjvPXgxUAvovWpWKP3NCK4@mail.gmail.com>
	<201012241602.36582.manningc2@actrix.gen.nz>
Date: Fri, 24 Dec 2010 21:51:22 +0800
Message-ID: <AANLkTi=DfzP5mkwJ3zWePSp+gthWV-OT1_kBVFtkpNWU@mail.gmail.com>
Subject: Re: Issue : jffs2 and ecc layout
From: Ming Lei <tom.leiming@gmail.com>
To: Charles Manning <manningc2@actrix.gen.nz>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Ghorai, Sukumar" <s-ghorai@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

2010/12/24 Charles Manning <manningc2@actrix.gen.nz>:

> THis might be due to the way the omap2.c driver is now screwed up so that it
> does not read when not u32 aligned.
>
> Try this:
> http://www.spinics.net/linux/lists/linux-omap/msg42422.html
>
> Please report back if that fixes the problem for you.

No, the patch doesn't fix the issue.

thanks,
-- 
Lei Ming
