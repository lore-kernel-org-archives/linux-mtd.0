Received: from mail-ob0-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T6NrE-0004KF-CK
 for linux-mtd@lists.infradead.org; Tue, 28 Aug 2012 15:37:36 +0000
Received: by obbta17 with SMTP id ta17so11374227obb.36
 for <linux-mtd@lists.infradead.org>; Tue, 28 Aug 2012 08:37:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1346167008.2848.412.camel@sauron.fi.intel.com>
References: <1345847412-24509-1-git-send-email-zajec5@gmail.com>
 <1346166478.2848.411.camel@sauron.fi.intel.com>
 <1346167008.2848.412.camel@sauron.fi.intel.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Tue, 28 Aug 2012 17:37:14 +0200
Message-ID: <CAOiHx=kGSN_7Bx=O=Akd6Kb+TMYnwDpsjiOSi84FXQ+uR2Ko0g@mail.gmail.com>
Subject: Re: [RFC][PATCH] mtd: bcm47part driver for BCM47XX chipsets
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 28 August 2012 17:16, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Tue, 2012-08-28 at 18:07 +0300, Artem Bityutskiy wrote:
>> On Sat, 2012-08-25 at 00:30 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> > This driver provides parser detecting partitions on BCM47XX flash
>> > memories. It has many differences in comparision to older BCM63XX, lik=
e:
>> > 1) Different CFE with no more trivial MAGICs
>> > 2) More partitions types (board_data, ML, POT)
>> > 3) Supporting more than 1 flash on a device
>> > which resulted in decision of writing new parser.
>> >
>> > It uses generic mtd interface and was successfully tested with Netgear
>> > WNDR4500 router which has 2 flash memories: serial one and NAND one.
>>
>> Would you please send a defconfig which I could use to compile-test
>> this?
>
> Also, why did you decide to add one more bcm partitions parser instead
> of extending the existing one to support more types?

bcm63xx and bcm47xx partitioning layout were (likely) developed
independently by two different teams, they have nothing in common
which could be reused. The bcm_tag for bcm63xx is only used there, and
the trx header for bcm47xx is used only on these systems. bcm63xx's
nvram looks also looks completely different (it has a fixed layout
instead of being key-value pairs as in bcm47xx), so there is no real
gain from trying to merge them.


Regards
Jonas
