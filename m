From: David Woodhouse <dwmw2@infradead.org>
To: David Vrabel <dvrabel@arcom.com>
In-Reply-To: <403C8225.3040801@arcom.com>
References: <20040225012449.90118.qmail@web20722.mail.yahoo.com>
	 <403C8225.3040801@arcom.com>
Content-Type: text/plain
Message-Id: <1077712272.7826.634.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 25 Feb 2004 12:31:12 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd list <linux-mtd@lists.infradead.org>
Subject: Re: Why CFI_DEVICETYPE_X8 in cfi_send_gen_cmd()?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-02-25 at 11:08 +0000, David Vrabel wrote:
> Shawn Jin wrote:
> > 
> > In cfi_cmdset_0002.c, there is a piece of comment stating that the
> > CFI_DEVICETYPE_X8 is needed even when cfi->device_type !=
> > CFI_DEVICETYPE_X8. Why is it the case?

Because you're using it in this case to shift the unlock address. But
the unlock address was _already_ shifted, because of way the table in
jedec_probe.c works. It already gives you different unlock addresses
according to the device type, and they are _already_ shifted. You're
given a byte-address by the table and that's why you use it as one.

I suspect we could ditch the multiple entries in the table and revert to
using only one 'uaddr', and shifting it with the device type as you 
(er, he) suggest.


-- 
dwmw2
