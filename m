Received: from mail-wi0-f169.google.com ([209.85.212.169])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SVz1a-000381-2C
 for linux-mtd@lists.infradead.org; Sun, 20 May 2012 05:49:50 +0000
Received: by wibhn14 with SMTP id hn14so1815028wib.0
 for <linux-mtd@lists.infradead.org>; Sat, 19 May 2012 22:49:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1337341125.2483.23.camel@sauron.fi.intel.com>
References: <1337245412-22222-1-git-send-email-seed95@gmail.com>
 <1337341125.2483.23.camel@sauron.fi.intel.com>
From: Sidney Amani <seed95@gmail.com>
Date: Sun, 20 May 2012 15:49:28 +1000
Message-ID: <CA+NVJM8zTDOfpWVmvgscfWi3EwAYwtum-QDaqX4gaQ3F8yskXA@mail.gmail.com>
Subject: Re: [PATCH] UBIFS: fix memory leak on error path
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Ben Gardiner <bengardiner@nanometrics.ca>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 18, 2012 at 9:38 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> I've replied to you with the counter-proposal patches which I think
> should fix this issue in a bit better way. Please, take a look - If you
> are fine with that, I can push it.
>

Agreed, your set of patches is better.

Cheers
-- 
Sidney
