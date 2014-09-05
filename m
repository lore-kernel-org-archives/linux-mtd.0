Date: Fri, 5 Sep 2014 12:41:40 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: klightspeed@killerwolves.net
Subject: Re: [PATCH] ARM: MVEBU: Netgear RN102: Use Hardware BCH ECC
Message-ID: <20140905154140.GA1377@arch.hh.imgtec.org>
References: <1409898233-9273-1-git-send-email-klightspeed@killerwolves.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1409898233-9273-1-git-send-email-klightspeed@killerwolves.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 Arnaud Ebalard <arno@natisbad.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(Fixing Cc list: dropping devicetree guys, and adding Brian and MTD instead)

On 05 Sep 04:23 PM, klightspeed@killerwolves.net wrote:
> The bootloader on the Netgear ReadyNAS RN102 uses Hardware BCH ECC
> (strength = 4), while the pxa3xx NAND driver by default uses 
> Hamming ECC (strength = 1).
> 

Hm, I guess the device (Hynix H27U1G8F2BTR) does not support ONFI,
and the kernel is just taking the legacy ECC. The flash specs makes no
mention to ONFI, so probably no ONFI here.

> This patch changes the ECC mode on these machines to match that
> of the bootloader and of the stock firmware, so that for example
> updating the kernel is possible without requiring a serial
> connection.
> 
> This patch depends on commit 5b3e507 (mtd: nand: pxa3xx: Use ECC
> strength and step size devicetree binding)
> 
> Signed-off-by: Ben Peddell <klightspeed@killerwolves.net>

Looks good to me, since Arnaud reports this is the correct ECC scheme:
http://natisbad.org/NAS2/index.html#hw-nand

Acked-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Thanks for the fix,
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
