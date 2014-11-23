Received: from mail-wg0-f47.google.com ([74.125.82.47])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XsLQL-0001fL-M4
 for linux-mtd@lists.infradead.org; Sun, 23 Nov 2014 00:53:10 +0000
Received: by mail-wg0-f47.google.com with SMTP id n12so9467832wgh.20
 for <linux-mtd@lists.infradead.org>; Sat, 22 Nov 2014 16:52:45 -0800 (PST)
Message-ID: <54712F77.9000200@vanguardiasur.com.ar>
Date: Sat, 22 Nov 2014 21:51:03 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] mtd: nand: print erase size on init
References: <1413842464-18016-1-git-send-email-zajec5@gmail.com>
 <5448344C.8020402@vanguardiasur.com.ar>
 <1414654390.23185.1.camel@sauron.fi.intel.com>
 <CACna6rzwerRpX=o4RarRnGg-FeiZpDoowqXpFM2GFz9OifOb9A@mail.gmail.com>
In-Reply-To: <CACna6rzwerRpX=o4RarRnGg-FeiZpDoowqXpFM2GFz9OifOb9A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/30/2014 09:35 AM, Rafał Miłecki wrote:
> On 30 October 2014 08:33, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> On Wed, 2014-10-22 at 19:48 -0300, Ezequiel Garcia wrote:
>>> Moreover, you have a /proc and a /sysfs interface to retrieve the erasesize:
>>>
>>> What's wrong with using any of the currently available interfaces:
>>>
>>> $ cat /sys/class/mtd/mtd0/erasesize
>>> 131072
>>>
>>> $ cat /proc/mtd | grep mtd0 | awk '{print $3}'
>>> 00020000
>>>
>>> Any reason why you want the info in the kernel log?
>>
>> When people ask for help and send their logs, it is very handy to have
>> this information there.
> 
> Oops, forgot to reply. There are two reasons for this:
> 1) It's easier to get erasesize from users/reporters when it simply
> appears in the boot log.
> 2) If user space breaks (e.g. because of wrong UBI image) we can't use
> "cat" to read the erasesize
> 

Hm.. OK. Those sound like good reasons.
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
