Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SS0Ws-0004ss-FF
 for linux-mtd@lists.infradead.org; Wed, 09 May 2012 06:37:43 +0000
Date: Wed, 9 May 2012 08:37:37 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: "Philip, Avinash" <avinashphilip@ti.com>
Subject: RE: mtd oob test is failing consistently at same places in NAND flash
In-Reply-To: <518397C60809E147AF5323E0420B992E3E934DD0@DBDE01.ent.ti.com>
Message-ID: <Pine.LNX.4.64.1205090835510.27120@lnxricardw.se.axis.com>
References: <518397C60809E147AF5323E0420B992E3E934BF1@DBDE01.ent.ti.com>
 <20120508132354.GA16164@parrot.com>
 <518397C60809E147AF5323E0420B992E3E934DD0@DBDE01.ent.ti.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 8 May 2012, Philip, Avinash wrote:

> I add debugs and found bit flips from 1 to 0. The location of bit flips m=
ight vary on
> boards. But on the same board it is consistent.
>
>>> To verify further we had tried writing zeros to OOB area and read it ba=
ck.
>>> This test is passing and confirms that all OOB bits (that are
>>> programmable) are not bad.
>>
>> It does not confirm anything, bits can fail by remaining stuck at 0.
>>
>
> As bit flip is from 1 to 0, you are right. But same experiment with 0x55,
> test is passing.

Are you sure it's not the bits that happen to be 0 in 0x55 that are the=20
ones suspected of flipping?

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
