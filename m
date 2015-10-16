Received: from mail-wi0-f181.google.com ([209.85.212.181])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zn8Dj-0005Ie-Pn
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2015 16:51:08 +0000
Received: by wijp11 with SMTP id p11so19092575wij.0
 for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2015 09:50:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20151016163709.GD108923@google.com>
References: <1444681992-4208-1-git-send-email-computersforpeace@gmail.com>
 <CAAEAJfCzVxCEA3opQU2B-wS0U+L-yK3R724W68f=95r+uMPAxg@mail.gmail.com>
 <20151016152654.GB14509@laptop.cereza>
 <20151016163709.GD108923@google.com>
Date: Fri, 16 Oct 2015 13:50:45 -0300
Message-ID: <CAAEAJfAFdVmbmMRVSeU4mGWdAh+Znkp8DpKUpXWhK6A6_S2-kQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: pxa3xx_nand: don't duplicate MTD suspend/resume
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16 October 2015 at 13:37, Brian Norris <computersforpeace@gmail.com> wro=
te:
> On Fri, Oct 16, 2015 at 12:26:54PM -0300, Ezequiel Garcia wrote:
>> On 15 Oct 03:33 PM, Ezequiel Garcia wrote:
>> > Robert:
>> >
>> > Can you test this on a platform with PM support, and make sure
>> > the NAND works fine after a resume?
>> >
>> > On 12 October 2015 at 17:33, Brian Norris <computersforpeace@gmail.com=
> wrote:
>> > > mtd_{suspend,resume}() get called from mtdcore in a class suspend/re=
sume
>> > > callback. We don't need to call them again here. In practice, this w=
ould
>> > > actually work OK, as nand_base actually handles nesting OK -- it jus=
t
>> > > might print warnings.
>> > >
>> > > Untested, but there are few (no?) users of PM for this driver AFAIK.
>> > >
>>
>> Brian,
>>
>> We discussed this on IRC, but I completely forgot about it :/
>
> No problem.
>
>> Without this patch nand_{suspend, resume} is called twice
>> (which seems harmless), tested on Armada XP-GP using nandtest.
>
> Right, I think it's incidentally harmless. But you do get this warning
> without the patch set, right?
>
>         nand_resume called for a chip which is not in suspended state
>

Yup, I get that warning.

>> Tested-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>> Acked-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>
> Pushed to l2-mtd.git
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
