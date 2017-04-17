Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d08ZP-00047Z-WB
 for linux-mtd@lists.infradead.org; Mon, 17 Apr 2017 15:28:05 +0000
Received: by mail-wr0-x241.google.com with SMTP id l28so20714216wre.0
 for <linux-mtd@lists.infradead.org>; Mon, 17 Apr 2017 08:27:42 -0700 (PDT)
Date: Mon, 17 Apr 2017 17:27:38 +0200
From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
To: Amir Goldstein <amir73il@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Artem Bityutskiy
 <dedekind1@gmail.com>, "stable [v4.9]" <stable@vger.kernel.org>
Subject: Re: [PATCH] ubifs: Fix O_TMPFILE corner case in ubifs_link()
Message-ID: <20170417172738.199803f5@gmail.com>
In-Reply-To: <CAOQ4uxivNMjZJ3T_NmPHXNveXbs+QX=PxUkHagu9VH5Ev5Uecg@mail.gmail.com>
References: <1490864181-2192-1-git-send-email-richard@nod.at>
 <cd165532-9425-bc93-a28e-b7d383508b62@intel.com>
 <ab0a0797-7074-d53b-5863-38a84ca2a594@nod.at>
 <4c7a176b-6132-7936-a04f-d4def5e56320@nod.at>
 <646ae733-5037-3072-7151-b055a8fa1521@intel.com>
 <cbaff214-7431-2cd1-2453-156d716c0d8a@nod.at>
 <CAOQ4uxh5mZ8gCk1U=oV9b+j3k0RFcT3LozATfa3qHoYy+OMVsg@mail.gmail.com>
 <92bbb4d1-afe7-14f2-763b-051c7b12ff9e@nod.at>
 <ae2f884b-17dc-cd24-f2a5-34c6c2aa7e8c@nod.at>
 <CAOQ4uxhaYfO3m6kQ1agDg2Bm-6Xh9yxoPh93m=xpTz39gXjpAQ@mail.gmail.com>
 <2a2eebef-ed37-7829-b08f-482039306a6e@nod.at>
 <CAOQ4uxivNMjZJ3T_NmPHXNveXbs+QX=PxUkHagu9VH5Ev5Uecg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 11 Apr 2017 18:04:50 +0300
Amir Goldstein <amir73il@gmail.com> wrote:

> On Tue, Apr 11, 2017 at 1:50 PM, Richard Weinberger <richard@nod.at>
> wrote:
> > Hi!
> >
> > Am 11.04.2017 um 12:20 schrieb Amir Goldstein:  
> >> On Thu, Apr 6, 2017 at 3:26 PM, Richard Weinberger
> >> <richard@nod.at> wrote:  
> >>> Am 06.04.2017 um 14:09 schrieb Richard Weinberger:  
> >>>>> Were you able to make any progress? still working on this?
> >>>>> If this is too complicated to get in for this cycle, better
> >>>>> send a patch to disable O_TMPFILE support for ubifs and fix the
> >>>>> problem properly on followup merge cycle.
> >>>>> Because right now ubifs O_TMPFILE support is broken and breaks
> >>>>> overlayfs mount.  
> >>>>
> >>>> I have a test and currently testing it. As it looks the
> >>>> situation is less worse than I thought first. :-)  
> >>>
> >>> s/test/patch :)
> >>>  
> >>
> >> Richard,
> >>
> >> Maybe it's not my business to interfere with ubifs development and
> >> I haven't seen your patch.
> >>
> >> But on the face of it, it doesn't sound like fixing O_TMPFILE is a
> >> trivial fix, so not sure
> >> it is wise to send a patch for -rc7?...
> >>
> >> How about sending the patch to disable O_TMPFILE for -rc7 and
> >> queuing your fix for v4.12?
> >> Without any patch, v4.11 is going to have a regression with
> >> overlayfs+ubifs.  
> >
> > No need to panic.  
> 
> Who? me?  ;-)
> 
> > I verified some stuff and my first patch does the right thing but
> > not in a nice way, except in oneerror patch. In will land in -rc7.
> >  

Hi Amir, Richard

Looks like the fix didn't make it into 4.11-rc7 either, isn't it time
to just disable O_TMPFILE support in ubifs for now? Giving plenty
time for the proper fix.

Thanks
Ralph

> 
> That patch looks simple enough.
> I though you had a more complex patch in mind.
> 
> > For the next merge window I prepare patches that introduce a new
> > journal function for handling tmpfiles.
> >  
> 
> Thanks for the update.
> Cheers,
> Amir.
