Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mnoft-0002Eh-J7
	for linux-mtd@lists.infradead.org; Wed, 16 Sep 2009 07:11:37 +0000
Message-ID: <4AB08F43.3080603@gmail.com>
Date: Wed, 16 Sep 2009 10:09:55 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Paul Mundt <lethal@linux-sh.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, dwmw2@infradead.org,
	kmpark@infradead.org, linux-mtd@lists.infradead.org
Subject: Re: 2.6.32 -mm merge plans
References: <20090915161535.db0a6904.akpm@linux-foundation.org>
	<20090916000357.GD23923@linux-sh.org>
In-Reply-To: <20090916000357.GD23923@linux-sh.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/16/2009 03:03 AM, Paul Mundt wrote:
> On Tue, Sep 15, 2009 at 04:15:35PM -0700, Andrew Morton wrote:
>> mtd-make-onenand-genericc-more-generic.patch
>> mtd-nand-add-page-parameter-to-all-read_page-read_page_raw-apis.patch
>> mtd-nand-add-new-ecc-mode-ecc_hw_oob_first.patch
>> mtd-nand-davinci-add-4-bit-ecc-support-for-large-page-nand-chips.patch
>> mtd-nand-davinci-add-4-bit-ecc-support-for-large-page-nand-chips-update.patch
>> mtd-jffs2-fix-read-buffer-overflow.patch
>> mtd-prevent-a-read-from-eraseregions.patch
>> mtd-prevent-a-read-from-regions.patch
>> mtd-jedec_probe-fix-nec-upd29f064115-detection.patch
>> mtdpart-memory-accessor-interface-for-mtd-layer.patch
>>
>>    ->  dwmw2
>>
> Regarding mtd-make-onenand-genericc-more-generic.patch, I'm not really
> sure what happened. To recap:
>
> It was posted to the mtd list here:
>
> http://lists.infradead.org/pipermail/linux-mtd/2009-August/026805.html
>
> Kyungmin objected to the driver name change here:
>
> http://lists.infradead.org/pipermail/linux-mtd/2009-August/026807.html
>
> I pointed out that the rough rationale for the name change here:
>
> http://lists.infradead.org/pipermail/linux-mtd/2009-August/026808.html
>
> and offered to redo the patch keeping the old name if Kyungmin felt the
> rationale wasn't valid, but received no reply. Subsequently, Artem
> mentioned that he had merged it in to his l2-mtd-2.6.git tree here:
>
> http://lists.infradead.org/pipermail/linux-mtd/2009-August/026866.html
>
> which subsequently seems to not actually have happened.

Well, I did put my patch to my l2-mtd-2.6.git tree:

http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/6e6e7d0e163148c620b4807b1ffac973f9805f20

I just put it to the dunno branch which means "I did not review this".
The master branch contains the stuff I did review.

And the idea was that dwmw2 would then take a look at all these patches
and merge them. He did merge the stuff from the master branch, but did not
merge the stuff from the dunno branch (yet).

> This is a pretty trivial patch, and I don't mind respinning it in
> whatever form folks are content with. I had assumed given the mention
> that it had been merged in to the l2 tree that the rationale was
> sufficient for merging.

I know it is frustrating when maintainers ignore patches, we feel this pain
with ARM patches, for example. It is unpleasant to re-send patches 4 times,
and get zero response, not even "I have not time now" one. On the other hand,
I understand maintainers who are busy with other things.

So I just try to help by collecting people's stuff, review _some_ of it, but
I do not merge this upstream.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
