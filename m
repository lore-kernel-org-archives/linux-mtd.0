Received: from eu1sys200aog113.obsmtp.com ([207.126.144.135])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7hbC-0005cF-Pa
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2012 06:22:15 +0000
Message-ID: <4F6038E7.8090608@st.com>
Date: Wed, 14 Mar 2012 11:51:27 +0530
From: Vipin Kumar <vipin.kumar@st.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: [PATCH 00/18] mtd/nand/fsmc related modifications
References: <cover.1331119143.git.vipin.kumar@st.com>
 <1331299599.29445.28.camel@sauron.fi.intel.com>
In-Reply-To: <1331299599.29445.28.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3/9/2012 6:56 PM, Artem Bityutskiy wrote:
> On Wed, 2012-03-07 at 17:00 +0530, Vipin Kumar wrote:
>> Hello All,
>>
>> Please find the nand/fsmc driver modifications
>> Major modifications include
>> - DMA support
>> - Word read/write support to improve performance
>> - Move platform related things(ALE/CLE) from driver to platfrom files
>> - Add default partition support for more devices with erase sizes (256KB, 512KB,
>> 		1024KB, 2048KB)
>> - Bugfixes
>> 	- Read only 512 + 13 bytes for 8bit NAND devices
>> 	- Flip the bit only if the error index is<  4096
>> 	- Fixed data abort inside change_bit()
>
> Pushed patches 1-7 to l2-mtd.git. Patch 8 look wrong to me, the other
> won't apply without patch 8 so I did not look beyond patch 7. Thanks!
>
> But please, confirm that it is OK to have only some of these patches
> merged, not the complete set. Thanks!
>

Please find the patch-set v2 in another mail. This patch-set contains 
only the remaining patches from the original patch-set

Regards
Vipin
