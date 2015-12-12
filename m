Received: from proxima.lp0.eu ([2001:8b0:ffea:0:205:b4ff:fe12:530])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a7k3G-0004ze-0P
 for linux-mtd@lists.infradead.org; Sat, 12 Dec 2015 13:17:31 +0000
Subject: Re: [PATCH linux-next (v3) 1/3] MIPS: bcm963xx: Add Broadcom BCM963xx
 board nvram data structure
To: Jonas Gorski <jogo@openwrt.org>
References: <566B460F.1040603@simon.arlott.org.uk>
 <CAOiHx=m3cXTePDjH04Yoz3wQO9Ta9jSn=JrkfNgphoPcQVaGXg@mail.gmail.com>
 <566B4D34.9040707@simon.arlott.org.uk>
 <CAOiHx=nrZdvezkyLi0kfvZ6Rp3YtechtP=J2orpUsVkXvA_6HQ@mail.gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 Kevin Cernekee <cernekee@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 MIPS Mailing List <linux-mips@linux-mips.org>, linux-api@vger.kernel.org
From: Simon Arlott <simon@fire.lp0.eu>
Message-ID: <566C1E44.3010506@simon.arlott.org.uk>
Date: Sat, 12 Dec 2015 13:16:52 +0000
MIME-Version: 1.0
In-Reply-To: <CAOiHx=nrZdvezkyLi0kfvZ6Rp3YtechtP=J2orpUsVkXvA_6HQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/12/15 23:29, Jonas Gorski wrote:
> On Fri, Dec 11, 2015 at 11:24 PM, Simon Arlott <simon@fire.lp0.eu> wrote:
>> On 11/12/15 22:02, Jonas Gorski wrote:
>>> On Fri, Dec 11, 2015 at 10:54 PM, Simon Arlott <simon@fire.lp0.eu> wrote:
>>>> Broadcom BCM963xx boards have multiple nvram variants across different
>>>> SoCs with additional checksum fields added whenever the size of the
>>>> nvram was extended.
>>>>
>>>> Add this structure as a header file so that multiple drivers and userspace
>>>> can use it.
>>>>
>>>> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
>>>> ---
>>>> v3: Fix includes/type names, add comments explaining the nvram struct.
>>>>
>>>> v2: Use external struct bcm963xx_nvram definition for bcm963268part.
...
>>>> diff --git a/include/uapi/linux/bcm963xx_nvram.h b/include/uapi/linux/bcm963xx_nvram.h
>>>> new file mode 100644
>>>> index 0000000..2dcb307
>>>> --- /dev/null
>>>> +++ b/include/uapi/linux/bcm963xx_nvram.h
>>>
>>> Why uapi? The nvram layout isn't really enforced to be that way, and
>>> at least Huawei uses a modified one on some devices (in case you
>>> wondered why bcm63xx doesn't fail a crc32-"broken" one), so IMHO it
>>> should be kept for in-kernel use only.
>>
>> Because Florian suggested include/uapi/linux/bcm963xx_nvram.h; I could
>> move it to include/linux/ instead if this is preferred.
...
>>>> + * Do not use the __reserved fields, especially not as an offset for CRC
>>>> + * calculations (use BCM963XX_NVRAM_*_SIZE instead). These may be removed or
>>>> + * repositioned.
> 
> Because I just saw that: Nobody will read that. ;p

I'll move this to include/linux/bcm963xx_nvram.h and omit the linux-api
mailing list when I next send the patch series.

-- 
Simon Arlott
