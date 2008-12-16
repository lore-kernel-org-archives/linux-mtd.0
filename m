Received: from wf-out-1314.google.com ([209.85.200.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LCVsF-0005LG-3q
	for linux-mtd@lists.infradead.org; Tue, 16 Dec 2008 09:05:51 +0000
Received: by wf-out-1314.google.com with SMTP id 28so2938709wfc.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Dec 2008 01:05:49 -0800 (PST)
Message-ID: <8bd0f97a0812160105l292b57b1v77ad3b4314512942@mail.gmail.com>
Date: Tue, 16 Dec 2008 04:05:49 -0500
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Manuel Lauss" <mano@roarinelk.homelinux.net>
Subject: Re: NAND "low-level format"?
In-Reply-To: <20081216085501.GA7866@roarinelk.homelinux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20081216085501.GA7866@roarinelk.homelinux.net>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 16, 2008 at 03:55, Manuel Lauss wrote:
> My question is: is there a utility of sorts which can reclaim the falsely
> marked bad sectors for linux use?

there prob is a nand util to do it under Linux (i'd d/l mtd-utils and
build it up and see what you get), but if you're using u-boot, you can
use "nand scrub"
-mike
