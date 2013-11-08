Received: from am1ehsobe001.messaging.microsoft.com ([213.199.154.204]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VecPq-0001Hz-SI
 for linux-mtd@lists.infradead.org; Fri, 08 Nov 2013 03:07:24 +0000
Message-ID: <527C5611.2030001@freescale.com>
Date: Fri, 8 Nov 2013 11:10:09 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] mtd: gpmi: fix the NULL pointer
References: <1383817597-31992-1-git-send-email-b32955@freescale.com>
 <CAOMZO5CibxEVym6Y9rPC4ExfOJkV+FQxkqPvEOkp5GtYcKoKKw@mail.gmail.com>
In-Reply-To: <CAOMZO5CibxEVym6Y9rPC4ExfOJkV+FQxkqPvEOkp5GtYcKoKKw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

=E4=BA=8E 2013=E5=B9=B411=E6=9C=8807=E6=97=A5 21:07, Fabio Estevam =E5=86=
=99=E9=81=93:
> Why buffer[FINGERPRINT_LEN + 1] instead of buffer[FINGERPRINT_LEN] ?
just for the safe guard. "+1" is to simulate the terminal '\0' of the=20
string.
Of course, it's ok to use the buffer[FINGERPINGT_LEN].

thanks
Huang Shijie
