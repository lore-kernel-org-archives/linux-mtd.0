Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmBZd-0007SY-MJ
 for linux-mtd@lists.infradead.org; Thu, 06 Nov 2014 01:09:18 +0000
Date: Thu, 6 Nov 2014 09:09:20 +0800
From: Huang Shijie <shijie.huang@intel.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: remove the jedec_id/ext_id
Message-ID: <20141106010920.GA19065@shldeISGChi005.sh.intel.com>
References: <1407804896-1808-1-git-send-email-shijie.huang@intel.com>
 <1407804896-1808-2-git-send-email-shijie.huang@intel.com>
 <20141105111631.GJ22361@norris-Latitude-E6410>
 <CACna6ryvN_Srwt-JgxWht4aQfjgo0DhjqPicN8kyhJCJ91NUhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACna6ryvN_Srwt-JgxWht4aQfjgo0DhjqPicN8kyhJCJ91NUhw@mail.gmail.com>
Cc: Marek =?utf-8?B?VmHFoXV0?= <marex@denx.de>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 05, 2014 at 10:35:09PM +0100, Rafał Miłecki wrote:
> On 5 November 2014 12:16, Brian Norris <computersforpeace@gmail.com> wrote:
> > On Tue, Aug 12, 2014 at 08:54:55AM +0800, Huang Shijie wrote:
> >> The "id" array contains all the information about the JEDEC and the
> >> manufacturer ID info, this patch remove the jedec_id/ext_id from the
> >> flash_info.
> >>
> >> Signed-off-by: Huang Shijie <shijie.huang@intel.com>
> >
> > This patch does not apply any more. Can you rebase?
> 
> Hm, I've just noticed that my patch:
> "prefer more specific entries from chips database"
> http://patchwork.ozlabs.org/patch/401907/
> conflicts with this one.
> 
> I think the final solution (after somehow applying both patches)
> should be something like:
> for (len = 6; i >= 4; len--) {
>     for (tmp = 0; tmp < ARRAY_SIZE(spi_nor_ids) - 1; tmp++) {
>         if (tmp->id_len == len && !strncmp(info->id, id, info->id_len)
>             return &spi_nor_ids[tmp];
>     }
> }
> 
> Does it make sense to you?
sorry, I can not understand this code. could you please give me a full
patch for your idea? thanks

> 
> Huang: I think it'll be the most optimal to me rebase my patch on top
> on your ones.
It is okay. I will CC to you with the new patch.
> 
> Btw. I have two comments regarding 1/3 (can't find it to reply properly):
> 
> 1) Do we need the if (info->id_len) check?
yes. some chips may have short info->id_len, some chips may have long
info->id_len.

> 2) Shouldn't we use memcmp in the if (!strncmp(info->id, id, info->id_len))
I prefer to memcmp too. But i misused with strncmp.
You can send a patch to fix it. I can give you my Ack. :)

thanks
Huang Shiji
