Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OmTK6-0002W6-Qz
	for linux-mtd@lists.infradead.org; Fri, 20 Aug 2010 15:16:04 +0000
Message-ID: <4C6E9C23.6060703@broadcom.com>
Date: Fri, 20 Aug 2010 08:15:47 -0700
From: "Brian Norris" <norris@broadcom.com>
MIME-Version: 1.0
To: "Shinya Kuribayashi" <shinya.kuribayashi.px@renesas.com>
Subject: Re: [PATCH v2 0/2] Deprecate ECCGETLAYOUT
References: <4C5CA4A1.1040000@broadcom.com>
	<1282154806-9420-1-git-send-email-norris@broadcom.com>
	<4C6DD170.1060807@renesas.com>
In-Reply-To: <4C6DD170.1060807@renesas.com>
Content-Type: text/plain;
 charset=iso-8859-1;
 format=flowed
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	Sneha Narnakaje <nsnehaprabha@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>, Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Sorry for the problems. I will try to explain.

On 08/19/2010 05:50 PM, Shinya Kuribayashi wrote:
> [PATCH v3 1/2] mtd: Expand nand_ecc_layout, deprecate ioctl	ECCGETLAYOUT
> [PATCH v3 2/2] (I can't find this in my inbox, by the way)

There was no PATCH v3 2/2. See below.

> I'd like to see the info about what's updated in v2, v3 when revised.

The only difference is that I actually sent the correct patch :) Again, 
I explain below.

> By the way.
>
> On 8/19/2010 3:06 AM, Brian Norris wrote:
>> Brian Norris (2):
>>    mtd: nand: Expand nand_ecc_layout, deprecate ioctl ECCGETLAYOUT
>>    mtd: nand: Expand nand_ecc_layout, deprecate ioctl ECCGETLAYOUT
>
> Two patches with the same title.  Similar symptom can be seen in your
> latest v3 post (we can't find [PATCH v3 2/2]). Perhaps something weird
> is in your repository (or git settings).

No problem with git, just my inability to express my "2 independent 
patch" problem properly.

First, I sent my original patch 08/06/2010:
[PATCH] mtd: Expand nand_ecc_layout, deprecate ioctl ECCGETLAYOUT

Realizing this may not necessarily have been the *best* way to 
accomplish my goal, I sent v2:
[PATCH v2 1/2] mtd: nand: Expand...
[PATCH v2 2/2] mtd: nand: Expand...

These two patches were supposed to be two different, independent 
approaches to the same task; with discussion over how best to do this, 
we should settle on one of the two patches. I decided (for good or for 
bad) that they didn't need a new title - they were essentially the same 
code with a slight twist. However, instead of sending two different 
patches, I sent the same one twice (my mistake).

Finally, I sent v3 to include just the missing patch:
[PATCH v3 1/2] mtd: Expand...

I only included the missing patch and called it v3.

So this leaves the important patch set as the following two independent, 
slightly different approaches to the same problem; we should choose 
between them:
[PATCH v3 1/2] mtd: Expand...
[PATCH v2 2/2] mtd: nand: Expand...

Sorry if my naming, numbering, and failure of intelligence in sending 
e-mail confused anyone. I can resend with distinct names and correct 
numbering if requested.

Thanks,
Brian
