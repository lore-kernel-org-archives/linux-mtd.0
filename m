Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UEyPT-0000a7-GA
 for linux-mtd@lists.infradead.org; Mon, 11 Mar 2013 08:48:45 +0000
Message-ID: <1362991772.5101.60.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 0/4] mtd-utils: integck improvements
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Elie De Brauwer <eliedebrauwer@gmail.com>
Date: Mon, 11 Mar 2013 10:49:32 +0200
In-Reply-To: <1362163060-5629-1-git-send-email-eliedebrauwer@gmail.com>
References: <1362163060-5629-1-git-send-email-eliedebrauwer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2013-03-01 at 19:37 +0100, Elie De Brauwer wrote:
> Hello all,
> 
> The past couple of days I've been doing some NAND stress testing on an
> i.MX28 platform. So far my observation is that at a certain point 
> integck writes a buffer, then tries to verify this data, concludes the
> buffer is not what it was written and fails. However the file it saves
> (and the contents on flash) appear to be the correct data, hence the 
> standard integck wasn't very useful in assisting troubleshooting this 
> issue (which only appears once every couple of hours). 

Hi, first of all - thanks for the hard work and the fixes. This test was
use on early days when we were developing UBIFS, and was extremely
useful for us. But we mostly used it with nandsim.

When UBIFS became stable, I add ed the "power cut emulation" support
there, and this is probably when I broke the report printing
functionality.

The test is not very cleanly written, and it is a bit of spaghetti,
which did not scare you off, and for which you get my kudos :-)

I've applied and pushed all your patches. I only briefly looked at them,
they looked OK. And I only compile-tested them. I just have not time
right now for more thorough review, and I forgot how integck works, and
your patches looked very trustworthy, so I just pushed them out.

I added your description to the commit messages. This e-mail will be
lost in the archives, but the commit messages will stay in the git
history and may be useful. Keep this in mind - put useful descriptive
comment so that they stay in the commit message, do not put all of them
to the cover letter.

I also amended few broken indentations - we indent using tabs, as a
convention. We do use spaces to fine-tune the indentation in tricky
places, but the basic style is using tabs.

Thanks!

-- 
Best Regards,
Artem Bityutskiy
