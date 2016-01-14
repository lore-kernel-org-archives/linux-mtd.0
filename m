Subject: Re: [PATCH] mtd: nuc900_nand: read correct SMISR register
To: Brian Norris <computersforpeace@gmail.com>, Arnd Bergmann <arnd@arndb.de>
References: <9019174.GYajdpGP8V@wuerfel> <20160113215013.GS109450@google.com>
 <5830403.0pR8UVXPRZ@wuerfel> <20160114002900.GA54220@google.com>
Cc: Wan ZongShun <mcuos.com@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: Wan Zongshun <vw@iommu.org>
Message-ID: <56976BA9.2040709@iommu.org>
Date: Thu, 14 Jan 2016 17:34:33 +0800
MIME-Version: 1.0
In-Reply-To: <20160114002900.GA54220@google.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



-------- Original Message --------
> On Wed, Jan 13, 2016 at 11:02:06PM +0100, Arnd Bergmann wrote:
>> On Wednesday 13 January 2016 13:50:13 Brian Norris wrote:
>>>
>>> Looks OK to me, though I kinda hate dragging on support for
>>> obviously-unused drivers...
>>
>> Should we mark that driver in Kconfig as obviously broken then?
>
> Well, it won't be obviously broken if I apply your patch... But if
> that's the right step toward removal, then I could be OK with that.
>
>> Let's wait for Wan ZongShun to reply first, it's possible that the
>> entire w90x900 platform has come to the point where we are better off
>> removing it than fixing ancient bugs.
>
> Sounds good.

Actually, Nuvoton should still leverage this upstream w90x900 codes for 
their old and new arm chip BSP, but I am not sure their open source plan 
for the new chip now, I will check with Nuvoton for this topic, and give 
you feedback here, so please hold on its removal.

>
> Brian
>
