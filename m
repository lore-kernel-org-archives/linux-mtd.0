Received: from mail-vb0-x229.google.com ([2607:f8b0:400c:c02::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VelVg-00032n-Np
 for linux-mtd@lists.infradead.org; Fri, 08 Nov 2013 12:50:01 +0000
Received: by mail-vb0-f41.google.com with SMTP id w8so1375186vbj.0
 for <linux-mtd@lists.infradead.org>; Fri, 08 Nov 2013 04:49:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <527C5611.2030001@freescale.com>
References: <1383817597-31992-1-git-send-email-b32955@freescale.com>
 <CAOMZO5CibxEVym6Y9rPC4ExfOJkV+FQxkqPvEOkp5GtYcKoKKw@mail.gmail.com>
 <527C5611.2030001@freescale.com>
Date: Fri, 8 Nov 2013 10:49:35 -0200
Message-ID: <CAOMZO5DpuPopY6p4uCeSoDqHRqbQ8gN3mLTUaipdPDP443DU3g@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: gpmi: fix the NULL pointer
From: Fabio Estevam <festevam@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, stable@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 8, 2013 at 1:10 AM, Huang Shijie <b32955@freescale.com> wrote:
> =E4=BA=8E 2013=E5=B9=B411=E6=9C=8807=E6=97=A5 21:07, Fabio Estevam =E5=86=
=99=E9=81=93:
>
>> Why buffer[FINGERPRINT_LEN + 1] instead of buffer[FINGERPRINT_LEN] ?
>
> just for the safe guard. "+1" is to simulate the terminal '\0' of the
> string.
> Of course, it's ok to use the buffer[FINGERPINGT_LEN].

Then please send a v2 without the +1. Let's save one byte ;-)

Regards,

Fabio Estevam
