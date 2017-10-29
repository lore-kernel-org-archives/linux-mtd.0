Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e8t6f-0006KO-OD
 for linux-mtd@lists.infradead.org; Sun, 29 Oct 2017 19:18:51 +0000
Received: by mail-pf0-x242.google.com with SMTP id p87so9112193pfj.3
 for <linux-mtd@lists.infradead.org>; Sun, 29 Oct 2017 12:18:29 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] mtd: intel-spi: Add support for Intel Lewisburg
 SPI serial flash controller
To: Marek Vasut <marek.vasut@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, cyrille.pitchen@wedev4u.fr,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <9da18c4fbcb55130164735352b5ce9ba11b9a63c.1509270992.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <630c7d49-c0cc-4d4e-27d9-5e60b797d9f7@gmail.com>
 <20171029101603.GF29656@lahna.fi.intel.com>
 <bf02ff14-838b-4710-172b-2e789ba521c9@gmail.com>
From: "Kuppuswamy, Sathyanarayanan" <sathyaosid@gmail.com>
Message-ID: <5b6f82eb-a720-5466-57e1-983f6410e257@gmail.com>
Date: Sun, 29 Oct 2017 12:18:28 -0700
MIME-Version: 1.0
In-Reply-To: <bf02ff14-838b-4710-172b-2e789ba521c9@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,


On 10/29/2017 3:34 AM, Marek Vasut wrote:
> On 10/29/2017 11:16 AM, Mika Westerberg wrote:
>> On Sun, Oct 29, 2017 at 11:09:50AM +0100, Marek Vasut wrote:
>>> On 10/29/2017 10:57 AM, sathyanarayanan.kuppuswamy@linux.intel.com wrote:
>>>> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>>>>
>>>> This patch adds PCI IDs for Intel Lewisburg PCH SPI serial flash controller.
>>>>
>>>> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>>> Culling the CC list and adding relevant people.
>>> Patch looks IMO OK, but I'd like RB from Mika.
>> There is already a patch for Lewisburg queued for v4.15 here:
>>
>> http://git.infradead.org/l2-mtd.git/commitdiff/d92b0f18a2039ff736b4296ad3cf3d505512051e
> Heh, even better. Why does this patch add another ID ?
0xA1A4 - its for production SKUs.
0xA224 - Its for super SKUs

Mika, Shall I re-base this patch to add super SKU ID?
