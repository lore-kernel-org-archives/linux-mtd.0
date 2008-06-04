Subject: Re: [PATCH 1/1] mtd m25p80: fix bug - ATmel spi flash fails to be
	copied to
From: David Woodhouse <dwmw2@infradead.org>
To: Bryan Wu <cooloney@kernel.org>
In-Reply-To: <386072610805190253g42d47d81w794b3c14c15aa890@mail.gmail.com>
References: <1211021526-24076-1-git-send-email-cooloney@kernel.org>
	<8A42379416420646B9BFAC9682273B6D0183AE38@limkexm3.ad.analog.com>
	<386072610805190253g42d47d81w794b3c14c15aa890@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 04 Jun 2008 17:58:43 +0100
Message-Id: <1212598723.32207.130.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: mike@steroidmicros.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, "Hennerich,
	Michael" <Michael.Hennerich@analog.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-05-19 at 17:53 +0800, Bryan Wu wrote:
> 
> >
> > I just noticed that write_sr contains a duplicated spi_write.
> > Bryan sends out a new patch.
> >
> 
> 
> No problem, it is my fault. I should review the patch carefully.

Was there a new patch coming?

-- 
dwmw2
