Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5KlW-00008e-LL
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 17:35:07 +0000
Message-ID: <1331141402.3463.34.camel@sauron.fi.intel.com>
Subject: Re: df -h, du -ahx and flash size not match
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Esteban Lopez <elopez@softel.net.mx>
Date: Wed, 07 Mar 2012 19:30:02 +0200
In-Reply-To: <4F435C55.9000402@softel.net.mx>
References: <4F4285AF.30300@softel.net.mx>
 <CAN8TOE_dF1ri7cxMVBzZ9Mwqv-XCyo+mZJi1Nwhb7-OkBErU_A@mail.gmail.com>
 <4F435C55.9000402@softel.net.mx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
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

On Tue, 2012-02-21 at 08:56 +0000, Esteban Lopez wrote:
> I read the UBIFS FAQ and UBIFS documentation but all the explanation
> is about free space. I don't understand why df -h reports 236M of
> total space if I have 469762048 bytes in this partition.

I think it is also around the same set of issues. Because we do not in
advance what kind of data the FS will be holding and how it is written,
we do not really know how much data can fit to the FS. So UBIFS makes
pessimistic calculations and reports its size as the absolutely minimum
amount of space which it can fit in the worst case scenario. So in your
case UBIFS decides that in the worst case it can fit a 236M file of
uncompressible data (e.g., a movie).

This is kind of a compromise. Imagine UBIFS reported 500MiB free space,
then you write a 300MiB AVI movie, and it does not fit. So we prefer to
report the absolute minimum.

-- 
Best Regards,
Artem Bityutskiy
