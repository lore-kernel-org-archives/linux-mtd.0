Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16TfWx-0001Oe-00
	for <linux-mtd@lists.infradead.org>; Thu, 24 Jan 2002 08:46:47 +0000
Subject: Re: How to understand :interleave,numeraseregions and regions
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: jmzhong@dtvia-usoft.com
Cc: jffs-dev@axis.com, linux-mtd@lists.infradead.org
In-Reply-To: <200201240304.g0O349RM018586@krynn.axis.se>
References: <200201240304.g0O349RM018586@krynn.axis.se>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 24 Jan 2002 09:57:34 +0100
Message-Id: <1011862654.27784.0.camel@pcjonashg>
Mime-Version: 1.0
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Thu, 2002-01-24 at 11:00, jmzhong@dtvia-usoft.com wrote:
> Hi,all,
>     Could you tell me where the notation about drivers/mtd/chips/amd_flash.c in the
> source code of uClinux  is?
>     I want to know about 	struct amd_flash_private {
> 	int device_type;	
> 	int interleave;	
> 	int numchips;	
> 	unsigned long chipshift;
> //	const char *im_name;
> 	struct flchip chips[0];
> };
> 
> struct amd_flash_info {
> 	const __u16 mfr_id;
> 	const __u16 dev_id;
> 	const char *name;
> 	const u_long size;
> 	const int numeraseregions;
> 	const struct mtd_erase_region_info regions[4];
> };
> How to understand :interleave,numeraseregions and regions?

numeraseregions is the number of elements in the regions array. A region
is an area of the chip that contains sectors of the same size (usually
there are a few regions in the boot block and one region for the other
sectors). interleave is the number of chips that are mounted in parallel
on the bus. The amd_flash driver only supports 16-bit devices with a
buswidth of 16 or 32 bits (interleave 1 or 2).

I would like to ask the MTD people why it's necessary to have a variable
for device_type? Isn't it always possible to calculate the device_type
(buswidth / interleave)?

Best regards
/Jonas
