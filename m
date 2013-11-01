Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vc9Tc-0001ZY-2A
 for linux-mtd@lists.infradead.org; Fri, 01 Nov 2013 07:49:04 +0000
Date: Fri, 1 Nov 2013 08:48:38 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Konstantin Tokarev <annulen@yandex.ru>
Subject: Re: Flashing UBIFS image to gluebi mtd
In-Reply-To: <16161383242430@web27h.yandex.ru>
Message-ID: <alpine.DEB.2.00.1311010844450.29641@lnxricardw.se.axis.com>
References: <72811383227314@web24j.yandex.ru>
 <20131031150844.GA1092@localhost> <16161383242430@web27h.yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
Content-Transfer-Encoding: 8BIT
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 31 Oct 2013, Konstantin Tokarev wrote:

>
>
> 31.10.2013, 19:08, "Ezequiel Garcia" <ezequiel.garcia@free-electrons.com>:
>> Hi Konstantin,
>>
>> On Thu, Oct 31, 2013 at 05:48:34PM +0400, Konstantin Tokarev wrote:
>>
>>>  I'm migrating rootfs of device from SquashFS on top of gluebi to UBIFS.
>>
>> Sounds like you could use ubiblock for that setup, which is suitable
>> for squashfs, and completely independent of ubifs (thus less cpu and
>> memory hungry and easier to setup).
>
> Could you elaborate this a bit more? Do you mean that block device emultaion
> layer on top of UBI + FS on top of that can work faster than UBIFS on top of
> UBI?
>
> Btw, I'm more interested in finding out in what way my UBIFS volume can be
> broken in given scenario and how can I detect it (to reflash once again,
> using UBI-aware updater this time).

You didn't mention how you overwrote your UBI partition with new data. dd 
? nandwrite ? I'm getting the impression your problem is based on the fact 
that when updating the firmware, you are using update firmware which is 
not UBI aware, and you don't get UBI-awareness on the system until you've 
done the update. A chicken-and-egg-situation. One solution in that case 
would be to have an intermediate firmware which was identical to what was 
in the device to start with but that had an UBI-aware upgrade application.

Also I don't think you mentioned exactly your old setup. I'm assuming 
squashfs on top of mtd, with no UBI involved, right?

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
