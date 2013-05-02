Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UXnHz-00020B-28
 for linux-mtd@lists.infradead.org; Thu, 02 May 2013 06:46:47 +0000
Message-ID: <51820C2C.1080404@freescale.com>
Date: Thu, 2 May 2013 14:48:12 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH V4 5/9] mtd: replace the hardcode with the onfi_feature()
References: <1366967337-5534-1-git-send-email-b32955@freescale.com>
 <1366967337-5534-6-git-send-email-b32955@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9BF544@DBDE04.ent.ti.com>
 <5181CC19.8000904@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9C09FC@DBDE04.ent.ti.com>
 <51820127.5060003@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9C0A2F@DBDE04.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9C0A2F@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B405=E6=9C=8802=E6=97=A5 14:17, Gupta, Pekon =E5=86=99=
=E9=81=93:
> [Pekon]: onfi_feature() is actually not useful unless someone re-scans =
the
I do not think so. :)

I think the onfi_feature() is useful in the future.
I only add the two feauture for this helper:
   [1] 16-bit and
   [2] extended parameter page

But in actually, we may add more feature to this helper, such as=20
_synchronous_.
For example, some driver may support the synchronous mode for the ONFI na=
nd.
We can use this onfi_feature() in the driver to check if the onfi nand=20
supports this
synchronous feature.

Add this helper makes the code more readable, though we introduce a=20
little redandancy.


thanks
Huang Shijie
