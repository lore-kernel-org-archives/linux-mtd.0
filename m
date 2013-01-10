Received: from mail.pce.us.com ([69.40.160.195])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TtKFD-0005tr-Jq
 for linux-mtd@lists.infradead.org; Thu, 10 Jan 2013 15:40:40 +0000
Message-ID: <50EEE0F1.50805@itwatchdogs.com>
Date: Thu, 10 Jan 2013 09:40:33 -0600
From: Zach Sadecki <zsadecki@itwatchdogs.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: gpmi: Always report ECC stats and return max_bitflips
References: <50BD01F8.3040003@itwatchdogs.com>
 <1355147097.2657.33.camel@sauron.fi.intel.com>
 <50C5FD4A.6090405@itwatchdogs.com>
 <1355398036.3400.45.camel@sauron.fi.intel.com>
 <50CA917C.6070408@itwatchdogs.com> <50EE356A.1000108@freescale.com>
In-Reply-To: <50EE356A.1000108@freescale.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/09/2013 09:28 PM, Huang Shijie wrote:
> Dear Zach,
> I think you'd better check the patch with /scripts/checkpatch.pl 
> before you send out the patch.
> I saw many "trailing whitespace" in your patch.
>
> thanks.
>
> Huang Shijie 

I just checked it:

zach@zpc:~/git/l2-mtd$ scripts/checkpatch.pl 
0001-mtd-gpmi-Always-report-ECC-stats-and-return-max_bitf.patch
total: 0 errors, 0 warnings, 59 lines checked

0001-mtd-gpmi-Always-report-ECC-stats-and-return-max_bitf.patch has no 
obvious style problems and is ready for submission.

---

The reply to the original thread dated "Thu Dec 13 21:36:43 EST 2012" 
should be the correct patch...

Zach
