Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QHYHf-0000X6-94
	for linux-mtd@lists.infradead.org; Wed, 04 May 2011 09:22:16 +0000
Received: by wyb28 with SMTP id 28so869610wyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 May 2011 02:22:13 -0700 (PDT)
Message-ID: <4DC11AC2.10000@gmail.com>
Date: Wed, 04 May 2011 11:22:10 +0200
From: angelo <angelo70@gmail.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: R: jffs2 help
References: <531B6536C9F737458807DF75064873C801ED5F36E7AA@mta-digimail.MTA.INT>
In-Reply-To: <531B6536C9F737458807DF75064873C801ED5F36E7AA@mta-digimail.MTA.INT>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Daniele and Ricard,

thanks both for the help.

The free-electrons site is really a wonderful help. I couldn't find it
out through googling "mtd jffs2" still.

Anyway, still, following strictly the site help, i can eraseall, mount
jffs2, write some files, unmount, but at the next mount nothing is still
there. Option -o sync doesn't help also.
Writing files, i still get errors like

Node totlen on flash (0xffffffff) != totlen from node (0x0000000c)

I probably will move to UBIFS, but before i would like to understand why
jffs2, that should be reliable in anyway, is failing on my flash.


Regards,
angelo

On 04/05/2011 09:20, Bosi Daniele wrote:
> Angelo,
> I suggest you to start using ubi.
> Take a look to the following Free-electrons document to see a benchmark of flash file systems
>
> http://free-electrons.com/doc/flash-filesystems.pdf
>
> BTW on Free electron site you can find a lot of helpful documentation, take a look on it.
>
> Bye Daniele
>
> -----Messaggio originale-----
> Da: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists.infradead.org] Per conto di angelo
> Inviato: martedì 3 maggio 2011 18.32
> A: linux-mtd@lists.infradead.org
> Oggetto: jffs2 help
>
> hi all,
>
> i have a specific issue that seems realted to jffs2,
> i tried to subscribe to jffs2-dev list but seems no more existing.
>
> Just a suggestion, is there some jffs2 list/support still alive from
> Axis ? Is jffs2 the right way to go to store some non volatile data to a
> nor flash or is it better i move directly to UBIFS ?
>
> thanks,
> angelo
>
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>    
<http://www.sysam.it>
