Subject: Re: Release of UBIL: ubi with log
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brijesh Singh <brij.singh@samsung.com>
In-Reply-To: <6b5362aa1002260458j571852cbl2f2d86130828333a@mail.gmail.com>
References: <6b5362aa1002260458j571852cbl2f2d86130828333a@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 10 May 2010 09:49:35 +0300
Message-ID: <1273474175.2209.61.camel@localhost>
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

Was that SLC or MLC NAND?

> The source code of UBIL can be found in the following git tree:
> http://git.infradead.org/users/brijesh/ubi-2.6.git
> 
> We have tested ubil for samsung nand and onenand. The test results can
> be found in the following git tree:
> http://git.infradead.org/users/brijesh/ubil_results

Did you run any stress tests for UBIL? Which?

I think it is very important to stress test it and make sure is stable.
After that, we can start doing changes required for upstreaming it. I
propose the following roadmap:

The main idea is to make UBIL as stable as possible first. Then, make
sure whatever change we introduce - it stays stable. IOW, run tests
after each change and make sure nothing breaks. With this test-driven
scheme we can add all the needed improvements and keep it working.

> We are working on utilities and design document of UBIL. I will share
> those as soon as possible.
> 
> If someone wants to try, please follow the instructions:
> make menuconfig
>          select ubi as module
>          select ubil feature.
> compile ubi module.

I think UBIL should not be compiled separately. UBI should automatically
detect the format type.

> 1) First mount of ubil is little different than ubi.
> 
> insmod ubi mtd=1,ubinize.
>  (Second parameter "ubinize" is introduced to avoid accidental loss of data.)
> insmod ubifs
> mount ubifs

Why this ubinize parameter exists? Why you cannot detect empty media
just like UBI?

> 2)For next mounts:
> insmod ubi mtd=1
> insmod ubifs
> mount ubifs
> 
> Though UBIL is functionally complete,there is a lot of scope for
> optimizations. All the help is very much appreciated.

The main requirement for upstreaming is to make sure the on-flash format
is stable. Once you are in upstream - you cannot change your on-flash
data structures anymore. Any change will become huge PITA.

Thus, it is very important to think carefully about on-flash format, and
possibly invent mechanisms for future extensions.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
