Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCYmT-0000R2-Bk
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2015 19:43:50 +0000
Message-ID: <559C2BDB.6070509@nod.at>
Date: Tue, 07 Jul 2015 21:43:23 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: "Egli, Samuel" <samuel.egli@siemens.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: autoresize causes insufficient reservation of PEBs for bad PEB
 handling
References: <27E9275BC1C8554E840881B19B62BE421A8FD9@DENBGAT9EI1MSX.ww902.siemens.net>
 <CAFLxGvwLZ0YKX9f=QzAt-+AfgPgUiJMT2WfUBx3UMbX0z+mnGA@mail.gmail.com>
 <27E9275BC1C8554E840881B19B62BE421A92F3@DENBGAT9EI1MSX.ww902.siemens.net>
 <559BB24C.5080205@nod.at>
 <27E9275BC1C8554E840881B19B62BE421A9318@DENBGAT9EI1MSX.ww902.siemens.net>
 <559BB6DC.2090809@nod.at>
 <27E9275BC1C8554E840881B19B62BE421A932C@DENBGAT9EI1MSX.ww902.siemens.net>
In-Reply-To: <27E9275BC1C8554E840881B19B62BE421A932C@DENBGAT9EI1MSX.ww902.siemens.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 07.07.2015 um 13:27 schrieb Egli, Samuel:
>>>
>>> Well, in my opinion it is a workaround to define all 3 vol_size's But
>>> I would like to use the "autoresize" flag for the 3rd volume.
>>> And I'm just worried that something else is not working properly
>>> because I think it should work also with autoresize.
>>
>> Ah, I thought the issue is gone. But you still get the error that UBI
>> wants 80 PEBs, but gets only 40?
>>
> That's correct. When I use "autoresize" flag, independently of defining 
> the vol_size of the configuration volume, it will reserve only 40 PEBs 
> instead of 80 when mounting the first time.

Hm, I'm a bit puzzled because the resize operation happens after the warning
you're facing.
Maybe Artem has an idea, I suspect some tooling issue.

Thanks,
//richard
