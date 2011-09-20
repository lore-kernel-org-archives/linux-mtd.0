Received: from b.relay.invitel.net ([62.77.203.4])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R60M8-0005wU-FI
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2011 13:27:25 +0000
Date: Tue, 20 Sep 2011 15:27:18 +0200
From: Heiko Schocher <hs@denx.de>
Subject: Re: mtd-util, flash_erase: MEMGETOOBSEL on davinci based board fail
In-reply-to: <1316522722.4849.54.camel@sauron>
To: dedekind1@gmail.com
Message-id: <4E7894B6.4000304@denx.de>
MIME-version: 1.0
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 7BIT
References: <4E784790.4010601@denx.de> <1316518076.4849.53.camel@sauron>
	<1316522722.4849.54.camel@sauron>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: hs@denx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Artem,

Artem Bityutskiy wrote:
> On Tue, 2011-09-20 at 14:27 +0300, Artem Bityutskiy wrote:
>> MTD utils tree: http://git.infradead.org/users/dedekind/mtd-utils.git
>> (use the "brian" branch)
> 
> Sorry, this is the right link:
> http://git.infradead.org/mtd-utils.git

with this tree and the brian branch I get:

root@armv5te:/home/hs/bmk/mtd-utils# ./flash_erase -j /dev/mtd7 0 0
flash_erase: error!: /dev/mtd7: unable to get NAND oobinfo
             error 22 (Invalid argument)
root@armv5te:/home/hs/bmk/mtd-utils#

:-(

As I see in mtd-util:flash_erase.c line 197:

if (ioctl(fd, MEMGETOOBSEL, &oobinfo) != 0)
              ^^^^^^^^^^^^
              this is the "old" style ... which fails ...

bye,
Heiko
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
