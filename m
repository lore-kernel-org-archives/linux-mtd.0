Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aLeqt-00072T-Cp
 for linux-mtd@lists.infradead.org; Tue, 19 Jan 2016 22:34:16 +0000
From: Michael Wang <Michael.Wang@alliedtelesis.co.nz>
To: Robert Jarzmik <robert.jarzmik@free.fr>, "ezequiel@vanguardiasur.com.ar"
 <ezequiel@vanguardiasur.com.ar>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>
Subject: Re: mtd: pxa3xx_nand: issue with command time out
Date: Tue, 19 Jan 2016 22:33:46 +0000
Message-ID: <569EB9CA.9080201@alliedtelesis.co.nz>
References: <5695CEF0.1080100@alliedtelesis.co.nz>
 <87a8o9ex9r.fsf@belgarion.home> <569827BC.10601@alliedtelesis.co.nz>
 <874meddqu5.fsf@belgarion.home> <569C4ABD.6080803@alliedtelesis.co.nz>
 <87wpr6d21b.fsf@belgarion.home>
In-Reply-To: <87wpr6d21b.fsf@belgarion.home>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <A751F9391FBBB84A89CBD11916474815@atlnz.lc>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/19/2016 10:13 AM, Robert Jarzmik wrote:
>  From this analysis I think you have something broken in your platform, a=
 driver
> taking a lock and blocking the scheduling or something like that. Your ti=
meouts
> seem to come from there.
>
> If you want to add 2 prinks to validate the theory (and remove my debug l=
ogs
> which change the realtime behavior) :
>   - put one just before the "ret =3D IRQ_WAKE_THREAD";
>   - put the other on the first line of pxa3xx_nand_irq_thread()
>   - and calculate the difference.
Hi Robert,

Thank you very much for your help.

I have added the 2 printks, and I think you are right that there is=20
something
blocking the scheduling.

[  146.372745] pxa3xx_nand_irq:700 IRQ_WAKE_THREAD status=3D2
[  146.378106] pxa3xx_nand_irq_thread:643
[  146.411117] pxa3xx_nand_irq:700 IRQ_WAKE_THREAD status=3D2
[  146.537124] pxa3xx_nand_irq_thread:643
       =3D> irq thread was scheduled in 0.126 ms
[  146.541245] pxa3xx_nand_irq:700 IRQ_WAKE_THREAD status=3D2
[  146.546603] pxa3xx_nand_irq_thread:643

I will continue to investigate the cause of this delay.

Thanks,
Michael=
