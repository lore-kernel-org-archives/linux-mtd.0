Received: from ug-out-1314.google.com ([66.249.92.170])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GEcx0-0001rU-3a
	for linux-mtd@lists.infradead.org; Sun, 20 Aug 2006 03:22:10 +0100
Received: by ug-out-1314.google.com with SMTP id u40so1242480ugc
	for <linux-mtd@lists.infradead.org>;
	Sat, 19 Aug 2006 19:21:07 -0700 (PDT)
Message-ID: <625fc13d0608191921j2d544b04ye48f9e1fa806e0f9@mail.gmail.com>
Date: Sat, 19 Aug 2006 21:21:07 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "k bb" <kbb64@hotmail.com>
Subject: Re: JFFS2 speedup CS vs EBS
In-Reply-To: <BAY114-F342D9E8C64CA69BAA4306A64F0@phx.gbl>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <BAY114-F342D9E8C64CA69BAA4306A64F0@phx.gbl>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 8/15/06, k bb <kbb64@hotmail.com> wrote:
> Linux version 2.6.17uc0
>
> Which of these speed up options options are standard in the 2.6.17 kernel?
> Are they all put in ./fs/jffs2/summary.c?

Eraseblock Summary is in 2.6.17.  Centralized Summary has not yet been
merged in either the upstream kernel or the MTD tree.

josh
