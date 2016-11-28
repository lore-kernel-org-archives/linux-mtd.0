Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBHFl-0002hO-2f
 for linux-mtd@lists.infradead.org; Mon, 28 Nov 2016 08:25:33 +0000
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for N25Q016A
To: Jagan Teki <jagannadh.teki@gmail.com>, Moritz Fischer
 <moritz.fischer@ettus.com>
References: <1468602228-25154-1-git-send-email-moritz.fischer@ettus.com>
 <CAD6G_RT84jtTYcOkW87Z-g0j9sAVuku3RCpWXHZC_DLSEFrT1w@mail.gmail.com>
CC: Brian Norris <computersforpeace@gmail.com>,
 <ezequiel@vanguardiasur.com.ar>, <moritz.fischer.private@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "David
 Woodhouse" <dwmw2@infradead.org>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <55cc1619-7cae-75c8-bad7-6dbfe233549e@atmel.com>
Date: Mon, 28 Nov 2016 09:25:09 +0100
MIME-Version: 1.0
In-Reply-To: <CAD6G_RT84jtTYcOkW87Z-g0j9sAVuku3RCpWXHZC_DLSEFrT1w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 15/07/2016 à 19:12, Jagan Teki a écrit :
> On 15 July 2016 at 22:33, Moritz Fischer <moritz.fischer@ettus.com> wrote:
>> This commit adds support in the spi-nor driver for the
>> N25Q016A, a 16Mbit SPI NOR flash from Micron.
>>
>> Cc: David Woodhouse <dwmw2@infradead.org>
>> Cc: Brian Norris <computersforpeace@gmail.com>
>> Cc: Jagan Teki <jteki@openedev.com>
>>
>> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> 
> Reviewed-by: Jagan Teki <jteki@openedev.com>
> 
Applied to git://github.com/spi-nor/linux.git

Thanks!
