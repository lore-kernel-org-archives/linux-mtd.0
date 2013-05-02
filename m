Received: from mail-vc0-f174.google.com ([209.85.220.174])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UY0zY-0002V1-MZ
 for linux-mtd@lists.infradead.org; Thu, 02 May 2013 21:24:41 +0000
Received: by mail-vc0-f174.google.com with SMTP id hf12so941596vcb.33
 for <linux-mtd@lists.infradead.org>; Thu, 02 May 2013 14:24:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <51820C2C.1080404@freescale.com>
References: <1366967337-5534-1-git-send-email-b32955@freescale.com>
 <1366967337-5534-6-git-send-email-b32955@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9BF544@DBDE04.ent.ti.com>
 <5181CC19.8000904@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9C09FC@DBDE04.ent.ti.com>
 <51820127.5060003@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9C0A2F@DBDE04.ent.ti.com>
 <51820C2C.1080404@freescale.com>
Date: Thu, 2 May 2013 14:24:17 -0700
Message-ID: <CAN8TOE9P5Op-GK6U10g2b5MGvUQOPAS=5wRY0Hx55riW7OGHiQ@mail.gmail.com>
Subject: Re: [PATCH V4 5/9] mtd: replace the hardcode with the onfi_feature()
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 1, 2013 at 11:48 PM, Huang Shijie <b32955@freescale.com> wrote:
> =D3=DA 2013=C4=EA05=D4=C202=C8=D5 14:17, Gupta, Pekon =D0=B4=B5=C0:
>
>> [Pekon]: onfi_feature() is actually not useful unless someone re-scans t=
he
>
> I do not think so. :)
>
> I think the onfi_feature() is useful in the future.
> I only add the two feauture for this helper:
>   [1] 16-bit and
>   [2] extended parameter page
>
> But in actually, we may add more feature to this helper, such as
> _synchronous_.
> For example, some driver may support the synchronous mode for the ONFI na=
nd.
> We can use this onfi_feature() in the driver to check if the onfi nand
> supports this
> synchronous feature.
>
> Add this helper makes the code more readable, though we introduce a littl=
e
> redandancy.

I agree with the thoughts here. Readability and reusability are
improved a bit by including the ONFI version check.

(BTW, I haven't forgotten this series. I had some distractions here. I
will fully test and provide my Reviewed-by/Tested-by eventually...)

Brian
