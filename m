Received: from ug-out-1314.google.com ([66.249.92.171])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HZzhh-0000fy-Qw
	for linux-mtd@lists.infradead.org; Fri, 06 Apr 2007 21:26:59 -0400
Received: by ug-out-1314.google.com with SMTP id m2so1194716uge
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 Apr 2007 18:26:56 -0700 (PDT)
Message-ID: <625fc13d0704061826o6abfc33pd4c11173121561d5@mail.gmail.com>
Date: Fri, 6 Apr 2007 20:26:55 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Charles Manning" <manningc2@actrix.gen.nz>
Subject: Re: mtd_info/mtd_info_user>size wrong type
In-Reply-To: <200704070849.38048.manningc2@actrix.gen.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <200704070849.38048.manningc2@actrix.gen.nz>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/6/07, Charles Manning <manningc2@actrix.gen.nz> wrote:
> Folks
> As people are starting to use larger NAND partitions (4GB+), an inconsistency
> in the size field has become apparent.
>
> This is a unint32_t which is clearly too small for modern NAND arrays.

Yes, known issue.

> The read/write funcions use loff_t which is correct.
>
> It would seem that size needs to be increated to loff_t too.

Have you tried doing that?  I seem to recall hearing that it was a bit
more involved than just changing the size member to be 64 bit.

josh
