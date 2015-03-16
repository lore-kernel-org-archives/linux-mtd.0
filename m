Received: from mail-gw2-out.broadcom.com ([216.31.210.63])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXeoD-0007Wm-8g
 for linux-mtd@lists.infradead.org; Mon, 16 Mar 2015 23:52:33 +0000
Message-ID: <55076CA1.60007@broadcom.com>
Date: Mon, 16 Mar 2015 16:52:01 -0700
From: Scott Branden <sbranden@broadcom.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 2/3] Documentation: devicetree: add binding doc for
 Broadcom NAND controller
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
 <1425691129-1150-3-git-send-email-computersforpeace@gmail.com>
 <55076247.4070104@broadcom.com> <20150316233706.GL32500@ld-irv-0074>
 <550769DD.2020208@broadcom.com> <20150316234634.GN32500@ld-irv-0074>
In-Reply-To: <20150316234634.GN32500@ld-irv-0074>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Corneliu Doban <cdoban@broadcom.com>,
 Ray Jui <rjui@broadcom.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-kernel@vger.kernel.org, Jonathan Richardson <jonathar@broadcom.com>,
 Anatol Pomazao <anatol@google.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-mtd@lists.infradead.org, Dmitry Torokhov <dtor@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,


On 15-03-16 04:46 PM, Brian Norris wrote:
> On Mon, Mar 16, 2015 at 04:40:13PM -0700, Scott Branden wrote:
>>
>> On 15-03-16 04:37 PM, Brian Norris wrote:
>>> On Mon, Mar 16, 2015 at 04:07:51PM -0700, Scott Branden wrote:
>>> So, what's the standard? Company prefix? Long name? Commas? Hyphens?
>>
>> The problem with devicetree binding is there is no standard for much
>> of anything.  Some others use the vendor prefix for all their
>> binding documentation.  We can try to do the same?
>
> Ok, but we already have 3 versions for Broadcom. I can use 'brcm,' if
> that helps...

Yes, it helps if we try standardizing on the brcm vendor prefix in
Documentation/devicetree/bindings/vendor-prefixes.txt.  If you sift
through the bindings directory you will find some of the other vendors
have done the same.

Also, of note.
In Documentation/devicetree/bindings/submitting-patches.txt
it states the Documentation should be the first patch in the series.
Perhaps this helps the devicetree maintainer in reviewing bindings?

Scott

>
> Brian
>
