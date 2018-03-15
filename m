Received: from mo6-p05-ob.smtp.rzone.de ([2a01:238:20a:202:5305::12])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ewUQy-0007RG-8l
 for linux-mtd@lists.infradead.org; Thu, 15 Mar 2018 15:05:02 +0000
Subject: Re: Aw: Re: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found.
 is25lp256d
To: Frank Smith <smith-f@gmx.de>
Cc: linux-mtd@lists.infradead.org
References: <trinity-f2c4ec20-92aa-4549-961a-54ada3bed090-1521123187434@3c-app-gmx-bs35>
 <4fa247df-ecd3-1034-aaa1-45bfdc1bcda8@exceet.de>
 <trinity-16b93208-69da-44fd-8882-e4852cb4837b-1521125017314@3c-app-gmx-bs35>
From: Frieder Schrempf <frieder.schrempf@exceet.de>
Message-ID: <c88b8eb2-b613-9108-c5df-095ec3e0a1e2@exceet.de>
Date: Thu, 15 Mar 2018 16:04:35 +0100
MIME-Version: 1.0
In-Reply-To: <trinity-16b93208-69da-44fd-8882-e4852cb4837b-1521125017314@3c-app-gmx-bs35>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 15.03.2018 15:43, Frank Smith wrote:
>> I guess you need to set SPI_NOR_4B_OPCODES flag to use 4 byte addressing
>> and be able to access memory above 16MB.
> 
> SPI_NOR_4B_OPCODES does not have an effect. Still these error above from 0xA00000 to 0xeXXXXX
> 
> jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00d60024: 0x0069 instead
> 
> and
> 
> jffs2: Empty flash at 0x00d6fe34 ends at 0x00d6fe3c
> 
> What do you mean by, be able to access memory above 16MB? How to verify this?
> 

Unfortunately I'm not an expert, but what I do know is, that you need 4 
byte addresses to be able to access memory above 16MiB (simply because 
with 3 bytes you can only address 2^24 bytes = 16MiB).

And in the spi-nor driver you can set SPI_NOR_4B_OPCODES to tell the 
driver to use the special opcodes for 4 byte mode.

But I haven't looked into this and I don't know if ISSI chips need any 
special handling.

Also as I already said, I'm not an expert and other people on the list 
can probably tell you more about this.

Regards,

Frieder
