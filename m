Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RvYVl-0005Cs-4H
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2012 18:14:25 +0000
Received: by yenm4 with SMTP id m4so1139261yen.36
 for <linux-mtd@lists.infradead.org>; Thu, 09 Feb 2012 10:14:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1328789269.22240.83.camel@sauron.fi.intel.com>
References: <1328736382-5798-1-git-send-email-computersforpeace@gmail.com>
 <1328789146.22240.82.camel@sauron.fi.intel.com>
 <1328789269.22240.83.camel@sauron.fi.intel.com>
Date: Thu, 9 Feb 2012 10:14:22 -0800
Message-ID: <CAN8TOE_FGbEaFbjO9q+Y+Ce_Kf6tXcg0VLT8wkWuvUbYkO=94w@mail.gmail.com>
Subject: Re: [PATCH 1/3] libmtd: perform device checking first
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Brian Foster <brian.foster@maxim-ic.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 9, 2012 at 4:07 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Thu, 2012-02-09 at 14:05 +0200, Artem Bityutskiy wrote:
>> Looks good, thanks, but could you please send a version which applies to
>> mtd-utils.git? The 3rd patch in this series does not apply.
>
> Actually, I've pushed patches 1 and 2, would you please re-send the 3rd
> one?

Perhaps I should have stated in this patch thread: these patches were
meant to be on top of your previous test patch (you asked for
comments, since you compile-tested only).

Also, I do not see patches 1 and 2 in mtd-utils.git.

I will resend your original patch + my "PATCH 3" as a new series.

Brian
