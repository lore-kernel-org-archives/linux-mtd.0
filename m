Subject: Re: [PATCH 1/1] Add fixup for AT49BV6416 devices which needs to
	swap the region info
From: David Woodhouse <dwmw2@infradead.org>
To: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
In-Reply-To: <11997880443971-git-send-email-hcegtvedt@atmel.com>
References: <11997880443971-git-send-email-hcegtvedt@atmel.com>
Content-Type: text/plain
Date: Tue, 22 Apr 2008 16:23:18 +0100
Message-Id: <1208877798.9212.618.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: kernel@avr32linux.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-01-08 at 11:27 +0100, Hans-Christian Egtvedt wrote:
> This patch adds a fixup for Atmel AT49BV6416 devices which has the erase region
> information swapped. The fixup swaps them correct.

How does this interact with the code in fixup_convert_atmel_pri() which
sets extp->TopBottom? Doesn't the code _already_ print "Swapping erase
regions for broken CFI table" for _all_ top-boot chips?

-- 
dwmw2
