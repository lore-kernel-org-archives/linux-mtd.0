Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f3ePi-0004PM-ND
 for linux-mtd@lists.infradead.org; Wed, 04 Apr 2018 09:09:08 +0000
Received: by mail-wr0-x229.google.com with SMTP id n2so18044697wrj.7
 for <linux-mtd@lists.infradead.org>; Wed, 04 Apr 2018 02:08:55 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] spi-nor: intel-spi: Fix atomic sequence handling
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Anthony Wong <anthony.wong@canonical.com>, Bin Meng <bmeng.cn@gmail.com>
References: <20180205113300.21270-1-mika.westerberg@linux.intel.com>
 <20180227165142.GL2424@lahna.fi.intel.com>
 <20180403134836.GD2173@lahna.fi.intel.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <cf459344-c3aa-5bf7-c013-782a402d797c@gmail.com>
Date: Wed, 4 Apr 2018 10:21:45 +0200
MIME-Version: 1.0
In-Reply-To: <20180403134836.GD2173@lahna.fi.intel.com>
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

On 04/03/2018 03:48 PM, Mika Westerberg wrote:
> On Tue, Feb 27, 2018 at 06:51:42PM +0200, Mika Westerberg wrote:
>> On Mon, Feb 05, 2018 at 02:32:59PM +0300, Mika Westerberg wrote:
>>> Changes from v1:
>>>
>>>   - Added atomic_preopcode field and only when it is set, enable atomic
>>>     sequence.
>>>   - Return -EINVAL if the requested WREN operation cannot be found from
>>>     PREOP register instead of silently pretending it is supported.
>>>   - Updated patch subject to match more closely what is being fixed.
>>
>> Any comments on these two? I did the changes Cyrille asked me to do.
> 
> Ping. If no comments, could someone pick these up please.
> 
Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

-- 
Best regards,
Marek Vasut
