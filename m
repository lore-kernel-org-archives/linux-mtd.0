Received: from bear.ext.ti.com ([192.94.94.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnXF3-00025F-30
 for linux-mtd@lists.infradead.org; Thu, 22 May 2014 17:57:21 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH v2] mtd: nand: omap: fix BCHx ecc.correct to return
 detected bit-flips in erased-page
Date: Thu, 22 May 2014 17:56:47 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAD5210@DBDE04.ent.ti.com>
References: <1395730699-14687-1-git-send-email-pekon@ti.com>
 <20140512203626.GS28907@ld-irv-0074>
 <20980858CB6D3A4BAE95CA194937D5E73EACDE66@DBDE04.ent.ti.com>
 <20140519122052.GA698@arch.cereza>
 <20980858CB6D3A4BAE95CA194937D5E73EACE4A3@DBDE04.ent.ti.com>
 <20140520234249.GZ28907@ld-irv-0074>
In-Reply-To: <20140520234249.GZ28907@ld-irv-0074>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From: Brian Norris [mailto:computersforpeace@gmail.com]
>
>On Tue, May 20, 2014 at 04:43:35AM +0000, Pekon Gupta wrote:
>> This fix is really important to be marked as stable, as some users of OM=
AP
>> platforms have spawning out from 3.10 and 3.12 kernel to go for producti=
on.
>> And quite a few of them might be using NAND for their booting purpose,
>> so without this patch any bit-flip on their erased-pages will not be det=
ected.
>
>Well, I don't think it's actually as dire as you say. The erased-page
>bitflips won't be flagged as -EUCLEAN, but they will be "corrected." I
>expect that this should be fine mostly.
>
>But anyway, tagged for -stable and re-queued to l2-mtd.git.
>
Thanks much from TI support team. You saved them from many
unrelated queries :-), as some newer technology MLC NAND are
showing significant number of bit-flips on erased-pages.
Some users compare do apple to apple comparison of logs on
different kernels. And so if older versions of kernel were not=20
howing bit-flips in erased-page and newer version are showing,
there is suspicion on driver.


>In the future, I may be less likely to do this kind of rebasing. Note
>that there is still a procedure for getting fixes to -stable after their
>merging:
>
><quote>
> - Send the patch, after verifying that it follows the above rules, to
>   stable@vger.kernel.org.  You must note the upstream commit ID in the
>   changelog of your submission, as well as the kernel version you wish
>   it to be applied to.
></quote>
>
Ok thanks. But I think anything going to stable would still require your Ac=
k
as maintainer. I myself be more alert next time to mark genuine ones
stable in commit log.


with regards, pekon
