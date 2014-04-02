Received: from mail-wg0-x22c.google.com ([2a00:1450:400c:c00::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WVH6L-0005Hd-14
 for linux-mtd@lists.infradead.org; Wed, 02 Apr 2014 09:04:53 +0000
Received: by mail-wg0-f44.google.com with SMTP id m15so8743238wgh.27
 for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2014 02:04:29 -0700 (PDT)
Date: Wed, 02 Apr 2014 11:04:26 +0200
From: Christian Riesch <christian.riesch@gmail.com>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>,
 Christoph Fritz <chf.fritz@googlemail.com>
Subject: Re: [PATCH] mtd: cfi_cmdset_0001 - fixup for PC28F512P33TFA
Message-ID: <49896FD866D95E20142E6B80@[172.22.2.41]>
In-Reply-To: <OF12157674.86C034EE-ONC1257CAE.00287492-C1257CAE.0028C422@transmode.se>
References: <1396287151.4857.50.camel@mars>
 <OFA78F5CB9.63C292B4-ONC1257CAC.006FBDC4-C1257CAC.0070B588@transmode.se>
 <1396303460.4857.111.camel@mars>
 <OFA7BCC382.7C5EA8B7-ONC1257CAD.002CA0C1-C1257CAD.002EAA92@LocalDomain>
 <OFCD64B0EF.BC0E327D-ONC1257CAD.003CE517-C1257CAD.003DCE3D@transmode.se>
 <1396364991.4850.37.camel@mars>
 <OFDA5ED549.208718B9-ONC1257CAD.0068922B-C1257CAD.006990F4@transmode.se>
 <1396393830.6474.31.camel@mars>
 <OF12157674.86C034EE-ONC1257CAE.00287492-C1257CAE.0028C422@transmode.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Cc: David Woodhouse <dwmw2@infradead.org>,
 Marius Achilles <M.Achilles@phytec.de>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

--On April 02, 2014 09:25 +0200 Joakim Tjernlund=20
<joakim.tjernlund@transmode.se> wrote:

> Christoph Fritz <chf.fritz@googlemail.com> wrote on 2014/04/02 01:10:30:
>>
>> On Tue, 2014-04-01 at 21:13 +0200, Joakim Tjernlund wrote:
>> > Christoph Fritz <chf.fritz@googlemail.com> wrote on 2014/04/01
> 17:09:51:
>> > > I already tried all sorts of combinations of various delays and 0xff
>> > > writes, which can be used wasteful without impact. And yes, errors
> are

There are similar issues with the Micron M29EW that uses the=20
cfi_cmdset_0002.c driver. See TN-13-07 [1]. The fixes required by this=20
technical note were added to the driver in commit=20
420962884379bd434a7f643d0936281b2ab4b30c. Since the fixes are pretty=20
similar to those in TN-12-06, I think you should have a look that this=20
commit, in case you didn't already.

Which delays did you try? Did you try the maximum delay of 500us? For the=20
M29EW, 20us worked fine at room temperature, but at -40=C2=B0C 500us much=20
larger delays were required, therefore we set it to 500us finally.

[1]=20
http://www.micron.com/-/media/Documents/Products/Technical%20Note/NOR%20Flas=
h/tn1307_patching_linux_kernel_for_m29.pdf

>> > > happening less -- but are still happening (at for example -2=C2=B0C
> starting
>> > > udev or a filesys-bench program like bonnie++).
>> >
>> > Amazing Micron still sells these defect chips
>>
>> Yeah, and it was pain to do all these kinds of tests to get it reliably
>> working for a real world application where minus degrees can happen. For
>> me it would be no problem to keep this quirk in my private queue, but
>> involving a bigger audience seems to be right considering the facts.
>>
>> > > Sure, it's possible that I missed the holy right
>> > > delay-0xff-quirk-combination to get this NOR flash reliable working
> for
>> > > its specified temperature range. But until nobody has found it, I
> would

After reading TN-12-06 I guess the correct order should be

1) 0xff
2) the existing 0xd0/0x70
3) wait 500us

right? Could you send a patch of the combination you tried (and that did=20
not work) for discussion?

[...]

>> > > Maybe someone from Micron can help?
>> >
>> > Yes, you should contact them.
>>
>> Is there anybody out there knowing a contact without the need of going
>> through a business-ticket-support-hell ?

Christoph, see private mail.

Regards, Christian
