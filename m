Message-ID: <4FB25EAC.10205@antcom.de>
Date: Tue, 15 May 2012 15:48:28 +0200
From: Roland Stigge <stigge@antcom.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] MTD: LPC32xx SLC NAND driver
References: <1336829386-23301-1-git-send-email-stigge@antcom.de>
 <1337068543.2528.143.camel@sauron.fi.intel.com>
 <4FB2109A.2080505@freescale.com> <4FB25837.2050603@antcom.de>
 <1337088703.2528.208.camel@sauron.fi.intel.com>
In-Reply-To: <1337088703.2528.208.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: srinivas.bakki@nxp.com, Lars-Peter Clausen <lars@metafoo.de>,
 linux-doc@vger.kernel.org, Lei Wen <leiwen@marvell.com>,
 devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kevin.wells@nxp.com, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dwmw2@infradead.org, Bastian Hecht <hechtb@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/15/2012 03:31 PM, Artem Bityutskiy wrote:
>> As I understand loops_per_jiffy, this loop will take much longer
>> than the 100 ms you defined above?
> 
> Not sure about much, but longer. The idea is that this is about
> the error path so if we report -EIO with a slight delay - no
> problem.

Turned out that the condition (FIFO empty) is always true for me.
Keeping the check for safety reasons for now, doing the timeout with
msleep()s which should be (cpu-wise) "social" enough and are
unexpected anyway but do approximate the ms timeout more precisely.

Roland
