Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBHJI-0004mg-Ar
 for linux-mtd@lists.infradead.org; Mon, 28 Nov 2016 08:29:13 +0000
Subject: Re: [PATCH] mtd: spi-nor: Add support for mr25h40
To: <linux-mtd@lists.infradead.org>
References: <OS2PR01MB007355EE4F7CBD8647D65CD8DFC50@OS2PR01MB0073.jpnprd01.prod.outlook.com>
 <CAD6G_RRTiToQScvOSCyrUn7XR9oLhoi574FabypAfPtSoMRF9g@mail.gmail.com>
 <452adce6-5f94-03bd-4752-becfe6429c1c@gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <814f244b-8dbb-e740-9d8e-a68f2575658e@atmel.com>
Date: Mon, 28 Nov 2016 09:28:49 +0100
MIME-Version: 1.0
In-Reply-To: <452adce6-5f94-03bd-4752-becfe6429c1c@gmail.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 24/10/2016 à 15:07, Marek Vasut a écrit :
> On 10/24/2016 10:09 AM, Jagan Teki wrote:
>> On Wed, Oct 5, 2016 at 1:52 PM, IWAMOTO Masahiko
>> <iwamoto@allied-telesis.co.jp> wrote:
>>>
>>> Add Everspin mr25h40 512KB MRAM to the list of supported chips.
>>>
>>> Signed-off-by: Masahiko Iwamoto <iwamoto@allied-telesis.co.jp>
>>
>> Reviewed-by: Jagan Teki <jagan@openedev.com>
>>
>> thanks!
>>
> Acked-by: Marek Vasut <marex@denx.de>
> 

Applied to git://github.com/spi-nor/linux.git

Thanks!


The patch didn't apply as is due to space instead of tab at the beginning
of lines but I've fixed it.
