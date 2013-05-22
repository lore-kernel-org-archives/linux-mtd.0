Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UeyYI-000584-7l
 for linux-mtd@lists.infradead.org; Wed, 22 May 2013 02:13:19 +0000
Message-ID: <519C2A3C.20709@freescale.com>
Date: Wed, 22 May 2013 10:15:24 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Vikram Narayanan <vikram186@gmail.com>
Subject: Re: [PATCH v6 05/10 fix] mtd: get the ECC info from the Extended
 Parameter Page
References: <51966AA7.7050007@gmail.com>
 <1369015705-4720-1-git-send-email-b32955@freescale.com>
 <5199BD45.5090100@gmail.com> <5199C159.6020401@freescale.com>
 <CAHwEkO2Wn_jLCS-4-1p6Mks-0q3Dy_kzR-j-xtX_oOAOive2VQ@mail.gmail.com>
In-Reply-To: <CAHwEkO2Wn_jLCS-4-1p6Mks-0q3Dy_kzR-j-xtX_oOAOive2VQ@mail.gmail.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 dwmw2@infradead.org, lkml <linux-kernel@vger.kernel.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA05=D4=C222=C8=D5 00:35, Vikram Narayanan =D0=B4=B5=C0:
> What if we do like this? Let's do a strict check for now. ("EPPS")
> If some chip manufacturer had _strictly_ followed the spec, i.e., any
> two bytes are valid.
> Then make the code comply with the spec.
> Any comments?
Agreed.

I will send a new patch for this.

thanks for the comment.

Huang Shijie
