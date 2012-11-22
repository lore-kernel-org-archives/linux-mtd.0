Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TbaRY-0007oV-DR
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2012 17:20:04 +0000
Message-ID: <50AE5EB9.2070205@parrot.com>
Date: Thu, 22 Nov 2012 18:19:53 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd nand : print flash size during detection
References: <1352199836-4516-1-git-send-email-matthieu.castet@parrot.com>
 <5099FE29.1010400@freescale.com>
In-Reply-To: <5099FE29.1010400@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Huang Shijie a écrit :
> 于 2012年11月06日 19:03, Matthieu CASTET 写道:
>> This help to detect bad flash identification in case the size is not present
>> on the name (ONFI).
>>
> I think you should give us a example of "bad flash identification".
> 
> I also want to add this patch to print out the flash size during 
> detection, but not for the "bad flash identification" reason,

When Onfi support in mtd wasn't good, it could have help us to catch case of bad
support of multi-lun nand (only a size of 1 lun where used).


Matthieu
