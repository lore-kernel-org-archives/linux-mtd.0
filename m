Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WVG3K-0003dR-MB
 for linux-mtd@lists.infradead.org; Wed, 02 Apr 2014 07:57:43 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: David Mosberger-Tang <davidm@egauge.net>, Brian Norris
 <computersforpeace@gmail.com>,
 "dmosberger@gmail.com" <dmosberger@gmail.com>
Subject: RE: [PATCH v4 5/5] mtd: nand: Improve bitflip detection for on-die
 ECC scheme.
Date: Wed, 2 Apr 2014 07:57:11 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAC05F1@DBDE04.ent.ti.com>
References: <1396308537-16013-1-git-send-email-davidm@egauge.net>
 <1396308537-16013-6-git-send-email-davidm@egauge.net>
 <20140401075020.GD6400@brian-ubuntu>
 <CALnQHM2Afp8LD6MtGQTT5jrcb9xJdYXRGD0TZ_s5GASZsbRZeg@mail.gmail.com>
 <20140401173305.GI29542@ld-irv-0074>	<20140401180128.GJ29542@ld-irv-0074>
 <CACwUX0O2TqerbTwLb-73o54BwDUc5e=0uYBCWk3Sd3oaMUSFsg@mail.gmail.com>
In-Reply-To: <CACwUX0O2TqerbTwLb-73o54BwDUc5e=0uYBCWk3Sd3oaMUSFsg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Gerhard Sittig <gsi@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

>From: dmosberger@gmail.com >Sent: Tuesday, April 01, 2014 11:44 PM
>>On Tue, Apr 1, 2014 at 12:01 PM, Brian Norris ><computersforpeace@gmail.c=
om> wrote:
>> The point is that we don't write code into the generic framework that
>> assumes Micron is the only one to implement it, if possible. This type
>> of replaceable feature is best left as a callback which can be set to
>> NULL, I think. Or if you can find a better point at which the
>> implementation specifics can be abstracted, that can work as well. But
>> regardless, my high level comment must be addressed -- you wrote this
>> code as if Micron is the only one to implement on-die ECC.
>>
>> FWIW, the Toshiba BENAND (Built-in ECC NAND) datasheet I saw doesn't
>> advertise the ability to disable its ECC, but it does report per-sector
>> bitflip information (nice!). Also, I think it hides the ECC syndrome
>> bytes from the user, so most drivers could possibly ignore the built-in
>> ECC entirely if desired.
>
>I can only make the patch as good as I know how to.
>If you need a perfect patch before doing *anything*, chances are
>the situation won't improve at all.
>
>I really don't understand when Linux kernel development stopped
>accepting improvements just because they're not perfect.  Incremental
>improvements are part and parcel of Linux development, at least that's
>what I always thought.
>
>The patch as it stands is safe and it improves on the status quo.
>If that's not good enough, fine, I tried to do my part.
>
>Really, there is no direct benefit for me to spend time getting this merge=
d.
>I'm doing it because I thought it's the right thing to do to contribute ba=
ck
>a little bit since my company by relying on Linux is really is standing on
>the shoulders of giants.
>
Some ground realities ..
Most developers (including me) are working for companies,
and so our implicit priorities become to maintain controller drivers first.
Like you we also get limited bandwidth to work on generic frameworks
(like nand_base.c) and review patches. So the actual attention given to
generic or core framework components is quite less.

(1) Thus usually whatever gets accepted first time in generic-framework
 remains as-it-is unless there is a bug reported or new feature addition.

(2) Changing a generic framework also means regress testing on multiple
 Platform, as you might accidently break some old platform or driver which
 is already in production. So it's always better to get it correct first ti=
me.

So, Brian's and my feedbacks were constructive to get things right at the
first introduction of this feature. Once it's accepted this might remain
untouched even it is sub-optimal. And Maintainer can always take a call
when a patch is good enough for acceptance.
However, there was never an intention to discourage you from submitting pat=
ches.

>I'm sorry if I have sent too many patch revisions in too short amount
>of time.  I tried to incorporate feedback and avoid duplicate comments
>by providing updated patches.  Also, I don't have much time available,
>so the longer this process takes, the less likely I'll be able to finish i=
t
>(please don't take that as a threat, it's really just my reality).
>
Having too many patch versions would un-necessary burden you only
with re-testing and cleaning. Therefore I suggested to discuss and
iron-out differences, so that there is no duplication of effort on you side=
.

I'll try to help you out with some patches from your next version, as there
are number of comments already to fix for this one. But I don't have
Micron device with on-die ECC support, so you might have to help in testing=
.
Hope that helps..

>  --david


with regards, pekon
