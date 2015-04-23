Received: from mail-ig0-x229.google.com ([2607:f8b0:4001:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YlBrE-0007EE-F6
 for linux-mtd@lists.infradead.org; Thu, 23 Apr 2015 07:47:36 +0000
Received: by igbyr2 with SMTP id yr2so17359694igb.0
 for <linux-mtd@lists.infradead.org>; Thu, 23 Apr 2015 00:47:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150422175021.GW32500@ld-irv-0074>
References: <87F60714EC601C4C83DFF1D2E3D390A02728254F@NTXXIAMBX02.xacn.micron.com>
 <20150422175021.GW32500@ld-irv-0074>
Date: Thu, 23 Apr 2015 09:47:14 +0200
Message-ID: <CACna6rwq3-Q5cKgVY_Q2Ao0Qt_ppTwG0KCUEcJVqRS-FtEEw1Q@mail.gmail.com>
Subject: Re: [PATCH 1/6] mtd: nand_bbt: drop unnecessary header
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>,
 =?UTF-8?B?UGV0ZXIgUGFuIOa9mOagiyAocGV0ZXJwYW5kb25nKQ==?=
 <peterpandong@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 22 April 2015 at 19:50, Brian Norris <computersforpeace@gmail.com> wrote=
:
> On Thu, Apr 16, 2015 at 02:09:41AM +0000, Peter Pan =E6=BD=98=E6=A0=8B (p=
eterpandong) wrote:
>>
>> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>> Signed-off-by: Peter Pan <peterpandong@micron.com>
>
> Why are you just resending my patches? You could Ack/Reviewed-by/etc.
> instead...
>
> http://patchwork.ozlabs.org/patch/444604/

That was fishy to me too, thanks for clarifying it Brian.

Also, if you *really* need to submit somebody's patch, you *should*
use From to point the author to git.
