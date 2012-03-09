Received: from eu1sys200aog112.obsmtp.com ([207.126.144.133])
 by casper.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5wML-0007iQ-Ir
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 09:43:39 +0000
Message-ID: <4F59D095.9050704@st.com>
Date: Fri, 9 Mar 2012 15:12:45 +0530
From: Vipin Kumar <vipin.kumar@st.com>
MIME-Version: 1.0
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 18/18] fsmc/nand: Add DMA support
References: <cover.1331119143.git.vipin.kumar@st.com>
 <b35532ebcf4ae0c89dd4c8e9834829104b5cdb37.1331119143.git.vipin.kumar@st.com>
 <CACRpkdbiZe3NzA2ekmf7q8=A3r9KU2hFHcToLW3CWdu=i9iXUg@mail.gmail.com>
In-Reply-To: <CACRpkdbiZe3NzA2ekmf7q8=A3r9KU2hFHcToLW3CWdu=i9iXUg@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Vinod Koul <vinod.koul@intel.com>,
 "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
 Dan Williams <dan.j.williams@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3/7/2012 9:39 PM, Linus Walleij wrote:
> On Wed, Mar 7, 2012 at 12:31 PM, Vipin Kumar<vipin.kumar@st.com>  wrote:
>
>> The fsmc_nand driver uses cpu to read/write onto the device. This is inefficient
>> because of two reasons
>> - the cpu gets locked on AHB bus while reading from NAND
>> - the cpu is unnecessarily used when dma can do the job
>>
>> This patch adds the support for accessing the device through DMA
>
> Please elaborate a bit on how this is done, because I think it's new
> stuff.
>
> It appears that the FSMC is not like a slave device, i.e. not taking a
> stream of bytes. Instead you use the memcpy() portions of the
> dmaengine API to move data in/out of the flash pages to the
> page currently handled by the controller.
>

Yes, that's right. memcpy portions of dmaengine API are being used to 
move the data in/out of flash pages

> Is this correct? I think it's pretty interesting since it's a new usecase
> for in-kernel memcpy() which (AFAIK) has so far only been used
> to accelerate network packet copying (correct me if wrong!).
>

I also saw the same use case in drivers/ata/pata_arasan_cf.c. Have a 
look at dma_xfer routine in this file

Regards
Vipin
