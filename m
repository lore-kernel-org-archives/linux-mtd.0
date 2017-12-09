Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eNoAT-000266-TE
 for linux-mtd@lists.infradead.org; Sat, 09 Dec 2017 23:04:28 +0000
Received: by mail-pl0-x242.google.com with SMTP id s10so2417099plj.5
 for <linux-mtd@lists.infradead.org>; Sat, 09 Dec 2017 15:04:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171128140210.34215e19@xps13>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <20171128140210.34215e19@xps13>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sat, 9 Dec 2017 20:04:02 -0300
Message-ID: <CAAEAJfC0NfYFr2XdKZLtoMv_EQP-vyfu9T+ssVtuOtyjNO1LYA@mail.gmail.com>
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
To: Miquel RAYNAL <miquel.raynal@free-electrons.com>,
 =?UTF-8?Q?Sean_Nyekj=C3=A6r?= <sean.nyekjaer@prevas.dk>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Kasper Revsbech (KREV)" <krev@triax.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sean,

On 28 November 2017 at 10:02, Miquel RAYNAL
<miquel.raynal@free-electrons.com> wrote:
> Hi Sean,
>
>> I'm currently in the process of doing bringup on a custom armada 38x
>> board. During the firsts boots of the Linux kernel we saw that the
>> NAND driver throws a lot of timeout messages.
>>
>> Like this:
>> [ 28.321054] pxa3xx-nand f10d0000.flash: Wait time out!!!
>> [ 28.521054] pxa3xx-nand f10d0000.flash: Wait time out!!!
>> [ 28.721054] pxa3xx-nand f10d0000.flash: Wait time out!!!
>
> Could you paste the entire dmesg please ?
>
> Also, what kernel are you using ?
>
>>
>> That lead me to investigate the issue and found this thread (quite
>> old): https://www.spinics.net/lists/arm-kernel/msg488581.html
>>
>> In the thread some is describing a possible race condition when the
>> NAND framework is scanning for bad blocks.
>
> Not sure this is still relevant, but, who knows.
>

As far as I can recall, there isn't any possible race condition.
The pxa3xx-nand driver should be stable.

See: https://www.spinics.net/lists/arm-kernel/msg476955.html,
where I explain this.

The timeout described by that thread was caused by not using
CONFIG_PREEMPT. Just like I have described on that thread,
not using a preemptable kernel increases latency, causing
issues on drivers that are not prepared for it.

You can find the analysis of that particular timeout here:

https://www.spinics.net/lists/arm-kernel/msg487956.html

BTW, you need a very good, a *very* good, reason
not to use CONFIG_PREEMPT.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
