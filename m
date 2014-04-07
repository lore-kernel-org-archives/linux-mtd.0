Received: from mail-ee0-x236.google.com ([2a00:1450:4013:c00::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WX57a-00087h-KC
 for linux-mtd@lists.infradead.org; Mon, 07 Apr 2014 08:41:39 +0000
Received: by mail-ee0-f54.google.com with SMTP id d49so383722eek.27
 for <linux-mtd@lists.infradead.org>; Mon, 07 Apr 2014 01:41:16 -0700 (PDT)
Date: Mon, 07 Apr 2014 10:41:13 +0200
From: Christian Riesch <christian.riesch@gmail.com>
To: Christoph Fritz <chf.fritz@googlemail.com>
Subject: Re: [PATCH] mtd: cfi_cmdset_0001 - fixup for PC28F512P33TFA
Message-ID: <080F496E4E3B84A0EEF7E915@[172.22.2.41]>
In-Reply-To: <1396646233.17753.237.camel@mars>
References: <1396287151.4857.50.camel@mars>
 <OFA78F5CB9.63C292B4-ONC1257CAC.006FBDC4-C1257CAC.0070B588@transmode.se>
 <1396303460.4857.111.camel@mars>
 <OFA7BCC382.7C5EA8B7-ONC1257CAD.002CA0C1-C1257CAD.002EAA92@LocalDomain>
 <OFCD64B0EF.BC0E327D-ONC1257CAD.003CE517-C1257CAD.003DCE3D@transmode.se>
 <1396364991.4850.37.camel@mars>
 <OFDA5ED549.208718B9-ONC1257CAD.0068922B-C1257CAD.006990F4@transmode.se>
 <1396393830.6474.31.camel@mars>
 <OF12157674.86C034EE-ONC1257CAE.00287492-C1257CAE.0028C422@transmode.se>
 <49896FD866D95E20142E6B80@[172.22.2.41]> <1396646233.17753.237.camel@mars>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Cc: Marius Achilles <M.Achilles@phytec.de>,
 Joakim Tjernlund <joakim.tjernlund@transmode.se>,
 Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd@lists.infradead.org,
 Andrea Adami <andrea.adami@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Christoph,

--On April 04, 2014 23:17 +0200 Christoph Fritz <chf.fritz@googlemail.com>=20
wrote:

> On Wed, 2014-04-02 at 11:04 +0200, Christian Riesch wrote:
>>
>> After reading TN-12-06 I guess the correct order should be
>>
>> 1) 0xff
>> 2) the existing 0xd0/0x70
>> 3) wait 500us
>>
>> right? Could you send a patch of the combination you tried (and that did
>> not work) for discussion?
>
> The board is back on my desk and I did some further promising tests.

Since the board is "on your desk", I guess you did the test at room=20
temperature, right? Your desk is not cooled down to -40=C2=B0C, right?

> Test-Patches are below in this mail. To give an overview, this is what
> my current git log looks like:
>

I am adding a few comments to the test cases below, I hope I got it right:

> $ git log --oneline -28
> 1acde12 Revert "TESTHACK 13: -PASSED-"
> 44de693 TESTHACK 13: -PASSED-
disable erase suspend

> 41203f3 Revert "TESTHACK 12: -PASSED-"
> 83c520c TESTHACK 12: -PASSED-
0xff + 1200us delay

> fedac61 Revert "TESTHACK 11: -FAILED-"
> e1f4df2 TESTHACK 11: -FAILED-
0xff + 1000us

> 03b705a Revert "TESTHACK 10: -FAILED-"
> 9810836 TESTHACK 10: -FAILED-
0xff + 900us

> 1ecddf2 Revert "TESTHACK 9: -FAILED-"
> 4dac438 TESTHACK 9: -FAILED-
0xff + 800us

> 42dd94f Revert "TESTHACK 8: -FAILED-"
> 850f605 TESTHACK 8: -FAILED-
0xff + 600us

> 6335821 Revert "TESTHACK 7: -PASSED-"
> 79c3298 TESTHACK 7: -PASSED-
0xff + 1024us

> 80000ee Revert "TESTHACK 6: -FAILED-"
> 0b0079f TESTHACK 6: -FAILED-
some other hack from patchwork

> 315b230 Revert "TESTHACK 5: -FAILED-"
> 0ee67b8 TESTHACK 5: -FAILED-
disable suspend on write

> 304f593 Revert "TESTHACK 4: -FAILED-"
> da72ff8 TESTHACK 4: -FAILED-
0xff+500us

> 9ccb30a Revert "TESTHACK 3: -FAILED-"
> ba6d200 TESTHACK 3: -FAILED-
0xff+500us

> a3b0dc6 Revert "TESTHACK 2: -FAILED-"
> e74d245 TESTHACK 2: -FAILED-
0xff+500us

> 7ec17ff Revert "TESTHACK 1: -FAILED-"
> 42e6185 TESTHACK 1: -FAILED-
0xff+500us added to suspend instead to suspend resume as requested by the=20
TN from Micron

> 2237c97 Revert "mtd: cfi_cmdset_0001 - fixup for PC28F512P33TFA"
>
> This NOR-flash becomes stable with delay times > 1ms, which is contrary
> to what TN-12-06 says, quote: "In all cases, the maximum delay value is
> 500=CE=BCs".

At first sight I thought it was quite strange that a delay of 1000us does=20
not solve the problem, whereas it works fine with 1024us. But then I had a=20
look at the implementation of cfi_udelay(): Actually,=20
cfi_udelay(900)/cond_resched() becomes udelay(900), cfi_udelay(1000)=20
becomes msleep(1), and cfi_udelay(1024) becomes msleep(2).

> Preferably I would go with a cleaned up version of patch "TESTHACK 12",
> after some more stress testings have been passed. What do you think?

You should thoroughly test it at -40=C2=B0C. This temperature required the=20
largest delays for the M29EW.

> I now also have a contact to Micron, so I hope they can shed some light
> on this issue.

I am looking forward to their response ;-)

Christian
