Received: from co9ehsobe003.messaging.microsoft.com ([207.46.163.26]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UVFoK-0001Pz-0B
 for linux-mtd@lists.infradead.org; Thu, 25 Apr 2013 06:37:40 +0000
Message-ID: <5178CF94.8000601@freescale.com>
Date: Thu, 25 Apr 2013 14:39:16 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH V3 1/9] mtd: add more comment for ecc_strength/ecc_size
References: <1366707297-31309-1-git-send-email-b32955@freescale.com>	<1366707297-31309-2-git-send-email-b32955@freescale.com>
 <CAN8TOE-oy=74kSKrnxG+Ve4qZfrwEYbvh6hGGquTyLu6T+UbSA@mail.gmail.com>
In-Reply-To: <CAN8TOE-oy=74kSKrnxG+Ve4qZfrwEYbvh6hGGquTyLu6T+UbSA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B404=E6=9C=8825=E6=97=A5 14:32, Brian Norris =E5=86=99=
=E9=81=93:
>>    * @numchips:          [INTERN] number of physical chips
>> >     * @chipsize:          [INTERN] the size of one chip for multichi=
p arrays
>> >     * @pagemask:          [INTERN] page number mask =3D number of (p=
ages / chip) - 1
> Brian
>
