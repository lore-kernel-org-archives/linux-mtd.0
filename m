Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xv5xM-0003jy-Op
 for linux-mtd@lists.infradead.org; Sun, 30 Nov 2014 14:58:37 +0000
Message-ID: <547B3078.4020905@nod.at>
Date: Sun, 30 Nov 2014 15:58:00 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/6] UBI: Add accessor functions for WL data structures
References: <1417349988-9238-1-git-send-email-richard@nod.at>	<1417349988-9238-3-git-send-email-richard@nod.at>
 <CAOMZO5BVewD==3dDLBD_AwrffMBih5EG3YYfYBAfH=+wDpV=3Q@mail.gmail.com>
In-Reply-To: <CAOMZO5BVewD==3dDLBD_AwrffMBih5EG3YYfYBAfH=+wDpV=3Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 30.11.2014 um 15:55 schrieb Fabio Estevam:
> On Sun, Nov 30, 2014 at 10:19 AM, Richard Weinberger <richard@nod.at> wrote:
> 
>> +/*
>> + * ubi_for_each_free_peb - walk the UBI free RB tree.
>> + * @ubi: UBI device description object
>> + * @e: a pointer to a ubi_wl_entry to use as cursor
>> + * @pos: a pointer to RB-tree entry type to use as a loop counter
> 
> tmp_rb instead?
> 
>> + */
>> +#define ubi_for_each_free_peb(ubi, e, tmp_rb)  \
>> +       ubi_rb_for_each_entry((tmp_rb), (e), &(ubi)->free, u.rb)
>> +
>> +/*
>> + * ubi_for_each_used_peb - walk the UBI used RB tree.
>> + * @ubi: UBI device description object
>> + * @e: a pointer to a ubi_wl_entry to use as cursor
>> + * @pos: a pointer to RB-tree entry type to use as a loop counter
>> + */
> 
> tmp_rb instead?

Correct. I need a generator script for such stuff. :)

Thanks,
//richard
