Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g8J68-00082A-KB
 for linux-mtd@lists.infradead.org; Fri, 05 Oct 2018 05:56:28 +0000
Subject: Re: [RFC PATCH] mtd: maps: Get rid of the latch-addr-flash driver
To: Vignesh R <vigneshr@ti.com>, Boris Brezillon <boris.brezillon@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
CC: Aleksey Makarov <amakarov@ru.mvista.com>, Sergei Shtylyov
 <sshtylyov@ru.mvista.com>, David Griego <dgriego@mvista.com>, Kevin Hilman
 <khilman@baylibre.com>
References: <20181004224142.2181-1-boris.brezillon@bootlin.com>
 <afc00869-4cfe-b53d-e9de-7c01cd1848a2@ti.com>
From: Sekhar Nori <nsekhar@ti.com>
Message-ID: <e2a3b8fb-41a7-a131-3d32-442974c72074@ti.com>
Date: Fri, 5 Oct 2018 11:25:44 +0530
MIME-Version: 1.0
In-Reply-To: <afc00869-4cfe-b53d-e9de-7c01cd1848a2@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 05 October 2018 10:47 AM, Vignesh R wrote:
> + Sekhar, who is DaVinci port maintainer
> 
> On 05-Oct-18 4:11 AM, Boris Brezillon wrote:
>> Looks like this driver was initially added to support the NOR on the
>> DA830-EVM (Davinci) board, but the board file update was never merged.

Thats right, I just checked that too from archives.

>>
>> Keeping unused drivers just adds to the maintenance burden, so let's
>> remove it if nobody uses it.
>>
>> Cc: David Griego <dgriego@mvista.com>
>> Cc: Aleksey Makarov <amakarov@ru.mvista.com>
>> Cc: Sergei Shtylyov <sshtylyov@ru.mvista.com>
>> Cc: Savinay Dharmappa <savinay.dharmappa@ti.com>
>> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
>> ---
>> Hi,
>>
>> If anyone cares about this driver, please raise your voice. If I have no
>> news before the 4.21 (5.1?) merge window, I'll merge the patch.

No objections from me. You can remove the driver.

Acked-by: Sekhar Nori <nsekhar@ti.com>

Thanks,
Sekhar
