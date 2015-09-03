Received: from mail-lb0-f179.google.com ([209.85.217.179])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXWI3-00043f-Gl
 for linux-mtd@lists.infradead.org; Thu, 03 Sep 2015 15:19:04 +0000
Received: by lbpo4 with SMTP id o4so26415884lbp.2
 for <linux-mtd@lists.infradead.org>; Thu, 03 Sep 2015 08:18:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55A912F0.7080605@vanguardiasur.com.ar>
References: <1436281707-20106-1-git-send-email-antoine.tenart@free-electrons.com>
 <20150717134159.GC10608@kwain>
 <55A912F0.7080605@vanguardiasur.com.ar>
Date: Thu, 3 Sep 2015 12:18:40 -0300
Message-ID: <CAAEAJfD=uoPksfU=vqwa00RjM_0JN=QH-UoEqPJBFyVNP7H4ew@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] mtd: pxa3xx_nand: rework the timing setup
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Antoine Tenart <antoine.tenart@free-electrons.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, zmxu@marvell.com,
 jszhang@marvell.com, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 17 July 2015 at 11:36, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> w=
rote:
> Hi Antoine,
>
> On 07/17/2015 10:41 AM, Antoine Tenart wrote:
>>
>> Hi guys,
>>
>> On Tue, Jul 07, 2015 at 05:08:23PM +0200, Antoine Tenart wrote:
>>>
>>>
>>> This series was part of a bigger one[1], which was split into smaller
>>> ones as asked by Ezequiel[2]. When we take this into account, this is
>>> v7. In addition, there was absolutely no comment for more than 1 month
>>> (since June 2nd). Given this, I really expect the series to be merge
>>> soon as other series are based on this.
>>
>>
>> Any news on this series?
>>

Antoine,

Do you think you can respin this patchset and send a new one so we
can move forward? There might be still some issues with it (16-bit support)=
,
but I think it'll be better to discuss them on a fresh patchset.

Don't forget to Cc Robert, since he's able to provide valuable input
and testing on PXA boards.

Thanks a lot,
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
