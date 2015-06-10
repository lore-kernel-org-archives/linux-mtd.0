Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2dpN-0004Nd-Rd
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 11:05:50 +0000
Message-ID: <1433934324.14092.15.camel@sauron.fi.intel.com>
Subject: Re: [PATCH RESEND] ubifs: Introduce a mount option of force_atime.
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Date: Wed, 10 Jun 2015 14:05:24 +0300
In-Reply-To: <557812A4.8020409@cn.fujitsu.com>
References: <1433758060-18614-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1433831809.28854.17.camel@sauron.fi.intel.com> <55769D97.3010602@nod.at>
 <5577AC03.9060909@cn.fujitsu.com>
 <1433928078.14092.1.camel@sauron.fi.intel.com>
 <55780D1C.6080907@cn.fujitsu.com>
 <1433931934.14092.11.camel@sauron.fi.intel.com>
 <557812A4.8020409@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-fsdevel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, adrian.hunter@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2015-06-10 at 18:34 +0800, Dongsheng Yang wrote:
> On 06/10/2015 06:25 PM, Artem Bityutskiy wrote:
> > On Wed, 2015-06-10 at 18:10 +0800, Dongsheng Yang wrote:
> >> On 06/10/2015 05:21 PM, Artem Bityutskiy wrote:
> >>> On Wed, 2015-06-10 at 11:16 +0800, Dongsheng Yang wrote:
> >>>> Therefore, I introduced a new option named as force_atime in ubifs.
> >>>> That's a ubifs-dependent opiton and it works as a main switch, in
> >>>> a higher level compared with atime and noatime. If force_atime, we
> >>>> support the atime-related flags. Otherwise, we don't care about all of
> >>>> them in flags and don't support atime anyway.
> >>>
> >>> How bad is it to just default to relatime like other file-systems do,
> >>> comparing to what we have now?
> >>
> >> Ha, yes, that's a problem. I read it from wiki that the author think
> >> it's bad for ubifs. But I did not do a measure about it.
> >
> > Since I am one of the authors, I think we were mostly looking at the
> > full atime support, and did not really look at relatime.
> >
> >> In theory, yes, lots of writing would damage the flash. So I think
> >> just make it optional to user is a flexible way to do it. Even we
> >> want to make the default to relatime, I think it's better to keep
> >> the compatibility for a period and provide a force_atime to user.
> >>
> >> When lots of users said "okey, we are mostly choosing force_atime in our
> >> use cases.". I believe that's a safe way to make ubifs supporting
> >> atime by default.
> >
> > Let me make a step back. So what I hear is that the problem is that you
> > cannot find the original mount options. For example, when you see the
> > MNT_RELATIME flag, you do not know whether it was specified by the user
> > or it was VFS adding this flag. Is this correct?
> >
> > If it is correct, then I think we need to look at a VFS-level solution.
> > If the above is the only problem, then I'd say that introducing a custom
> > "force_atime" is a work-around for VFS limitations.
> 
> That's correct. Yes, I really want to solve it in vfs at first. But
> later, just submited this patch as a Problem-solved for us. Because I
> thought the force_atime would disappear when we decide to support
> atime by default in future.
> 
> Besides a change in VFS would cause more discussion, after a trade-off,
> I submitted this patch for ubifs. :)
> 
> But yes, there is really, at leat, a TODO entry for VFS in this
> scenario I think. If you think we need to do it rather than a
> work-around as what this patch did. I will think a better way
> in VFS for that. :)

Yes, I think a custom mount option should be the last resort solution,
for the case when other options failed.

One way would be to push this assignment down to individual
file-systems. Another way would be to have the original flags preserved
and passed to the file-system.

May be you can find a better way.
