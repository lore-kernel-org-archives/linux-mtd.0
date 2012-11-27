Message-ID: <50B50143.7080408@newsguy.com>
Date: Tue, 27 Nov 2012 10:06:59 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH] MTD: at91: atmel_nand: return bit flips for the PMECC
 read_page()
References: <1353474863-28430-1-git-send-email-josh.wu@atmel.com>
 <50ACA764.3030002@atmel.com> <50AD9E8E.7050402@atmel.com>
In-Reply-To: <50AD9E8E.7050402@atmel.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: plagnioj@jcrosoft.com, Nicolas Ferre <nicolas.ferre@atmel.com>,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/21/2012 07:39 PM, Josh Wu wrote:
> Hi, Nicolas
> 
> On 11/21/2012 6:05 PM, Nicolas Ferre wrote:
>> On 11/21/2012 06:14 AM, Josh Wu :
>>>
>> Can we have more comment to figure out why it is needed please?
> 
> I will add following comment in the commit message in the v2 version.
> 
> Since the commit: 3f91e94f7f511de74c0d2abe08672ccdbdd1961c ("mtd: nand:
> read_page() returns max_bitflips ()")
> The ecc.read_page() method for nand drivers is changed to return the maximum
> number of bitflips instead of just returning 0.
> 
> And the nand.h is also explain that. I would like to adapt to it.


This patch avails the atmel_nand device of a change that was merged to the
kernel mtd code several months ago.  That change fixed a problem where higher
layers that use the -EUCLEAN return code to make judgements on block wear (e.g.
ubi) were marking blocks as bad when a normal number of bitflip corrections were
made.  The problem affected newer nands with greater ecc strength.  See the
entry on 'bitflip_threshold' in Documentation/ABI/testing/sysfs-class-mtd

Thanks,
Mike
