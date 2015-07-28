Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZK6ce-0007kW-4l
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2015 15:16:52 +0000
Subject: Re: [PATCH 0/2] New NAND chip IDs
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <cover.1438093758.git.hramrach@gmail.com>
 <55B79696.40906@redhat.com> <20150728171013.58cbc608@bbrezillon>
Cc: Michal Suchanek <hramrach@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Petros Angelatos <petrosagg@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <55B79CCD.5000804@redhat.com>
Date: Tue, 28 Jul 2015 17:16:29 +0200
MIME-Version: 1.0
In-Reply-To: <20150728171013.58cbc608@bbrezillon>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 07/28/2015 05:10 PM, Boris Brezillon wrote:
> Hi Hans,
>
> On Tue, 28 Jul 2015 16:49:58 +0200
> Hans de Goede <hdegoede@redhat.com> wrote:
>
>> Hi,
>>
>> On 07/28/2015 04:29 PM, Michal Suchanek wrote:
>>> Hello,
>>>
>>> the NAND chips on Cubietech boards are not known to Linux.
>>>
>>> I used Petros Angelatos' patch from sunxi experimental tree for one chip and
>>> added another chip.
>>>
>>> I hope it's ok to send both patches to avoid merge conflict.
>>
>> I do not think that these patches are a good idea, this will lead to an
>> ever growing manual maintained list of ids, and that is not maintainable
>> IMHO.
>>
>> For Samsung chips we only need the ecc strength and size the rest is already
>> detected on the fly, and I've a patch in my personal tree to get the
>> ecc strengt and size from the nand without needing to have an entry per
>> chip:
>>
>> https://github.com/jwrdegoede/linux-sunxi/commit/53b335d33232753b7aa70298009158baadf5a6bf
>>
>> This is IMHO a much better solution.
>
> Hm, IMHO it's not: the nand ids table also store information about
> supported NAND timings, and maybe we'll have to add new things (like
> the read-retry implementation to use for a specific chip).
>
> Moreover, this information can be automatically deduced from the NAND
> id, and we try to keep discoverable info out of the DT.

Note I'm not advocating to add stuff to DT, I'm advocating to not
add entries to the ID table unless it gives us something which we
cannot get another way.

The current samsung nand entries in the table only add ecc strength /
size info over what is already determined by the generic nand scan code,
my patch adds support to get ecc strength / size for samsung nands to
the generic code, this allows at least to remove the current samsung
nand lines, I believe.

Regards,

Hans
