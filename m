Received: from mail-vb0-x22f.google.com ([2607:f8b0:400c:c02::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vg44p-0000wa-FT
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2013 02:51:40 +0000
Received: by mail-vb0-f47.google.com with SMTP id g10so1560383vbg.6
 for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2013 18:51:18 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAN8TOE8BV5NpX06MUGCcN2-Th=oAh9KzQUXAANRJtMi9CyrXNQ@mail.gmail.com>
References: <1384197222-23783-1-git-send-email-festevam@gmail.com>
 <528192F1.5040300@freescale.com>
 <CAN8TOE8BV5NpX06MUGCcN2-Th=oAh9KzQUXAANRJtMi9CyrXNQ@mail.gmail.com>
Date: Mon, 11 Nov 2013 18:51:17 -0800
Message-ID: <CAN8TOE82YCFSWRSfch3TX1KkU_Jm1GzT5N2EhEiV2QSuVH-HGQ@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: gpmi: Fix NULL pointer dereference
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Fabio Estevam <festevam@gmail.com>, stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 11, 2013 at 6:47 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Mon, Nov 11, 2013 at 6:31 PM, Huang Shijie <b32955@freescale.com> wrote:
>> 于 2013年11月12日 03:13, Fabio Estevam 写道:
>> In actually, this patch only fixes partial of the bug.
>>
>> When we login the rootfs, and erase all the mtd partitions, and reboot
>> the mx23 again,
>> you will meet a NULL pointer too. Why? because the
>> mx23_write_transcription_stamp() will work
>> again.
>
> But how is this reboot situation a different case? As far as the
> kernel is concerned, this reboot would be the same as any other
> boot...
>
> What NULL pointer are you talking about for this reboot case? AFAICT,
> the only identified NULL pointer was on the 'buffer' in
> mx23_write_transcription_stamp(), and Fabio's patch ensures that this
> buffer points to a proper memory region. So where's your NULL pointer?

I'm sorry, I just read Huang's response to the other patch, and I
realized I was mixing up mx23_check_transcription_stamp() and
mx23_write_transcription_stamp(). So Huang has a valid point: this
patch is incorrect. I'll resume discussion on Huang's version of this
patch.

Brian
