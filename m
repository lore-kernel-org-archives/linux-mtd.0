Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZK6sD-0003H2-Ej
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2015 15:32:58 +0000
Subject: Re: [PATCH 0/2] New NAND chip IDs
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <cover.1438093758.git.hramrach@gmail.com>
 <55B79696.40906@redhat.com> <20150728171940.481e8581@bbrezillon>
 <20150728173035.2cf446c3@bbrezillon>
Cc: Michal Suchanek <hramrach@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Petros Angelatos <petrosagg@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <55B7A092.80606@redhat.com>
Date: Tue, 28 Jul 2015 17:32:34 +0200
MIME-Version: 1.0
In-Reply-To: <20150728173035.2cf446c3@bbrezillon>
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

On 07/28/2015 05:30 PM, Boris Brezillon wrote:
> On Tue, 28 Jul 2015 17:19:40 +0200
> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
>
>> Hi Hans,
>>
>> Here is a more appropriate answer ;-)
>>
>> On Tue, 28 Jul 2015 16:49:58 +0200
>> Hans de Goede <hdegoede@redhat.com> wrote:
>>
>>> Hi,
>>>
>>> On 07/28/2015 04:29 PM, Michal Suchanek wrote:
>>>> Hello,
>>>>
>>>> the NAND chips on Cubietech boards are not known to Linux.
>>>>
>>>> I used Petros Angelatos' patch from sunxi experimental tree for one chip and
>>>> added another chip.
>>>>
>>>> I hope it's ok to send both patches to avoid merge conflict.
>>>
>>> I do not think that these patches are a good idea, this will lead to an
>>> ever growing manual maintained list of ids, and that is not maintainable
>>> IMHO.
>>>
>>> For Samsung chips we only need the ecc strength and size the rest is already
>>> detected on the fly, and I've a patch in my personal tree to get the
>>> ecc strengt and size from the nand without needing to have an entry per
>>> chip:
>>>
>>> https://github.com/jwrdegoede/linux-sunxi/commit/53b335d33232753b7aa70298009158baadf5a6bf
>>>
>>> This is IMHO a much better solution.
>>
>> Yes, indeed, this is a better approach, but AFAIR, not all Samsung
>> chips use this layout to expose the ECC strength/size info, and I
>> guess this is why this method is not used to retrieve the ECC
>> requirements.
>
> At least this was true for Hynix chips (see this thread [1]).
>
> [1]http://comments.gmane.org/gmane.linux.drivers.mtd/50252

Correct, I tried to write a similar patch and come to the same
conclusion, there is no way to reliable detect ecc strength / size
in a generic manner for hynix ic-s, for samsung ic-s the bits used
seem to be consistent for all samsung nands though. See the list of
datasheets I checked in the commit msg.

Regards,

Hans

>
