Subject: Re: [PATCH] [OneNAND] OTP support re-implementation 1/1
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Amul Kumar Saha <amul.saha@samsung.com>
In-Reply-To: <6098B9D32DCD48C387EF96034FFFC55D@sisodomain.com>
References: <EF4202CC14044212993EE17E6010D5E7@sisodomain.com>
	<87D6E94B11734CE1A253D9AE203F4192@sisodomain.com>
	<4A94CF0A.6060106@gmail.com>
	<6098B9D32DCD48C387EF96034FFFC55D@sisodomain.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 28 Aug 2009 16:38:56 +0300
Message-Id: <1251466736.3514.10.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, kyungmin.park@samsung.com,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-08-27 at 12:07 +0530, Amul Kumar Saha wrote:
> >> Re-implemented OTP support for OneNAND
> >> Added following features to OneNAND
> >> 1. Lock only 1st Block in OneNAND
> >> 2. Lock BOTH 1st Block and OTP Block in OneNAND
> >
> > -ENOPARSE
> >
> > Large patches like this normally require good explanations of what is
> > done, why it is done, which problem it solves, how it is done, etc.
> >
> 
> What is OTP in OneNAND?
> The device includes,
> 1. one block-sized OTP (One Time Programmable) area and
> 2. user-controlled 1st block OTP(Block 0)
> that can be used to increase system security or to provide identification capabilities.
> 
> What is done?
> In OneNAND, one block of the NAND Array is set aside as an OTP memory area, and 1st Block (Block 0) 
> can be used as OTP area.
> This area, available to the user, can be configured and locked with secured user information.
> The OTP block can be read, programmed and locked using the same operations as any other NAND Flash 
> Array
> memory block. After issuing an OTP-Lock, OTP block cannot be erased. OTP block is fully-guaranteed 
> to be a valid block.
> 
> Why it is done? (Impact)
> Locking the 1st Block OTP has the effect of a 'Write-protect' to guard against accidental 
> re-programming of data stored in the 1st block and OTP Block.
> 
> Which problem it solves?
> OTP support is provided in the existing implementation of OneNAND/Flex-OneNAND driver, but it is not 
> working with OneNAND devices.
> Have observed the following in current OTP OneNAND Implmentation,
> 1. DataSheet specific sequence to lock the OTP Area is not followed.
> 2. Certain functions are quiet generic to cope with OTP specific activity.
> This patch re-implements OTP support for OneNAND device.
> 
> How it is done?
> For all blocks, 8th word is available to the user.
> However,in case of OTP Block, 8th word of sector 0, page 0 is reserved as OTP Locking Bit area.
> Therefore, in case of OTP Block, user usage on this area is prohibited.
> Condition specific values are entered in the 8th word, sector0, page 0 of the OTP block during the 
> process of issuing an OTP-Lock.
> The possible conditions are:-
> 1. Only 1st Block Lock
> 2. Only OTP Block Lock
> 3. Lock both the 1st Block and the OTP Block
> 
> What feature additions have been done in this patch?
> This patch adds feature for:-
> 1. Only 1st Block Lock
> 2. Lock both the 1st Block and the OTP Block 

Could you insert the description to the patch and re-send it, please?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
