Received: from a.relay.invitel.net ([62.77.203.3])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R6GRX-0003Du-Ox
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2011 06:38:04 +0000
Date: Wed, 21 Sep 2011 08:37:55 +0200
From: Heiko Schocher <hs@denx.de>
Subject: Re: mtd-util, flash_erase: MEMGETOOBSEL on davinci based board fail
In-reply-to: <CAN8TOE9+ZjOADOqRD7aDj8ng92bkfh9Ev5f3fSMQaEfD-=t8ow@mail.gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Message-id: <4E798643.8040400@denx.de>
MIME-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 7BIT
References: <4E784790.4010601@denx.de> <1316518076.4849.53.camel@sauron>
	<1316522722.4849.54.camel@sauron> <4E7894B6.4000304@denx.de>
	<CAN8TOE9+ZjOADOqRD7aDj8ng92bkfh9Ev5f3fSMQaEfD-=t8ow@mail.gmail.com>
Cc: Liu Shuo <b35362@freescale.com>, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: hs@denx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Brian,

Brian Norris wrote:
> Add Liu Shuo, who was interested in similar problems with `flash_erase -j'.
> 
> On Tue, Sep 20, 2011 at 6:27 AM, Heiko Schocher <hs@denx.de> wrote:
>> Artem Bityutskiy wrote:
>>> Sorry, this is the right link:
>>> http://git.infradead.org/mtd-utils.git
>> with this tree and the brian branch I get:
>>
>> root@armv5te:/home/hs/bmk/mtd-utils# ./flash_erase -j /dev/mtd7 0 0
>> flash_erase: error!: /dev/mtd7: unable to get NAND oobinfo
>>             error 22 (Invalid argument)
>> root@armv5te:/home/hs/bmk/mtd-utils#
>>
>> :-(
>>
>> As I see in mtd-util:flash_erase.c line 197:
>>
>> if (ioctl(fd, MEMGETOOBSEL, &oobinfo) != 0)
>>              ^^^^^^^^^^^^
>>              this is the "old" style ... which fails ...
> 
> Right, I haven't fixed all uses of MEMGETOOBSEL yet, and I definitely
> didn't touch flash_erase yet, although the mechanisms are available
> now.
> 
> I have provided ioctl(MEMWRITE) which, in addition to simply writing
> data, has information about write mode that should replace
> MEMGETOOBSEL. Particularly, you would be interested in
> MTD_OPS_AUTO_OOB, which should be the only autoplacement routine
> necessary. The `brian' branch that Artem mentions provides support in
> libmtd for using the MEMWRITE ioctl, but nandwrite is the only utility
> that uses it properly right now.
> 
> So the next step is for you (Heiko, Liu, or somebody else that wants
> `flash_erase -j') to replace:
> 
>     `ioctl(MEMGETOOBSEL)' plus `mtd_write_oob()'
> 
> with
> 
>     `mtd_write()' using mode `MTD_OPS_AUTO_OOB'

Thanks for your explanation! I have to look in this deeper.

> I think it shouldn't be too difficult, but I do not have testing for
> JFFS2. I recommend trying to cut out all the manual layout stuff from
> flash_erase.c and instead making sure that `legacy_auto_oob_layout()'
> has up-to-date support for old layout methods (i.e., MEMGETOOBSEL),
> then for forward progress, you only need to make sure that the
> in-kernel MTD_OPS_AUTO_OOB works as desired. No more duplication of
> "auto" layouts in nandwrite, flash_erase, and in-kernel; just
> in-kernel handling of "auto" mode and legacy libmtd functions for
> supporting the old way.
> 
> Let me know if you have questions about my MEMWRITE changes. I would
> be happy to clarify if needed.

Thanks!

bye,
Heiko
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
