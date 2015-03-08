Received: from smtp07.smtpout.orange.fr ([80.12.242.129]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YUemm-0006Wb-Jn
 for linux-mtd@lists.infradead.org; Sun, 08 Mar 2015 17:14:41 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v3 5/9] mtd: pxa3xx_nand: add support for the Marvell
 Berlin nand controller
References: <1425555085-29531-1-git-send-email-antoine.tenart@free-electrons.com>
 <1425555085-29531-6-git-send-email-antoine.tenart@free-electrons.com>
 <54FA6DFC.1070904@free-electrons.com>
Date: Sun, 08 Mar 2015 18:14:11 +0100
In-Reply-To: <54FA6DFC.1070904@free-electrons.com> (Ezequiel Garcia's message
 of "Sat, 07 Mar 2015 00:18:20 -0300")
Message-ID: <87oao3xvh8.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: thomas.petazzoni@free-electrons.com, boris.brezillon@free-electrons.com,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 linux-kernel@vger.kernel.org, zmxu@marvell.com, linux-mtd@lists.infradead.org,
 jszhang@marvell.com, computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ezequiel Garcia <ezequiel.garcia@free-electrons.com> writes:

> Hi Antoine,
>
> On 03/05/2015 08:31 AM, Antoine Tenart wrote:
> [..]
>> +
>> +static struct pxa3xx_nand_flash berlin_builtin_flash_types[] = {
>> +{ "4GiB 8-bit",    0xd7ec, 128, 8192,  8,  8, 4096 },
>> +{ },
>
> IMHO, supporting a specific flash shouldn't be part of this patch.
>
> In any case, why do you need this? If you can share the details about
> this device, it would be interesting for me to take a look.
>
> This driver's open-coded, legacy-style flash detection is nasty, and the
> only reason I've kept it is to avoid breaking some wacky user with some
> old board. In fact, maybe we can just kill it so nobody thinks it's sane.

I think you'll kill the zylonite board, and I'll nack it if that's the case. At
least that's what happened when I tried to use onfi default values last time in
barebox development.

I can test your changes, but if the specific zylonite nand (ie. nand id 0xba20,
ie. pxa310 embedded flash) gets broken, I'm against the removal of the legacy
timings removal.

And all of this because zylonite is my main vehicle as pxa3xx maintainance.

Cheers.

--
Robert
