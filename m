Received: from mail-yx0-f197.google.com ([209.85.210.197])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MnlYZ-0006gM-Bb
	for linux-mtd@lists.infradead.org; Wed, 16 Sep 2009 03:51:51 +0000
Received: by yxe35 with SMTP id 35so15839900yxe.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Sep 2009 20:51:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090915171826.4bd7f1d4.akpm@linux-foundation.org>
References: <20090915161535.db0a6904.akpm@linux-foundation.org>
	<20090916000357.GD23923@linux-sh.org>
	<20090915171826.4bd7f1d4.akpm@linux-foundation.org>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 15 Sep 2009 23:51:25 -0400
Message-ID: <8bd0f97a0909152051s4a25b9eej581c68a3b10fda3@mail.gmail.com>
Subject: Re: 2.6.32 -mm merge plans
To: Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: kmpark@infradead.org, dedekind1@gmail.com, linux-kernel@vger.kernel.org,
	Paul Mundt <lethal@linux-sh.org>, linux-mtd@lists.infradead.org,
	dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 15, 2009 at 20:18, Andrew Morton wrote:
> On Wed, 16 Sep 2009 09:03:57 +0900 Paul Mundt wrote:
>> On Tue, Sep 15, 2009 at 04:15:35PM -0700, Andrew Morton wrote:
>> > mtd-make-onenand-genericc-more-generic.patch
>> > mtd-nand-add-page-parameter-to-all-read_page-read_page_raw-apis.patch
>> > mtd-nand-add-new-ecc-mode-ecc_hw_oob_first.patch
>> > mtd-nand-davinci-add-4-bit-ecc-support-for-large-page-nand-chips.patch
>> > mtd-nand-davinci-add-4-bit-ecc-support-for-large-page-nand-chips-updat=
e.patch
>> > mtd-jffs2-fix-read-buffer-overflow.patch
>> > mtd-prevent-a-read-from-eraseregions.patch
>> > mtd-prevent-a-read-from-regions.patch
>> > mtd-jedec_probe-fix-nec-upd29f064115-detection.patch
>> > mtdpart-memory-accessor-interface-for-mtd-layer.patch
>> >
>> > =C2=A0 -> dwmw2
>>
>> Regarding mtd-make-onenand-genericc-more-generic.patch, I'm not really
>> sure what happened. To recap:
>>
>> It was posted to the mtd list here:
>>
>> http://lists.infradead.org/pipermail/linux-mtd/2009-August/026805.html
>>
>> Kyungmin objected to the driver name change here:
>>
>> http://lists.infradead.org/pipermail/linux-mtd/2009-August/026807.html
>>
>> I pointed out that the rough rationale for the name change here:
>>
>> http://lists.infradead.org/pipermail/linux-mtd/2009-August/026808.html
>>
>> and offered to redo the patch keeping the old name if Kyungmin felt the
>> rationale wasn't valid, but received no reply. Subsequently, Artem
>> mentioned that he had merged it in to his l2-mtd-2.6.git tree here:
>>
>> http://lists.infradead.org/pipermail/linux-mtd/2009-August/026866.html
>>
>> which subsequently seems to not actually have happened.
>>
>> This is a pretty trivial patch, and I don't mind respinning it in
>> whatever form folks are content with. I had assumed given the mention
>> that it had been merged in to the l2 tree that the rationale was
>> sufficient for merging.
>
> I don't think that Artem's tree is in linux-next, so I have no
> visibility of what's happening with that patch.
>
> I do think that Artem's tree should be in linux-next.
>
> I guess I'll just hose the patch at dwmw2 and will see what happens. =C2=
=A0I
> sent it on Aug 6, with no effect.

i guess i shouldnt try and bounce a few more mtd patches through you huh ..=
.

http://git.kernel.org/?p=3Dlinux/kernel/git/vapier/blackfin.git;a=3Dshortlo=
g;h=3Dfor-mtd

hopefully they make it in this cycle (they were posted a while ago to
the mtd lists w/feedback addressed)
-mike
