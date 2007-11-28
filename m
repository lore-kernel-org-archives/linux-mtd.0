Subject: Re: [PATCH] MTD: pasemi_nand driver
From: David Woodhouse <dwmw2@infradead.org>
To: Olof Johansson <olof@lixom.net>
In-Reply-To: <20071128221448.GA1144@lixom.net>
References: <20071128221448.GA1144@lixom.net>
Content-Type: text/plain
Date: Wed, 28 Nov 2007 22:40:32 +0000
Message-Id: <1196289632.27384.0.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, egor@pasemi.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 2007-11-28 at 16:14 -0600, Olof Johansson wrote:
> Plumbing for NAND connected via localbus on PA Semi PWRficient-based
> boards.

Any reason it lacks MODULE_DEVICE_TABLE() ?

I note electra-ide lacks it too. So no autoload of either.

-- 
dwmw2
