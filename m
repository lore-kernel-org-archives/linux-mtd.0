Received: from mail-yw0-f49.google.com ([209.85.213.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QvjUO-0001nq-1O
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2011 05:25:28 +0000
Received: by ywp17 with SMTP id 17so5010457ywp.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2011 22:25:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1313625029-19546-2-git-send-email-computersforpeace@gmail.com>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
	<1313625029-19546-2-git-send-email-computersforpeace@gmail.com>
Date: Tue, 23 Aug 2011 13:25:24 +0800
Message-ID: <CAB4PhKeGy9k2KwMiPcvT_WwcJAvL2Ugh-mgg7su62MOLYCXetw@mail.gmail.com>
Subject: Re: [RFC 1/5] mtd: support MTD_MODE_RAW for writing OOB
From: Jason Liu <liu.h.jason@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	Kevin Cernekee <cernekee@gmail.com>, b35362@freescale.com,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Matthew Creech <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Brian,

2011/8/18 Brian Norris <computersforpeace@gmail.com>:
> mtd_do_write_oob does not pass information about whether to write in RAW
> mode to the lower layers (e.g., NAND). We should pass MTD_OOB_RAW or
> MTD_OOB_PLACE based on the MTD file mode.
>
> This fixes issues with `nandwrite -n' and the MEMWRITEOOB[64] ioctls.

It's worthy here stating clear what the issue you meet and how it fix.

Jason
