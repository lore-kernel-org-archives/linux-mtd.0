Date: Fri, 5 Oct 2012 14:58:21 +0200
From: Alessandro Rubini <rubini@unipv.it>
To: linus.walleij@linaro.org
Subject: Re: [PATCH 1/2] ARM: nomadik: switch over to using the FSMC driver
Message-ID: <20121005125821.GA7937@mail.gnudd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: rubini@gnudd.com
In-Reply-To: <CACRpkdYMz05DwtLtHkggvo8VFOtvPLpovwq6fLceeiFK0Wci0Q@mail.gmail.com>
References: <CACRpkdYMz05DwtLtHkggvo8VFOtvPLpovwq6fLceeiFK0Wci0Q@mail.gmail.com>
 <1349335709-13399-1-git-send-email-linus.walleij@linaro.org>
Cc: dwmw2@infradead.org, mturquette@linaro.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, mturquette@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> The Nomadik NAND driver is really just a subset of the existing
>> FSMC driver,
>>
>> Cc: Alessandro Rubini <rubini@unipv.it>

> Still requesting Mike's ACK, but not for merging through ARM SoC
> but through MTD.

Oh, and please get mine too. Sorry for not noticing the message, busy
times...

I'm pretty sure there was no fsmc driver back then. But clearly
something coming from the vendor and used on several boards is better
then something made by an external consultant for a specific
evaluation board. So ok to ditch my nand driver.

Acked-by: Alessandro Rubini <rubini@unipv.it>
