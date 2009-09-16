Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mns6F-0000IW-W2
	for linux-mtd@lists.infradead.org; Wed, 16 Sep 2009 10:51:04 +0000
Subject: Re: Doubt regarding mtd test ( mtd_oobtest ) interpretation of oob
	data !
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Murali N <nalajala.murali@gmail.com>
In-Reply-To: <630851df0909160320y1721f8d8m23b0675d57558c28@mail.gmail.com>
References: <630851df0909160009w35efd6b2kb058593b59e1be66@mail.gmail.com>
	<1253093770.3778.7.camel@localhost>
	<630851df0909160320y1721f8d8m23b0675d57558c28@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 16 Sep 2009 13:50:23 +0300
Message-Id: <1253098223.3778.16.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-09-16 at 15:50 +0530, Murali N wrote:
> Hi Artem, can you please explain me a bit more about OOB_PLACE mode?.
> Also in mtd tests i have seen there is ooboffs field being used in
> OOB_AUTO mode.My doubt here was why AUTO mode cares about ooboffs
> field.ECC layout structure is defined clearly in the AUTO mode? am i
> correct? then what is the significance of ooboffs field?
> 
> i am not caring the ooboffs when the AUTO mode is selected in my
> driver? i was bit confused where it is mentioned in the MTD
> specification? can you please point to me if you have any info!!!

I do not remember all the glory details, but in short, OOB_PLACE is
used when you want to put your date to a specific _physical_ offset
withing the OOB. Very simple and straightforward. But I consider this
as legacy and I think no one should ever use this, and this should
be forbidden. I might be wrong, though.

OOB_AUTO is the sanest thing. Your OOB area may contain N small unused
regions of different length. E.g., see OneNAND's onenand_oob_64.
Different flashes have different layout. And OOB_AUTO is about
abstracting this, so all these small regions look like a contiguous
buffer to the applications. Size of this buffer is
mtd->ecclayout->oobavail bytes. You may write data do different offsets
of this buffer, and they will be automatically placed to corresponding
_physical_ offsets within the OOB. So applications do not care about
the OOB fragmentation, and always work with this _logical_ OOB_AUTO
buffer.

In OOB_AUTO case you cannot access the ECC bytes, because they are
hidden from you.

In OOB_PLACE you can, and I think it is a bad idea because it is not
applications' business to deal with ECCs. This should be hidden.

That's all I remember at this point. Nowadays we do not use OOB much.
E.g., UBI/UBIFS does not use it. Using OOB is bad, because modern
flashes may utilize _whole_ OOB for ECCs.

HTH.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
