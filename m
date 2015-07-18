Received: from mail-wg0-f41.google.com ([74.125.82.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZGVkn-0004WZ-9q
 for linux-mtd@lists.infradead.org; Sat, 18 Jul 2015 17:18:26 +0000
Received: by wgav7 with SMTP id v7so37092418wga.2
 for <linux-mtd@lists.infradead.org>; Sat, 18 Jul 2015 10:18:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87h9p2is8e.fsf@belgarion.home>
References: <1436281707-20106-1-git-send-email-antoine.tenart@free-electrons.com>
 <20150717134159.GC10608@kwain>
 <55A912F0.7080605@vanguardiasur.com.ar>
 <87h9p2is8e.fsf@belgarion.home>
Date: Sat, 18 Jul 2015 14:18:02 -0300
Message-ID: <CAAEAJfCcdioVQKZs9U3DP6H94BiuQ2qU21DsMKevS5+j+-XEKA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] mtd: pxa3xx_nand: rework the timing setup
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, zmxu@marvell.com,
 jszhang@marvell.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On 17 July 2015 at 14:55, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:
>
>> Hi Antoine,
>>
>> On 07/17/2015 10:41 AM, Antoine Tenart wrote:
>>> Hi guys,
>>>
>>> On Tue, Jul 07, 2015 at 05:08:23PM +0200, Antoine Tenart wrote:
>>>>
>>>> This series was part of a bigger one[1], which was split into smaller
>>>> ones as asked by Ezequiel[2]. When we take this into account, this is
>>>> v7. In addition, there was absolutely no comment for more than 1 month
>>>> (since June 2nd). Given this, I really expect the series to be merge
>>>> soon as other series are based on this.
>>>
>>> Any news on this series?
>>>
>>
>> I'll try to take a look and do some testing over the weekend.
>>
>> Robert: think you can test this on a pxa board? I have one here,
>> but it's non trivial for me to set it up.
>
> Sure, if somebody sends patches to me, it's very easy and automated, so p=
lease
> send the whole serie to robert.jarzmik@free.fr, and I'll reply to this ma=
il with
> the test result on both cm-x300 and zylonite board.
>

Here you go:

http://git.infradead.org/users/ezequielg/linux/shortlog/refs/heads/pxa3xx-n=
and-timing-rework-v2

--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
