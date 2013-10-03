Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRcqk-0001lB-VL
 for linux-mtd@lists.infradead.org; Thu, 03 Oct 2013 06:57:27 +0000
Date: Thu, 3 Oct 2013 08:57:01 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: JFFS2 SUMMARY prior to Linux 3.9
In-Reply-To: <CAGXu5jK_BUqkVijBZ3-bhdYWZNf9dEfbJUWRsTuuoR8LWda0qg@mail.gmail.com>
Message-ID: <alpine.DEB.2.00.1310030850020.18310@lnxricardw.se.axis.com>
References: <alpine.DEB.2.00.1309161003150.2394@lnxricardw.se.axis.com>
 <CAN8TOE8PLvcK4kuRvbRh32gg0_Y8sbwWjdcWh_xt-tgQcPb85Q@mail.gmail.com>
 <CAGXu5jK_BUqkVijBZ3-bhdYWZNf9dEfbJUWRsTuuoR8LWda0qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Transfer-Encoding: 8BIT
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?ISO-8859-15?Q?Ricard_Wanderl=F6f?= <ricardw@axis.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Linux mtd <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 2 Oct 2013, Kees Cook wrote:

> On Wed, Oct 2, 2013 at 10:57 AM, Brian Norris
> <computersforpeace@gmail.com> wrote:
>> On Mon, Sep 16, 2013 at 1:04 AM, Ricard Wanderlof
>> <ricard.wanderlof@axis.com> wrote:
>>> I've noticed that JFFS2 summary has been relieved of it's EXPERIMENTAL
>>> status since Linux 3.9 . But was it stable enough before then as well? -
>>> often the EXPERIMENTAL property lingers on longer that it really needs to.
>>
>> AFAIK, JFFS2 hasn't changed much for many releases, so its current
>> status pretty well reflects its status for many previous releases.
>>
>> Regarding the EXPERIMENTAL status; this was changed without CC'ing the
>> MTD list (although David was CC'd, it seems) in commit:
>>
>> commit cf98c5e56807af7c793497bbd0446f71c383ffd5
>> Author: Kees Cook <keescook@chromium.org>
>> Date:   Wed Jan 16 18:54:12 2013 -0800
>>
>>     fs/jffs2: remove depends on CONFIG_EXPERIMENTAL
>>
>> Judging by the commit description, this change just represents a
>> change in attitude toward the CONFIG_EXPERIMENTAL Kconfig option
>> rather than any particular judgment of JFFS2 summary support.
>
> Correct. CONFIG_EXPERIMENTAL was seen to have no meaning any more in
> the face of things like distros always turning it on because they
> wanted to enable some specific feature/device that was hiding behind
> it.
>
> Details about preferred handling of "unstable" features is documented here:
> http://git.kernel.org/linus/5a958db311c416345a61b7bddc62a5c6c7112c7f

Thanks for the clarifications and link guys.

It does seem though that if a feature really is 'experimental', it could 
still be marked as "(EXPERIMENTAL)" in Kconfig as well as having 
appropriate warnings in the help text, purely as a warning to users. I 
quite frankly wasn't aware of CONFIG_EXPERIMENTAL (which just cements the 
fact that no one really cared about that option anyway) as I hadn't 
reviewed the Kconfig file, just noticed the "(EXPERIMENTAL)" in the 
resulting menu item.

All the above points to the fact that for this particular option, 
"(EXPERIMENTAL)" was left in mostly because no one had bothered to remove 
it. There doesn't seem to be any other indication in the Kconfig that
the option is in fact unstable.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
