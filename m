Received: from mail-vc0-f179.google.com ([209.85.220.179])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCbMn-0004Im-80
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 19:48:09 +0000
Received: by mail-vc0-f179.google.com with SMTP id k1so3568151vck.24
 for <linux-mtd@lists.infradead.org>; Mon, 04 Mar 2013 11:48:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
References: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
Date: Mon, 4 Mar 2013 11:48:05 -0800
Message-ID: <CAN8TOE8No0azN1w3qfiLM-AxwgyG=XOzLQFb4QDMmeLajS2=2Q@mail.gmail.com>
Subject: Re: [PATCH 00/12] mtd: nand: provision full ID support
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Huang Shijie <b32955@freescale.com>, Mike Dunn <mikedunn@newsguy.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Mon, Mar 4, 2013 at 8:42 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>
> Hi,
>
> this is an RFC which adds full ID support provision which Huang can then
> use to solve his problem described here:
>
> http://thread.gmane.org/gmane.linux.kernel/1428345/focus=45290
>
> But before adding full ID support, I cleaned up things a little and removed
> AG-AND support as part of the clean-up.
>
> Thanks,
> Artem.

Thanks for the cleanup work (and thanks Huang, for the initiative on
expanding the ID table). Aside from my minor comments, I'll ack
patches 1 through 11:

Acked-by: Brian Norris <computersforpeace@gmail.com>

As noted in my review, the last patch seems a little underspecified.

Brian
