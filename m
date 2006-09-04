Received: from ug-out-1314.google.com ([66.249.92.172])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GKEAG-0002D7-QS
	for linux-mtd@lists.infradead.org; Mon, 04 Sep 2006 14:07:01 +0100
Received: by ug-out-1314.google.com with SMTP id u40so1840993ugc
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Sep 2006 06:06:00 -0700 (PDT)
Message-ID: <625fc13d0609040605o313f3910yca80cb29b76ebc60@mail.gmail.com>
Date: Mon, 4 Sep 2006 08:05:59 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: Aubrey <aubreylee@gmail.com>
Subject: Re: [PATCH] Fill more device IDS in the structure of m25p80 driver
In-Reply-To: <6d6a94c50609040146k3538ef21x2a6d426f344f1e2e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <6d6a94c50609040146k3538ef21x2a6d426f344f1e2e@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 9/4/06, Aubrey <aubreylee@gmail.com> wrote:
> Hi all,
>
> the structure:
> struct flash_info __devinitdata m25p_data [] = {
> /* REVISIT: fill in JEDEC ids, for parts that have them */
> ...
> };
>
> has a bunch of missing fields (like the JEDEC ids indicated) ... this
> causes problems when actually trying to use some ST parts as it gets
> detected incorrectly
>
> The following is the patch.

The patch appears to have corrupted whitespace.  Your mailer probably
mangled it.  Care to try and fix it and resend?

thx,
josh
