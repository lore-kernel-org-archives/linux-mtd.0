Received: from mail-vb0-x22f.google.com ([2607:f8b0:400c:c02::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V19tB-0007Py-Tx
 for linux-mtd@lists.infradead.org; Mon, 22 Jul 2013 06:46:34 +0000
Received: by mail-vb0-f47.google.com with SMTP id x14so4457435vbb.20
 for <linux-mtd@lists.infradead.org>; Sun, 21 Jul 2013 23:46:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20130720143643.GB24504@localhost>
References: <1368530125-12959-1-git-send-email-elezegarcia@gmail.com>
 <20130520123733.GB2904@localhost>
 <CALF0-+W+4NCLimsP1E+aGNLEuE9GtThsm6dNE-iyeju5ixx8Rg@mail.gmail.com>
 <1372663276.22014.29.camel@sauron.fi.intel.com>
 <20130720143643.GB24504@localhost>
Date: Sun, 21 Jul 2013 23:39:49 -0700
Message-ID: <CAN8TOE9n6e1FnR2hZ3ntWkwPBTtBNvLYyMn+GN8DMY3pROdhgA@mail.gmail.com>
Subject: Re: [PATCH 0/5] mtd: nand: Fixes and improvements on pxa3xx
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Ezequiel Garcia <elezegarcia@gmail.com>,
 Eric Miao <eric.y.miao@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Lei Wen <leiwen@marvell.com>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Maen Suleiman <maen@marvell.com>, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Neil Zhang <zhangwm@marvell.com>, Chao Xie <cxie4@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

On Sat, Jul 20, 2013 at 7:36 AM, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:
> Hi Artem,
>
> On Mon, Jul 01, 2013 at 10:21:16AM +0300, Artem Bityutskiy wrote:
>> On Fri, 2013-06-07 at 11:22 -0300, Ezequiel Garcia wrote:
>> > > Since this patch affects directly the PXA hardware, I'd like to have some
>> > > response from PXA maintainers.
>> > >
>> > > Guys, could you take a look at this?
>> > >
>> >
>> > Ping?
>>
>>
>> sorry for long delay. I simply had no time to look an any of my
>> open-source things, too busy.
>>
>> I've pushed this series to l2-mtd.git, thanks!
>>
>
> Thanks!
>
> Any chance you can push this to some branch that's included in linux-next?
> (when you get back to work, of course)

Artem's l2-mtd.git 'master' branch is already included in linux-next.
Your patch series appears to be included as the following commit (and
its parents):

commit 3f81a731d931cc66abec2d0c205c4a6ecda7dac9
Author: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date:   Tue May 14 08:15:25 2013 -0300

    mtd: nand: pxa3xx: Add support for Read parameter page command

Regards,
Brian
