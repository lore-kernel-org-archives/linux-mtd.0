From: David Woodhouse <dwmw2@infradead.org>
To: Fabian de Bruyn <fdebruyn@interact-automation.nl>
In-Reply-To: <40584D89.6040202@interact-automation.nl>
References: <40584D89.6040202@interact-automation.nl>
Content-Type: text/plain
Message-Id: <1079529037.16952.72.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 17 Mar 2004 13:10:38 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: DIMM-PC/386-B Flash disk access
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-03-17 at 14:07 +0100, Fabian de Bruyn wrote:
> Hi,
> 
> I'm working on a embedded system usgin an 386 DIMM-PC from Kontron. It 
> does not have an IDE flashdisk but an FSS flashdisk. The producer can't 
> tel me how I can reach the flashdisk (I/O adresses). They say it is 
> confidential. Is there anybody that knows how I can get it to work under 
> Linux ? Now it works with Caldera DR-DOS through BIOS 13h interrupts.

Do you have any other information? What does it look like? What messages
do you see on the screen when it initialises? If you use DEBUG under DOS
and step through the INT 13h handler, what is it doing? ...

-- 
dwmw2
