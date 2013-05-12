Received: from mail-wi0-x233.google.com ([2a00:1450:400c:c05::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UbXeD-00045b-6y
 for linux-mtd@lists.infradead.org; Sun, 12 May 2013 14:53:14 +0000
Received: by mail-wi0-f179.google.com with SMTP id hq7so346901wib.12
 for <linux-mtd@lists.infradead.org>; Sun, 12 May 2013 07:52:49 -0700 (PDT)
Sender: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <518FACBF.4040606@openwrt.org>
Date: Sun, 12 May 2013 16:52:47 +0200
From: Florian Fainelli <florian@openwrt.org>
MIME-Version: 1.0
To: Jonas Gorski <jogo@openwrt.org>
Subject: Re: [PATCH 2/3] MIPS: BCM63XX: export PSI size from nvram
References: <1364044070-10486-1-git-send-email-jogo@openwrt.org>
 <1364044070-10486-3-git-send-email-jogo@openwrt.org>
 <1368189407.26780.159.camel@sauron.fi.intel.com>
 <CAOiHx=m+ZuBcj=qmTtytWouCbtbj+_OX3dS8x_0=kHEBFZ+TmA@mail.gmail.com>
In-Reply-To: <CAOiHx=m+ZuBcj=qmTtytWouCbtbj+_OX3dS8x_0=kHEBFZ+TmA@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mips@linux-mips.org, dedekind1@gmail.com,
 Kevin Cernekee <cernekee@gmail.com>, linux-mtd@lists.infradead.org,
 Maxime Bizon <mbizon@freebox.fr>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 12/05/2013 12:48, Jonas Gorski a écrit :
> On Fri, May 10, 2013 at 2:36 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> On Sat, 2013-03-23 at 14:07 +0100, Jonas Gorski wrote:
>>> Signed-off-by: Jonas Gorski <jogo@openwrt.org>
>>> ---
>>>   arch/mips/bcm63xx/nvram.c                          |   11 +++++++++++
>>>   arch/mips/include/asm/mach-bcm63xx/bcm63xx_nvram.h |    2 ++
>>>   2 files changed, 13 insertions(+)
>>
>> Acks from MIPS folks would be nice to have, but I pushed this patch to
>> the l2-mtd.git tree, thanks!
>
> I had expected Florian's valid comment from preventing this series
> from going in, but if you pushed it already then I will fix the return
> type problem  that Florian pointed out in a separate patch (or rather
> add add some range check for nvram.psi_size). Luckily it is a
> theoretical issue only, as I haven't seen a device yet with an invalid
> value.

Right, but this is no blocker from my perspective. As about the MIPS 
folks, Maxime, Kevin, Jonas and myself have been the "historical" 
contributors to the MIPS BCM63XX port, so I would consider Jonas to be 
authoritave here for these paches. John and Ralf usually do not comment 
unless the see something bad.
--
Florian
