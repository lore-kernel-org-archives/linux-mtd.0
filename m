Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e8kvI-0003mP-MC
 for linux-mtd@lists.infradead.org; Sun, 29 Oct 2017 10:34:34 +0000
Received: by mail-wm0-x242.google.com with SMTP id b9so10933723wmh.0
 for <linux-mtd@lists.infradead.org>; Sun, 29 Oct 2017 03:34:10 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] mtd: intel-spi: Add support for Intel Lewisburg
 SPI serial flash controller
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, cyrille.pitchen@wedev4u.fr,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 sathyaosid@gmail.com
References: <9da18c4fbcb55130164735352b5ce9ba11b9a63c.1509270992.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <630c7d49-c0cc-4d4e-27d9-5e60b797d9f7@gmail.com>
 <20171029101603.GF29656@lahna.fi.intel.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <bf02ff14-838b-4710-172b-2e789ba521c9@gmail.com>
Date: Sun, 29 Oct 2017 11:34:07 +0100
MIME-Version: 1.0
In-Reply-To: <20171029101603.GF29656@lahna.fi.intel.com>
Content-Type: text/plain; charset=utf-8
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

On 10/29/2017 11:16 AM, Mika Westerberg wrote:
> On Sun, Oct 29, 2017 at 11:09:50AM +0100, Marek Vasut wrote:
>> On 10/29/2017 10:57 AM, sathyanarayanan.kuppuswamy@linux.intel.com wrote:
>>> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>>>
>>> This patch adds PCI IDs for Intel Lewisburg PCH SPI serial flash controller.
>>>
>>> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>>
>> Culling the CC list and adding relevant people.
>> Patch looks IMO OK, but I'd like RB from Mika.
> 
> There is already a patch for Lewisburg queued for v4.15 here:
> 
> http://git.infradead.org/l2-mtd.git/commitdiff/d92b0f18a2039ff736b4296ad3cf3d505512051e

Heh, even better. Why does this patch add another ID ?

-- 
Best regards,
Marek Vasut
