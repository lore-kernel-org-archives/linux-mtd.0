Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O2WaH-0006uJ-HK
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2010 21:26:50 +0000
Received: by gyb11 with SMTP id 11so968269gyb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Apr 2010 14:26:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <r2w62cbdcd91004151403l657c17b3r48b5e8de42a862f@mail.gmail.com>
References: <5205AB2678D945D194F6372BE9297942@sisodomain.com>
	<1245698113.25547.229.camel@macbook.infradead.org>
	<E19B9A1D84D0455981E564D51B3C641F@sisodomain.com>
	<p2r62cbdcd91003310607g3507fb29gd8ecddf3d3a3dfaa@mail.gmail.com>
	<04513CE719AF46EDACC26900E39ED2F2@sisodomain.com>
	<h2u62cbdcd91004050452o6c30aa38tee35c2a41b7f4bd5@mail.gmail.com>
	<980E75202FF04069AAE27686AB103C09@sisodomain.com>
	<l2w62cbdcd91004130245v66efcb00ud03ca5a72b3e9384@mail.gmail.com>
	<D4189C368A9B4BD986B7B98A0F05953B@sisodomain.com>
	<r2w62cbdcd91004151403l657c17b3r48b5e8de42a862f@mail.gmail.com>
Date: Thu, 15 Apr 2010 23:26:48 +0200
Message-ID: <v2h62cbdcd91004151426gf17eb844m43736101f3f6a3c8@mail.gmail.com>
Subject: Re: MLC Support in JFFS2
From: massimo cirillo <maxcir@gmail.com>
To: Raghav Gupta <raghav.gupta@partner.samsung.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Amit Kumar Sharma <amitsharma.9@samsung.com>, dedekind@infradead.org,
	apgmoorthy <moorthy.apg@samsung.com>,
	Amul Kumar Saha <amul.saha@samsung.com>,
	kyungmin.park@samsung.com, linux-mtd@lists.infradead.org,
	raghav.gupta@samsung.com, v.dalal@samsung.com,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Resending the message due to a Mail Delivery
error returned by raghav.gupta@partner.samsung.com.

2010/4/15 massimo cirillo <maxcir@gmail.com>:
> yes,
> the update only at the unmount and the usage of the commit
> mark are ok for me.
>
> 2010/4/15 Raghav Gupta <raghav.gupta@partner.samsung.com>:
>> Resending it due to formatting issues. My bad.
>>
>> Hi,
>>
>>> I agree with you, and the following is my thinking.
>>> Let's suppose we have a flash with 2KB page, 128KB block,
>>> 4096 blocks (512MB as size of the flash).
>>> The cleanmarker would take one page for every block, so the
>>> wasted space is 2KB*4096=3D8MB. Instead if we put the erased
>>> info in a single block (TOKEN_BLOCK) we waste only 128KB.
>>> But we need to consider the overhead in the management of
>>> such a block. We need to store information for 4096 blocks,
>>> for example an array of 4096 bit (1=3Derased, 0=3Dnot erased),
>>> protected by ECC (against read error) and CRC (against
>>> power loss in writing the array on the block). We need 2 pages
>>> for each instance of the array. The question is: how often do we
>>> need to update this array? If we choose to update each time it is
>>> needed (that is when a block is =A0just erased and just before a block
>>> is taken from the free list), at the 32nd update we should erase the
>>> TOKEN_BLOCK and allocate a new one. IMO this overhead is
>>> unacceptable in terms of time performance. So we update the info
>>> only at the unmount and when the system is idle.
>>> Moreover, there is the problem of power loss between two updates:
>>> how to recognize at the mount that the array info is updated? In my
>>> opinion the solution is to write an invalidation mark (one page with
>>> all zeros) just after the instance of the array when the instance
>>> becomes invalid.
>>
>>
>> Yes, I agree with you. The overhead involved in updating the token block
>> on every change in the "ready_to_use" list is unacceptable.
>> So, we can update the TOKEN_BLOCK only at unmount.
>>
>> Also we can authenticate that the TOKEN_BLOCK as valid
>> by using a "valid/invalid flag"(commit mark)
>>
>> And to guard against reading of an older version of
>> a TOKEN_BLOCK (on power failure) as valid by immediately
>> deleting the block on retrieval of the 'ready_to_use' list.
>>
>> Regards,
>> Raghav Gupta
>>
>>
>>
>
