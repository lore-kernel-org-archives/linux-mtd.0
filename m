Message-ID: <502E2EDB.2050200@antcom.de>
Date: Fri, 17 Aug 2012 13:45:31 +0200
From: Roland Stigge <stigge@antcom.de>
MIME-Version: 1.0
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: LPC32xx: Provide DMA filter callbacks via platform
 data
References: <1345122935-22115-1-git-send-email-stigge@antcom.de>
 <1345201311.27859.51.camel@sauron.fi.intel.com>
 <1345201835.27859.52.camel@sauron.fi.intel.com>
 <201208171140.50388.arnd@arndb.de>
In-Reply-To: <201208171140.50388.arnd@arndb.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: srinivas.bakki@nxp.com, linux@arm.linux.org.uk, dedekind1@gmail.com,
 linux-kernel@vger.kernel.org, kevin.wells@nxp.com,
 linux-mtd@lists.infradead.org, aletes.xgr@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/17/2012 01:40 PM, Arnd Bergmann wrote:
>> Actually the mtd patches do not compile-depend on it, sorry, I am
>> dropping it from the MTD tree. Thanks!
> 
> For reference, I'm fine with either outcome, I don't mind seeing an
> occasional collision with subsystem trees, as they tend to be trivial
> to resolve.
> 
> If you split a series to go through multiple git trees, you have to
> ensure that both halves are actually regression free by themselves,

Of course. But in this very case, they are. So I'd prefer pushing them
via different trees because I have other patches for mach-lpc32xx in the
queue and would like to minimize work for you. :-)

Roland
