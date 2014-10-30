Received: from mail-ig0-x22c.google.com ([2607:f8b0:4001:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xjows-00085w-UL
 for linux-mtd@lists.infradead.org; Thu, 30 Oct 2014 12:35:31 +0000
Received: by mail-ig0-f172.google.com with SMTP id a13so3193422igq.17
 for <linux-mtd@lists.infradead.org>; Thu, 30 Oct 2014 05:35:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1414654390.23185.1.camel@sauron.fi.intel.com>
References: <1413842464-18016-1-git-send-email-zajec5@gmail.com>
 <5448344C.8020402@vanguardiasur.com.ar>
 <1414654390.23185.1.camel@sauron.fi.intel.com>
Date: Thu, 30 Oct 2014 13:35:08 +0100
Message-ID: <CACna6rzwerRpX=o4RarRnGg-FeiZpDoowqXpFM2GFz9OifOb9A@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: print erase size on init
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On 30 October 2014 08:33, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Wed, 2014-10-22 at 19:48 -0300, Ezequiel Garcia wrote:
>> Moreover, you have a /proc and a /sysfs interface to retrieve the erases=
ize:
>>
>> What's wrong with using any of the currently available interfaces:
>>
>> $ cat /sys/class/mtd/mtd0/erasesize
>> 131072
>>
>> $ cat /proc/mtd | grep mtd0 | awk '{print $3}'
>> 00020000
>>
>> Any reason why you want the info in the kernel log?
>
> When people ask for help and send their logs, it is very handy to have
> this information there.

Oops, forgot to reply. There are two reasons for this:
1) It's easier to get erasesize from users/reporters when it simply
appears in the boot log.
2) If user space breaks (e.g. because of wrong UBI image) we can't use
"cat" to read the erasesize

--=20
Rafa=C5=82
