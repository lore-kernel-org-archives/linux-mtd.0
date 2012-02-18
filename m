MIME-Version: 1.0
In-Reply-To: <4F3E14BD.10705@freebox.fr>
References: <1329302008-10228-1-git-send-email-b32955@freescale.com>
 <4F3C712A.5060406@gmail.com> <4F3C7433.5030306@freescale.com>
 <4F3CE2D4.4070506@freebox.fr>
 <CAMiH66GRD97y4mK-9TCRqsQkTOoqqwVp4gREv3=0qiX_vrueGA@mail.gmail.com>
 <4F3E14BD.10705@freebox.fr>
Date: Fri, 17 Feb 2012 21:43:44 -0800
Message-ID: <CAN8TOE9q3OgKFTwQ4=mSyCJ7WsCHz2yC0hOYq_sGBrx4joB7Cg@mail.gmail.com>
Subject: Re: [PATCH] mtd: fix the wrong check condition
From: Brian Norris <computersforpeace@gmail.com>
To: Florian Fainelli <ffainelli@freebox.fr>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-arm-kernel@lists.infradead.org, Huang Shijie <b32955@freescale.com>,
 Huang Shijie <shijie8@gmail.com>, Matthieu Castet <matthieu.castet@parrot.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 17, 2012 at 12:50 AM, Florian Fainelli <ffainelli@freebox.fr> w=
rote:
> Le 02/17/12 04:07, Huang Shijie a =E9crit :
>> Sorry. I did not check the log carefully.
>>
>> the Hynix nand does _not_ pass the CRC check, but it passed the "ONFI"
>> string check.
>
> This is exactly what I saw too with a different Hynix chip, it replied ON=
FI,
> but the CRC check failed.

So your root detection issue is actually that this Hynix chip is
neither ONFI-compliant nor does it have a good ID decoding scheme,
hence the need for the ID table patch (separate; I'll review it soon).

>>
>> The log "ONFI flash detected" made me misunderstood.
>
> Yes I agree, the log is there too soon, thanks for your patch.

I agree as well. I'll ACK the other patch.

Thanks,
Brian
