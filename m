Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUrHI-0007a7-U1
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 05:30:29 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: David Mosberger <davidm@egauge.net>, Gerhard Sittig <gsi@denx.de>
Subject: RE: [REV3] mtd: nand: Prepare for Micron on-die ECC controller
 support.
Date: Tue, 1 Apr 2014 05:29:54 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAB9FD4@DBDE04.ent.ti.com>
References: <1396025800-18444-1-git-send-email-davidm@egauge.net>
 <20140329131642.GA2775@book.gsilab.sittig.org>
 <CALnQHM2whsLcM_4q76Skgjj4oVjgAbofX7iAVBgqZkPOu5UWEQ@mail.gmail.com>
 <20140331194522.GL2775@book.gsilab.sittig.org>
 <CALnQHM29vnXxpFNEe1rtgc1-yuSSy8e6hSna-WJ+=YvzZJ1pAQ@mail.gmail.com>
In-Reply-To: <CALnQHM29vnXxpFNEe1rtgc1-yuSSy8e6hSna-WJ+=YvzZJ1pAQ@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

>From: David Mosberger [mailto:davidm@egauge.net]
>>On Mon, Mar 31, 2014 at 1:45 PM, Gerhard Sittig <gsi@denx.de> wrote:
>
>> Isn't there the ONFI SETFEATURE request?  And don't you use this
>> very request to disable and enable chip internal ECC support, to
>> get the raw (uncorrected) bits after bitflips were detected?  So
>> I understand that there is support to enable this mode at will,
>> and we already have (or will have) code to do so.
>>
>> If we consider disabling on-die-ECC support when we find it
>> enabled and know it's not what the user wants to run, then the
>> next logical step might be to support enabling this feature if
>> the user wants it and the chip doesn't have it enabled at this
>> point in time.
>>
>> So I guess the buffers should get allocated as soon as the chip
>> supports on-die-ECC.  (While the allocation should only get
>> introduced in the phase where the raw-read and bitflip count gets
>> added.)
>
>The ECC-mode of the driver never changes.
>Sure, what you describe could be implemented as an additional feature
>in the future (I don't have any plans to do so since it makes little sense=
 to
>me, as no other ECC-mode uses the layout of the on-die-controller).
>
>To be honest, I'm a bit confused: on the one hand, you're asking me to
>simplify the patches into smaller pieces, on the other you seem to ask
>for new features.
>
I too would like to see ECC-mode selection based on user's choice.
So there should be mechanism to enable/disable this feature based on
DT or platform-data. And onfi_set_feature() is the correct thing to use.
This would make your patches more simple, without disturbing the generic
frame-work. If you patch causes any regression, or abruptly changes
behavior of any working driver, then it's less likely to get accepted.
So, instead of re-sending patches it's important to discuss the changes.


with regards, pekon
