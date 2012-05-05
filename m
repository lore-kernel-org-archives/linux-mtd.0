Received: from mail-gh0-f177.google.com ([209.85.160.177]
 helo=mail-gy0-f177.google.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SQTKE-0001Ff-EX
 for linux-mtd@lists.infradead.org; Sat, 05 May 2012 00:58:18 +0000
Received: by ghbf11 with SMTP id f11so3827504ghb.36
 for <linux-mtd@lists.infradead.org>; Fri, 04 May 2012 17:58:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN8TOE_KZQqB6gqA1ccUfQ3v+n_ZN9Hm1Q63QDkhf9GGhj7eEQ@mail.gmail.com>
References: <1336152428-24242-1-git-send-email-dedekind1@gmail.com>
 <1336153306.23481.33.camel@sauron.fi.intel.com>
 <CAN8TOE_KZQqB6gqA1ccUfQ3v+n_ZN9Hm1Q63QDkhf9GGhj7eEQ@mail.gmail.com>
Date: Fri, 4 May 2012 17:58:17 -0700
Message-ID: <CAN8TOE8uCJt1rRxNDpW-G3kLSOg77Ehy+7UnK+HKV_BugOvajA@mail.gmail.com>
Subject: Re: [PATCH 0/3] do not use s_dirt in JFFS2
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux Kernel Maling List <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 4, 2012 at 5:55 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Fri, May 4, 2012 at 10:41 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> On Fri, 2012-05-04 at 20:27 +0300, Artem Bityutskiy wrote:
>>> This patch-set makes JFFS2 file-system stop using the VFS '->write_supers()'
>>> call-back because I plan to remove it once all users are gone.
>>
>> I'd really appreciate if someone on the MTD list tested these patches.
>
> Am I crazy, or did you send the cover letter without the patches?

Sorry, I am at least a little crazy: I actually see two patches
(labelled 1/2 and 2/2) while the cover is labelled 0/3, with a
diffstat from FAT changes...

Brian
