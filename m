Message-ID: <4F3C712A.5060406@gmail.com>
Date: Wed, 15 Feb 2012 18:59:54 -0800
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: fix the wrong check condition
References: <1329302008-10228-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1329302008-10228-1-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Matthieu Castet <matthieu.castet@parrot.com>,
 linux-arm-kernel@lists.infradead.org, Florian Fainelli <ffainelli@freebox.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(Add Florian and Matthieu)

On 2/15/2012 2:33 AM, Huang Shijie wrote:
> If we use `||` check condition, many NAND chips which are not
> ONFI nands have to do the ONFI detection.

Running the ONFI detection on non-ONFI NAND should not, ideally, be a 
problem. They should fail one or both tests included in the routine: the 
'O N F I' string check or the CRC calculation.

> Use `&&` here to detect the ONFI NAND when we can not find any type
> in the nand_flash_ids.

There are many chips whose ID might be in the NAND table but for which 
it is preferable (or even required) to check by ONFI for one reason or 
another. For instance, some ONFI chips might use odd-sized OOB that 
isn't in the ID decoding algorithm.

The current `||` check is, I think, designed to weed out old small-page 
NAND only, which define both 'name' and 'pagesize' in the table.

So in short: the current code works as intended.

Brian
