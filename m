Received: from host-212-158-219-180.bulldogdsl.com ([212.158.219.180]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Ca1aV-0003mS-JC
	for linux-mtd@lists.infradead.org; Thu, 02 Dec 2004 19:46:21 -0500
Date: Fri, 3 Dec 2004 00:46:01 +0000
From: Ben Dooks <ben@fluff.org.uk>
To: "K.F.J. Martens" <gmc@metro.cx>
Message-ID: <20041203004601.GA29522@home.fluff.org>
References: <20041202225607.GH3233@metro.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20041202225607.GH3233@metro.cx>
Sender: Ben Dooks <ben@fluff.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Horrible Bug? AMD29LV400BB with mtd in 2.6.10rc2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 02, 2004 at 11:56:07PM +0100, K.F.J. Martens wrote:
> Hi All,
> 
> I'm currently developing a flash file system for the TomTom GO, a car
> navigation system that employs an ARM processor.
> 
> In it is an EON29LV400BB flash chip, which is entirely compatible with
> AMD's AM29LV400BB.
> 
> Now, what I did was copy the AM29LV400BB definition in
> mtd/chips/jedec_probe.c to a new definition in the struct amd_flash_info
> array jedec_table like so:
> 
> 
>         },{
>                 .mfr_id         = MANUFACTURER_EON, 
>                 .dev_id         = EON29LV400BB,
>                 .name           = "EON AM29LV400BB",
>                 .uaddr          = {
>                         [0] = MTD_UADDR_0x0AAA_0x0555,  /* x8 */
>                         [1] = MTD_UADDR_0x0555_0x02AA,  /* x16 */
>                 },
>                 .DevSize        = SIZE_512KiB,
>                 .CmdSet         = P_ID_AMD_STD,
>                 .NumEraseRegions= 4,
>                 .regions        = {
>                         ERASEINFO(0x04000,1),
>                         ERASEINFO(0x02000,2),
>                         ERASEINFO(0x08000,1),
>                         ERASEINFO(0x10000,7),
>                 }
>         }, {
> 
> 
> 
> Now, here comes. This does not work, and the reason is that the x8 and
> x16 addresses are swapped. It's a bit late now to hook up one of those
> devices and paste the exact error message, but it was something along
> the line of 'MTD jedec_match(): 0x0555 0x0aaa did not match'
> 
> If I reverse them like so:
> 
> 
>                         [0] = MTD_UADDR_0x0555_0x02AA,  /* x8 */
>                         [1] = MTD_UADDR_0x0AAA_0x0555,  /* x16 */
> 

There has been some fixing in the jedec and similar probe code
to fix the use of the fields of device width / overlap due to
incorrect addressing being used for the chip commands. 

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
