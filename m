Received: from mail-ie0-x232.google.com ([2607:f8b0:4001:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YlXc7-0001tY-SS
 for linux-mtd@lists.infradead.org; Fri, 24 Apr 2015 07:01:28 +0000
Received: by iedfl3 with SMTP id fl3so87407162ied.1
 for <linux-mtd@lists.infradead.org>; Fri, 24 Apr 2015 00:01:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87F60714EC601C4C83DFF1D2E3D390A0272841C2@NTXXIAMBX02.xacn.micron.com>
References: <87F60714EC601C4C83DFF1D2E3D390A02728254F@NTXXIAMBX02.xacn.micron.com>
 <20150422175021.GW32500@ld-irv-0074>
 <CACna6rwq3-Q5cKgVY_Q2Ao0Qt_ppTwG0KCUEcJVqRS-FtEEw1Q@mail.gmail.com>
 <87F60714EC601C4C83DFF1D2E3D390A0272841C2@NTXXIAMBX02.xacn.micron.com>
Date: Fri, 24 Apr 2015 09:01:04 +0200
Message-ID: <CACna6rw+U8KRTSVbhOw6qHMRJ_kcwj6ivve_xAjfpxgDBgiw=A@mail.gmail.com>
Subject: Re: [PATCH 1/6] mtd: nand_bbt: drop unnecessary header
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: =?UTF-8?B?UGV0ZXIgUGFuIOa9mOagiyAocGV0ZXJwYW5kb25nKQ==?=
 <peterpandong@micron.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 24 April 2015 at 02:36, Peter Pan =E6=BD=98=E6=A0=8B (peterpandong)
<peterpandong@micron.com> wrote:
> On 23 April 2015 at 15:47, Rafa=C5=82 Mi=C5=82ecki wrote:
>> On 22 April 2015 at 19:50, Brian Norris <computersforpeace@gmail.com>
>> wrote:
>> > On Thu, Apr 16, 2015 at 02:09:41AM +0000, Peter Pan =E6=BD=98=E6=A0=8B
>> (peterpandong) wrote:
>> >>
>> >> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>> >> Signed-off-by: Peter Pan <peterpandong@micron.com>
>> >
>> > Why are you just resending my patches? You could Ack/Reviewed-by/etc.
>> > instead...
>> >
>> > http://patchwork.ozlabs.org/patch/444604/
>>
>> That was fishy to me too, thanks for clarifying it Brian.
>>
>> Also, if you *really* need to submit somebody's patch, you *should*
>> use From to point the author to git.
>
>
> Hi Brain and Rafa=C5=82,
>
> I am really sorry for this. It is my mistake. I just start sending patch
> to community recently. If I do something improper, please tell me.
>
> I will resend Brain's and my patch with the right comment, but please loo=
k
> through this patchset if you can.

I don't think there is any need to re-send Brian's patches. I'm sure
he's aware of them :)
You may try pinging him, asking what's the status. And send your own
with an appropriate comment that it depends on other stuff.

--=20
Rafa=C5=82
