Received: from mail-wr0-x22e.google.com ([2a00:1450:400c:c0c::22e])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fC0c7-0004Tf-Kd
 for linux-mtd@lists.infradead.org; Fri, 27 Apr 2018 10:28:43 +0000
Received: by mail-wr0-x22e.google.com with SMTP id v60-v6so1263464wrc.7
 for <linux-mtd@lists.infradead.org>; Fri, 27 Apr 2018 03:28:15 -0700 (PDT)
From: Sam Lefebvre <sam.lefebvre@saleconix.be>
Subject: Re: optimizing the nand read performance by reducing interrupts from
 4 to 1
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Arnout Vandecapelle <arnout@mind.be>,
 Dries Staelens <dries.staelens@barco.com>,
 Richard Weinberger <richard@nod.at>, Han Xu <han.xu@nxp.com>,
 sam.lefebvre@essensium.com
References: <20180426154134.8270-1-sam.lefebvre@essensium.com>
 <20180426182843.02f60425@bbrezillon>
Message-ID: <9ab9b851-a8bf-f783-b5e9-998950b47900@essensium.com>
Date: Fri, 27 Apr 2018 12:27:49 +0200
MIME-Version: 1.0
In-Reply-To: <20180426182843.02f60425@bbrezillon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris

On 26/04/18 18:28, Boris Brezillon wrote:

> Hi Sam,
>
> On Thu, 26 Apr 2018 17:41:21 +0200
> Sam Lefebvre <sam.lefebvre@essensium.com> wrote:
>
> Are there any changes in this version? I don't see a changelog and the
> version number has not been incremented.

Until now we did not used version numbers. Because of time limitation
patches have been reordered and limited in such way that:

Patches 1-9 will be probably accepted.
Patches 10-13 is a solution for nand read performance improvement,
may be possibly not accepted upstream but can be useful for somebody
who want to use it in the future.

> Also, I nacked this patch in my previous review, so I'm not going to
> accept it now, unless you have strong arguments to convince me.

I will remember that these patches are based on your mail of march 5,
2018 where you suggested to reduce the number of interrupts in the
current implementation. Due to budgetary constraints, today is the
last day we are able to work on it in terms of this project.

Some measurements showed:
Reduction of 10% boot time on quad core.
Reduction of 3% boot time on dual lite.

>
> One last thing, can you Cc the relevant maintainers next time (you can
> use scripts/get_maintainers.pl to get the list).

Ok, I will check that.

Best regards,
Sam

> Regards,
>
> Boris
>
