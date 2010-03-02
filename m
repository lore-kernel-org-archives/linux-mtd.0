Received: from mail-fx0-f214.google.com ([209.85.220.214])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NmY2D-0002W1-Ch
	for linux-mtd@lists.infradead.org; Tue, 02 Mar 2010 19:45:41 +0000
Received: by fxm6 with SMTP id 6so723620fxm.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 02 Mar 2010 11:45:35 -0800 (PST)
Subject: Re: Release of UBIL: ubi with log
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brijesh Singh <brij.singh@samsung.com>
In-Reply-To: <6b5362aa1002260458j571852cbl2f2d86130828333a@mail.gmail.com>
References: <6b5362aa1002260458j571852cbl2f2d86130828333a@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 02 Mar 2010 21:45:31 +0200
Message-Id: <1267559131.1883.1.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Artem.Bityutskiy@nokia.com, brijesh.s.singh@gmail.com,
	linux-mtd@lists.infradead.org, rohitvdongre@gmail.com,
	David Woodhouse <dwmw2@infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-02-26 at 18:28 +0530, Brijesh Singh wrote:
> Hi,
>  It gives me great pleasure in sharing UBIL: ubi with log.  We have
> added logging functionality to ubi for reducing mount time.
> UBIL uses the "same source base of UBI". The logging functionality can
> be added or removed at compile time using "make menuconfig option".
> 
> We have seen mount time reduction of 50% in 1GB NAND. We are expecting
> even better results for larger flash memories.
> 
> The source code of UBIL can be found in the following git tree:
> http://git.infradead.org/users/brijesh/ubi-2.6.git
> 

Sounds interesting! However, I'm out of office till end of March, and
won't be able to look closely at this. But hopefully others will try it.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
