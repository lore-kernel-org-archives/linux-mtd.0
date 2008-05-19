Received: from yw-out-1718.google.com ([74.125.46.158])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jy23N-0006x3-4I
	for linux-mtd@lists.infradead.org; Mon, 19 May 2008 09:53:13 +0000
Received: by yw-out-1718.google.com with SMTP id 5so1775935ywm.72
	for <linux-mtd@lists.infradead.org>;
	Mon, 19 May 2008 02:53:11 -0700 (PDT)
Message-ID: <386072610805190253g42d47d81w794b3c14c15aa890@mail.gmail.com>
Date: Mon, 19 May 2008 17:53:11 +0800
From: "Bryan Wu" <cooloney@kernel.org>
Sender: cooloney.lkml@gmail.com
To: "Hennerich, Michael" <Michael.Hennerich@analog.com>
Subject: Re: [PATCH 1/1] mtd m25p80: fix bug - ATmel spi flash fails to be
	copied to
In-Reply-To: <8A42379416420646B9BFAC9682273B6D0183AE38@limkexm3.ad.analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1211021526-24076-1-git-send-email-cooloney@kernel.org>
	<8A42379416420646B9BFAC9682273B6D0183AE38@limkexm3.ad.analog.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	mike@steroidmicros.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 19, 2008 at 5:12 PM, Hennerich, Michael
<Michael.Hennerich@analog.com> wrote:
>>+      spi_write(flash->spi, flash->command, 2);
>>+
>>+      return spi_write(flash->spi, flash->command, 2);
>
>
> I just noticed that write_sr contains a duplicated spi_write.
> Bryan sends out a new patch.
>


No problem, it is my fault. I should review the patch carefully.

Thanks
-Bryan
