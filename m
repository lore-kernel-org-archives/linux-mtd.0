Subject: Re: Release of UBIL: ubi with log
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brijesh Singh <brij.singh@samsung.com>
In-Reply-To: <6b5362aa1002260458j571852cbl2f2d86130828333a@mail.gmail.com>
References: <6b5362aa1002260458j571852cbl2f2d86130828333a@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 06 Apr 2010 11:31:38 +0300
Message-ID: <1270542698.6754.7.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: brijesh.s.singh@gmail.com, rohitvdongre@gmail.com,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
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
> We have tested ubil for samsung nand and onenand. The test results can
> be found in the following git tree:
> http://git.infradead.org/users/brijesh/ubil_results
> 
> We are working on utilities and design document of UBIL. I will share
> those as soon as possible.

Is there any doc available?

I've briefly looked at the source code, and found out that:

1. It looks like code from UBIFS, but tweaked and transformed, is this
right?
2. Various small coding style things which do not correspond to UBI
coding style. I usually want contributors to use the same style to keep
the UBI code uniform and consistent.
3. A design document would be cool.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
