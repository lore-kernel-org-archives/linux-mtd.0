Received: from mail-la0-f50.google.com ([209.85.215.50])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZTs5D-0003RS-E0
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2015 13:46:44 +0000
Received: by labia3 with SMTP id ia3so13321410lab.3
 for <linux-mtd@lists.infradead.org>; Mon, 24 Aug 2015 06:46:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87r3mt3jpw.fsf@belgarion.home>
References: <1439323034-8820-1-git-send-email-robert.jarzmik@free.fr>
 <20150818042426.GA27858@laptop> <874mjwa1w6.fsf@belgarion.home>
 <87r3mt3jpw.fsf@belgarion.home>
Date: Mon, 24 Aug 2015 10:46:18 -0300
Message-ID: <CAAEAJfD2NB+JkpwwcwRz6gWOfcNVEY2MqWGkCskf0a0WRNR9gQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd: nand: pxa3xx_nand: add register access debug
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
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

On 23 August 2015 at 16:09, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> Robert Jarzmik <robert.jarzmik@free.fr> writes:
>
>> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:
>>
>>> On 11 Aug 09:57 PM, Robert Jarzmik wrote:
>>>> Add verbose debug for register accesses. This enables easier debugging
>>>> by following where and how hardware is stimulated, and how it answers.
>>>>
>>>
>>> I really don't see why we want this patch. It's probably an useful hack=
 to
>>> use in some cases, but can't see why we would want it in mainline.
>>>
>>> Feel free to prove me wrong.
>> Why not.
>>
>> Imagine that there is a bug in the driver, such as the one with the stat=
us bits
>> clearing. You can't reproduce it, and the person who has the hardware to
>> reproduce it is not skilled enough to do any debug.
>>

So let's assume this person is not skilled enough to debug it, but it is sk=
illed
enough to rebuild a kernel (to activate the verbose debug).

Then this person can also apply a simple patch (this patch), which seems
a pretty trivial step to do.

Since you might also need some other debug traces, I'm not convinced about
pushing this particular group to mainline.

>> What are the tools and what will you ask this tester to do in order to d=
ebug and
>> solve his problem, as a good driver maintainer ?
>>
>> Amongst the drivers I wrote in the past, this approach was the most reli=
able to
>> capture traces to debug remotely.
>
> Ezequiel, do you agree with my point ?
>

I agree that the hack is useful for debugging purposes, it's just that I do=
n't
see why we want it in mainline - where we usually avoid clutter.

Also, your argument applies to all the other drivers, but that doesn't mean
we will patch them all.

Anyway, this is just my opinion. If Brian thinks differently, I have no pro=
blem
with it.

Thanks!
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
