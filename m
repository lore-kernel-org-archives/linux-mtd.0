Received: from mail-pb0-f42.google.com ([209.85.160.42])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQh1o-0001dL-1b
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 17:45:18 +0000
Received: by mail-pb0-f42.google.com with SMTP id rr13so1283961pbb.1
 for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2014 10:44:46 -0700 (PDT)
Sender: Warner Losh <wlosh@bsdimp.com>
Content-Type: text/plain; charset=iso-8859-1
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Subject: Re: [PATCH 2/3] mtd: davinci-nand: add dts property for
 NAND_NO_SUBPAGE_WRITE option
From: Warner Losh <imp@bsdimp.com>
In-Reply-To: <532B2766.6090506@ti.com>
Date: Thu, 20 Mar 2014 11:44:43 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <D69011BE-C37F-4085-B992-45F6F32AF1D0@gmail.com>
References: <1395335184-4745-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1395335184-4745-3-git-send-email-ivan.khoronzhuk@ti.com>
 <532B2183.2080309@ti.com> <20140320172912.GW31517@norris-Latitude-E6410>
 <532B2766.6090506@ti.com>
To: Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, grygorii.strashko@ti.com,
 Russell King - ARM Linux <linux@arm.linux.org.uk>, pawel.moll@arm.com,
 ijc+devicetree@hellion.org.uk, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, Murali Karicheri <m-karicheri2@ti.com>,
 rob@landley.net, galak@codeaurora.org,
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mar 20, 2014, at 11:37 AM, Santosh Shilimkar =
<santosh.shilimkar@ti.com> wrote:

>=20
>=20
> On Thursday 20 March 2014 01:29 PM, Brian Norris wrote:
>> On Thu, Mar 20, 2014 at 01:12:35PM -0400, Santosh Shilimkar wrote:
>>> Boris,
>>=20
>> Who's Boris? And why should Boris be taking this patch? It's an MTD
>> patch.
>>=20
> I got your name completely wrong. Sorry....
>=20
>>> On Thursday 20 March 2014 01:06 PM, Ivan Khoronzhuk wrote:
>>>> From: Murali Karicheri <m-karicheri2@ti.com>
>>>>=20
>>>> After testing NAND flash with ubifs for k2hk-emv board were =
committed
>>>> that flash doesn't support subpage writing, so we can fix it by
>>>> adding a property to disable subpage write.
>>=20
>> What flash? We try to autodetect NAND as much as possible. Perhaps we
>> should be adding infrastructure support instead of hacking it with a =
DT
>> property.
>>=20
> We can't auto detect it and thats why the DT approach was taken. We
> will double check that.

I though sub page writing was one of the fields in the onfi and/or =
jedec(toggle) meta data structures. Have you looked there?

Warner
