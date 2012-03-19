Received: from mail.grid-net.com ([97.65.115.2])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S9jRT-0004L3-8T
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2012 20:44:36 +0000
Message-ID: <4F679AAB.6030506@grid-net.com>
Date: Mon, 19 Mar 2012 13:44:27 -0700
From: Subodh Nijsure <snijsure@grid-net.com>
MIME-Version: 1.0
To: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
Subject: Re: [PATCH v6 0/2] patch set about the MXS-DMA
References: <1329373053-19494-1-git-send-email-b32955@freescale.com>
 <4F4D9725.3090100@freescale.com>
 <1330502098.3545.78.camel@sauron.fi.intel.com>
 <4F4DE0E5.8070808@freescale.com>
 <1330516974.3545.104.camel@sauron.fi.intel.com>
In-Reply-To: <1330516974.3545.104.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>, mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/29/2012 04:00 AM, Bityutskiy, Artem wrote:
> On Wed, 2012-02-29 at 16:25 +0800, Huang Shijie wrote:
>> Hi Artem:
>>> On Wed, 2012-02-29 at 11:10 +0800, Huang Shijie wrote:
>>>> Hi:
>>>>
>>>> ping.
>>> Is this patch-set independent or requires something like gpma patches?
>>>
>> This patch set is independent, and it does not depend upon any other
>> patches.
> Pushed both to l2-mtd.git tree, thanks. I am worried that it touches
> other subsystems like dma, sound, and mmc and there are no acks for
> those. Would be nice to get them somehow.
I am using following git

git remote -v
origin  git://git.infradead.org/mtd-2.6.git (fetch)
origin  git://git.infradead.org/mtd-2.6.git (push)

And I don't see MXS-DMA patch applied, am I looking at the wrong 
tree/branch for l2-mtd.git? Or this patch not applied to l2-mtd.git tree?


/Subodh
