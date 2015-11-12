Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwnNd-0001ru-Gm
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 08:37:18 +0000
Received: by wmww144 with SMTP id w144so190281527wmw.1
 for <linux-mtd@lists.infradead.org>; Thu, 12 Nov 2015 00:36:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20151112082617.GE24008@pengutronix.de>
References: <1447314423-31225-1-git-send-email-clabbe.montjoie@gmail.com>
 <CAH6sp9OhB3y=0GazcL5Lj-C5z-pRerncQ_KQM0xpP3nmAqF_gw@mail.gmail.com>
 <20151112082617.GE24008@pengutronix.de>
Date: Thu, 12 Nov 2015 09:36:55 +0100
Message-ID: <CAH6sp9PyGqxn6gaes=SPinXmqK5ySLax-3KZ3uu=6Y4_Uc+d5A@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: mxc_nand: fix a possible NULL dereference
From: Frans Klaver <fransklaver@gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: LABBE Corentin <clabbe.montjoie@gmail.com>, baruch@tkos.co.il,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>,
 Luis de Bethencourt <luis@debethencourt.com>, s.hauer@pengutronix.de,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 12, 2015 at 9:26 AM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Thu, Nov 12, 2015 at 09:03:11AM +0100, Frans Klaver wrote:
>> Hi,
>>
>> On Thu, Nov 12, 2015 at 8:46 AM, LABBE Corentin
>> <clabbe.montjoie@gmail.com> wrote:
>> > of_match_device could return NULL, and so cause a NULL pointer
>> > dereference later.
>>
>> Did you actually run into this? It seems to me that this driver is
>> only probed if and only if we have a match and that therefore
>> of_match_device will always return a valid pointer (it is using the
>> same match table). Am I missing something?
>
> Yes, you're missing something. The driver would probe for a dt snippet
> like:
>
>         mxc_nand {
>                 compatible =3D "foobar";
>         }
>
> In this case dev->of_node is non-NULL but of_match_device(mxcnd_dt_ids,
> dev) is.
>
> (I didn't actually test this, so there is a chance I'm wrong here. And
> if not I wonder if it is sensible at all to match the device name on
> driver name for of-created platform devices.)

Yea, looks like you're right. platform devices check a number of
things to determine a match, among which is driver name if all else
fails (platform.c, platform_match()).

Thanks,
Frans
