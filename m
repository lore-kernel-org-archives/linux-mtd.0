Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LmTOI-0001GT-Rh
	for linux-mtd@lists.infradead.org; Wed, 25 Mar 2009 13:43:41 +0000
Message-ID: <49CA3503.5040006@grandegger.com>
Date: Wed, 25 Mar 2009 14:43:31 +0100
From: Wolfgang Grandegger <wg@grandegger.com>
MIME-Version: 1.0
To: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v3 1/4] NAND: FSL-UPM: add multi chip support
References: <1237975701-23201-1-git-send-email-wg@grandegger.com>	
	<1237975701-23201-2-git-send-email-wg@grandegger.com>	
	<fa686aa40903250631w6a0cc8b9p3b2e3c1348e0acee@mail.gmail.com>
	<fa686aa40903250632o759921c8n1ae8d17286c1f976@mail.gmail.com>
In-Reply-To: <fa686aa40903250632o759921c8n1ae8d17286c1f976@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org,
	devicetree-discuss list <devicetree-discuss@ozlabs.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Grant Likely wrote:
> On Wed, Mar 25, 2009 at 7:31 AM, Grant Likely <grant.likely@secretlab.ca> wrote:
>> On Wed, Mar 25, 2009 at 4:08 AM, Wolfgang Grandegger <wg@grandegger.com> wrote:
>>> This patch adds support for multi-chip NAND devices to the FSL-UPM
>>> driver. This requires support for multiple GPIOs for the RNB pins.
>>> The NAND chips are selected through address lines defined by the
>>> FDT property "chip-offset".
>>>
>>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
>> Hi Wolfgang,
>>
>> Can you please send a sample device tree snippit for this and add
>> documentation updates to your patch for the extended binding?
> 
> Oh, and cc: devicetree-discuss@ozlabs.org in your next posting.

OK, does patch 3/4 not already contain what you are looking for? See:

http://ozlabs.org/pipermail/linuxppc-dev/2009-March/069787.html

I separated it from the NAND patches because they go through the MTD
maintainer(s).

BTW: did you have a chance to look into the following RFC on I2C bus
speed setting?

 http://ozlabs.org/pipermail/linuxppc-dev/2009-March/069489.html

Thanks,

Wolfgang.
