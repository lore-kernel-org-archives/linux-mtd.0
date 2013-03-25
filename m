Received: from mail-pd0-f171.google.com ([209.85.192.171])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UKCIk-0003fn-1Q
 for linux-mtd@lists.infradead.org; Mon, 25 Mar 2013 18:39:22 +0000
Received: by mail-pd0-f171.google.com with SMTP id z10so612428pdj.2
 for <linux-mtd@lists.infradead.org>; Mon, 25 Mar 2013 11:39:20 -0700 (PDT)
Sender: Paul Henson <paul.b.henson@gmail.com>
Message-ID: <515099D4.1090605@acm.org>
Date: Mon, 25 Mar 2013 11:39:16 -0700
From: "Paul B. Henson" <henson@acm.org>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: i.MX28 gpmi-nand underlying geometry
References: <514FC1F1.8040500@acm.org> <514FFA64.6000205@freescale.com>
In-Reply-To: <514FFA64.6000205@freescale.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3/25/2013 12:19 AM, Huang Shijie wrote:

> But it's easy to implement it. we can add the dynamic debug code for
> the gpmi. If you want to see the geometry infor, you can enable the
> dynamic debug, and enable it in the kernel cmdline.


Thanks much for the quick response and the offer of assistance. Would it 
be possible to have the information programmatically available such that 
kobs-ng (or some other application) could read/determine it itself 
either via a sysfs node like the previous driver or some other method to 
export the information to user space? A manually triggered debug log 
would remove the need to boot an older kernel to determine the 
information, but would still require a user to transcribe the 
information from the log to kobs-ng. If the sysfs node or other export 
mechanism was only available if a particular command line option was 
supplied to the kernel to avoid contaminating the environments of people 
not interested in such a feature that would be fine.

I assume someday Freescale will update their BSP kernel to a newer 
version and run into this issue themselves :), so having this 
information available programmatically in a current kernel will perhaps 
make their lives easier someday ;).

Thanks again…
