Received: from bear.ext.ti.com ([192.94.94.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X2D7E-0003mT-TM
 for linux-mtd@lists.infradead.org; Wed, 02 Jul 2014 05:29:57 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: =?iso-8859-1?Q?Guido_Mart=EDnez?= <guido@vanguardiasur.com.ar>
Subject: RE: [PATCH v1 1/3] ARM: dts: am335x-bone: add support for
 beaglebone NAND cape
Date: Wed, 2 Jul 2014 05:29:25 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAF8D33@DBDE04.ent.ti.com>
References: <1403612666-31197-1-git-send-email-pekon@ti.com>
 <1403612666-31197-2-git-send-email-pekon@ti.com>
 <20140626104044.GJ28884@atomide.com> <20140626150615.GA15648@fox>
 <20980858CB6D3A4BAE95CA194937D5E73EAF8874@DBDE04.ent.ti.com>
 <20140701234219.GA27789@fox>
In-Reply-To: <20140701234219.GA27789@fox>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Tony Lindgren <tony@atomide.com>, Jason Kridner <jkridner@gmail.com>,
 linux-omap <linux-omap@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Robert Nelson <robertcnelson@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From: Guido Mart=EDnez [mailto:guido@vanguardiasur.com.ar]
>>On Tue, Jul 01, 2014 at 07:01:03AM +0000, Gupta, Pekon wrote:
>> >http://lists.infradead.org/pipermail/linux-arm-kernel/2014-June/266966.=
html
>> >
>> I don't think we need above patch.
>> Helper macro "for_each_available_child_of_node" internally takes care
>> of skipping nodes with status=3D"disabled".
>>
>> $KERNEL/include/linux/of.h
>> #define for_each_available_child_of_node(parent, child) \
>> 	for (child =3D of_get_next_available_child(parent, NULL); child !=3D NU=
LL; \
>> 	     child =3D of_get_next_available_child(parent, child))
>>
>> $KERNEL/drivers/of/base.c @@ of_get_next_available_child(...) {
>> 	...
>> 	if (!__of_device_is_available(next))
>> 			continue;
>> 	...
>Yes, that's why I suggest using that macro. It's not currently used
>in gpmc.c and my patch changes the 'for_each_child_of_node' to a
>'for_each_available_child_of_node'. Or am I missing something?
>
Oops my bad. I was probably dreaming, I already had your patch in my tree
before reviewing the code. So please ignore my previous email.

with regards, pekon
