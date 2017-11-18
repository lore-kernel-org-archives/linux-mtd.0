Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eG38a-00078U-Rh
 for linux-mtd@lists.infradead.org; Sat, 18 Nov 2017 13:26:26 +0000
Subject: Re: [PATCH 2/2] libubigen: No need to calculate crc for each
 ubi_vtbl_record
To: Rock Lee <rockdotlee@gmail.com>, linux-mtd@lists.infradead.org
Cc: rli@sierrawireless.com
References: <CAL-1w2upYyr=1C1c0t87AXo=m7ztYNvBoq4jxaSLWpxou_Omzg@mail.gmail.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <f9f71dec-619d-a231-6950-c849ee1c2344@sigma-star.at>
Date: Sat, 18 Nov 2017 14:26:00 +0100
MIME-Version: 1.0
In-Reply-To: <CAL-1w2upYyr=1C1c0t87AXo=m7ztYNvBoq4jxaSLWpxou_Omzg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Sorry for the delayed reply. Apart from being busy, I was a bit hesitant with this patch
as it wasn't immediately obvious to me what you are trying to accomplish here.

I can see the point of the patch. Since vtbl has all entries initialized to 0, the CRC
should be the same for all and it should be sufficient to calculate it just for the first
entry and then copy it.

But is there any actual issue you are trying to resolve or is it just some micro
optimization? I can hardly imagine any significant performance gain from this and
AFAIK the code works right now as is.

Also, the patch seems to be broken (some kind of white space mangling?) and doesn't
apply on my end.


Thanks,

David
