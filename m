Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YzidZ-00044a-S9
 for linux-mtd@lists.infradead.org; Tue, 02 Jun 2015 09:37:34 +0000
Message-ID: <556D7946.3000909@nod.at>
Date: Tue, 02 Jun 2015 11:37:10 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v3] UBI: block: Dynamically allocate minor numbers
References: <1426613846-36598-1-git-send-email-dehrenberg@chromium.org>
 <550ADF6C.3090408@vanguardiasur.com.ar>
 <5536D5C4.1010701@vanguardiasur.com.ar>
In-Reply-To: <5536D5C4.1010701@vanguardiasur.com.ar>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: gwendal@chromium.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Dan Ehrenberg <dehrenberg@chromium.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 22.04.2015 um 00:57 schrieb Ezequiel Garcia:
> 
> 
> On 03/19/2015 11:38 AM, Ezequiel Garcia wrote:
>>
>>
>> On 03/17/2015 02:37 PM, Dan Ehrenberg wrote:
>>> This patch makes ubiblock devices have minor numbers beginning from
>>> 0, allocated dynamically independently of the ubi device/volume
>>> number. This property becomes useful because, on 32-bit architectures
>>> with LFS turned off in a userspace program, device minor numbers
>>> over 8 bits cause stat to return -EOVERFLOW. If the device number is
>>> high (>1) due to multiple MTD partitions, such an overflow will occur.
>>> While enabling LFS is clearly a nicer solution, it's often difficult
>>> to turn on in practice globally as many widely distributed packages
>>> don't work with LFS on.
>>>
>>> Other storage systems have their own workarounds, with SCSI making
>>> multiple device majors and MMC having a config option for the number
>>> of partitions per device. A completely dynamic minor numbering is
>>> simpler than these. It is unlikely that anyone is depending on a
>>> static minor number since the major is dynamic anyway. In addition,
>>> ubiblock is still relatively new, so now is the time to make such
>>> changes.
>>>
>>> Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>
>>>
>>
>> Acked-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>>
> 
> Hm.. it seems this one fell through the cracks :/ Richard?

Yep. :(
Applied to my 4.2 queue!

Thanks everyone!
//richard
